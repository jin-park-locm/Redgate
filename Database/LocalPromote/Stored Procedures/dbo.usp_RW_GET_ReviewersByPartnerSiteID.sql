SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_GET_ReviewersByPartnerSiteID]
/**********************************************************************************
Description   :   Get all reviews by PartnerSiteID
Change History

Date       Name     Description
---------- -------- ------------------------------------
06-03-2008 Johnny Kang    Initial Development

EXAMPLES: 	usp_RW_GET_ReviewersByPartnerSiteID 1,1,10
		
**********************************************************************************/
@SiteID			int,
@CurrentPage	int,
@PageSize		int

as
SET NOCOUNT ON

Declare @TotalRecord int

--Create a temp table to hold the current page of data
--Add and ID column to count the records


CREATE TABLE #TempRWERTable
(
  ID int IDENTITY PRIMARY KEY,
  MemberID int,
  LoginEmail varchar(100),
  FullName varchar(100),
  Password varchar(60),
  DisplayName varchar(60),
  UserType 	char(2),
  UserDesc varchar(60),
  SecurityLevel varchar(50),
  SiteID int,
  Active char(1)
)
--Fill the temp table with the Customers data
INSERT INTO #TempRWERTable
(
  MemberID,
  LoginEmail,
  FullName,	
  Password,
  DisplayName,
  UserType,
  UserDesc,
  SecurityLevel,
  SiteID,
  Active
)
Select  
	m.lMemberId as MemberID, 
	szLoginEmail as LoginEmail, 
	m.szFirstName + '' +  m.szLastName as FullName,
	szPassword as Password, 
	szDisplayName as DisplayName,
	m.sUserType as UserType, 
	szUserDesc as UserDesc, 
	l.szSecurityLevel as SecurityLevel,
	ps.lSiteID as SiteID,
	p.sActive as Active
	From tblLP_MemberInfo m (nolock)
	Left Join tblRW_UserInfo p (nolock)
	On m.lMemberId = p.lMemberId
	Left Join tblLP_MemberSecurity s (nolock)
	On m.lMemberId = s.lMemberId
	Left Join tblAL_SecurityLevel l (nolock)
	On s.lSecurityLevelID = l.lSecurityLevelID
	Left Join tblAL_UserType u (nolock)
	On m.sUserType = u.sUserType
	Left join tbllp_PartnersiteMember ps (nolock)
	on ps.lMemberID = m.lMemberID
	where 
		p.sActive = 'Y'
		AND lSiteID = @SiteID
	order by LoginEmail


--Create variable to identify the first and last record that should be selected
DECLARE @FirstRec int, @LastRec int
SELECT @FirstRec = (@CurrentPage - 1) * @PageSize
SELECT @LastRec = (@CurrentPage * @PageSize + 1)
--Select one page of data based on the record numbers above
SELECT
  MemberID,
  LoginEmail,
  FullName,	
  Password,
  DisplayName,
  UserType,
  UserDesc,
  SecurityLevel,
  SiteID,
  Active
FROM
  #TempRWERTable
WHERE
  ID > @FirstRec
AND
  ID < @LastRec
--Return the total number of records available as an output parameter
SELECT @TotalRecord = COUNT(*) FROM #TempRWERTable

Return @TotalRecord

DROP TABLE #TempRWERTable		

GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByPartnerSiteID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByPartnerSiteID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByPartnerSiteID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByPartnerSiteID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByPartnerSiteID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByPartnerSiteID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByPartnerSiteID] TO [web_user]
GO
