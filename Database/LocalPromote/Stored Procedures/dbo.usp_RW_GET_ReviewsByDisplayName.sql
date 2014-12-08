SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_GET_ReviewsByDisplayName]
/**********************************************************************************
Description   :   Get all reviews by Review Title
Change History

Date       Name     Description
---------- -------- ------------------------------------
06-03-2008 Johnny Kang    Initial Development

EXAMPLES: 	usp_RW_GET_ReviewsByDisplayName 2, '///M3Chaos',1,10
		
**********************************************************************************/
	@SiteID			int,
	@DisplayName	varchar(50),
	@CurrentPage	int,
	@PageSize		int
as


SET NOCOUNT ON

Declare @TotalRecord int

--Create a temp table to hold the current page of data
--Add and ID column to count the records


CREATE TABLE #TempRDNameTable
(
  ID int IDENTITY PRIMARY KEY,
  ReviewID int,
  ReviewDate datetime,
  LoginEmail varchar(100),
  ReviewTitle varchar(100),
  ReviewText varchar(3000),
  DisplayName varchar(60),
  SiteID int,
  Active char(1)
)
--Fill the temp table with the Customers data
INSERT INTO #TempRDNameTable
(
  ReviewID,
  ReviewDate,
  LoginEmail,
  ReviewTitle,	
  ReviewText,
  DisplayName,
  SiteID,
  Active
)
	SELECT 
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
		AND szDisplayName = @DisplayName

--Create variable to identify the first and last record that should be selected
DECLARE @FirstRec int, @LastRec int
SELECT @FirstRec = (@CurrentPage - 1) * @PageSize
SELECT @LastRec = (@CurrentPage * @PageSize + 1)
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
  #TempRDNameTable
WHERE
  ID > @FirstRec
AND
  ID < @LastRec
--Return the total number of records available as an output parameter
SELECT @TotalRecord = COUNT(*) FROM #TempRDNameTable

Return @TotalRecord

DROP TABLE #TempRDNameTable		
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByDisplayName] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByDisplayName] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByDisplayName] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByDisplayName] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByDisplayName] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByDisplayName] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByDisplayName] TO [web_user]
GO
