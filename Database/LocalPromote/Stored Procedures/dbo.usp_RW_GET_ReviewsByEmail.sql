SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_GET_ReviewsByEmail]
/**********************************************************************************
Description   :   Get all reviews by Email
Change History

Date       Name     Description
---------- -------- ------------------------------------
06-03-2008 Johnny Kang    Initial Development
02-12-2009 bwu			  removed temp table
03-20-2009 bwu			  added partial e-mail search

EXAMPLES: 	usp_RW_GET_ReviewsByEmail 2, 'rodel.bernabe@gmail.com',1,10
		
**********************************************************************************/
	@SiteID			int,
	@Email			varchar(100),
	@CurrentPage	int,
	@PageSize		int
as


SET NOCOUNT ON

Declare @TotalRecord int
--Create variable to identify the first and last record that should be selected
DECLARE @FirstRec int, @LastRec int
SELECT @FirstRec = (@CurrentPage - 1) * @PageSize
SELECT @LastRec = (@CurrentPage * @PageSize + 1)


;With RWETable as
( 
SELECT	ROW_NUMBER() OVER(ORDER BY lReviewID ASC) as ID,
		lReviewID as ReviewID, 
		dtReview as ReviewDate, 
		szLoginEmail as LoginEmail, 
		szReviewTitle as ReviewTitle, 
		szREviewText as ReviewText, 
		szDisplayName as DisplayName, 
		lSiteID as SiteID, 
		a.sActive as Active
	FROM tblRW_LocalReview a
	join tblRW_UserInfo b
	on a.lmemberid=b.lmemberid
	left join        
	tblLP_MemberInfo c
	on b.lmemberid = c.lmemberid
	left join
	listingstoremaster..acx_tbl_listing d
	on a.RID = d.RID
	WHERE 
		a.sActive='Y'
		AND lSiteID = @SiteID
		AND szLoginEmail like + @Email + '%'
)

--Select one page of data based on the record numbers above
SELECT
  ReviewID,
  ReviewDate,
  LoginEmail,
  ReviewTitle,	
  ReviewText,
  DisplayName,
  SiteID,
  Active
FROM
  RWETable
WHERE
  ID > @FirstRec
AND
  ID < @LastRec

--Return the total number of records available as an output parameter
SELECT @TotalRecord = COUNT(*) 
FROM tblRW_LocalReview a
	join tblRW_UserInfo b
	on a.lmemberid=b.lmemberid
	left join        
	tblLP_MemberInfo c
	on b.lmemberid = c.lmemberid
	left join
	listingstoremaster..acx_tbl_listing d
	on a.RID = d.RID
	WHERE 
		a.sActive='Y'
		AND lSiteID = @SiteID
		AND szLoginEmail like + @Email + '%'

Return @TotalRecord
		
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByEmail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByEmail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByEmail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByEmail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByEmail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByEmail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByEmail] TO [web_user]
GO
