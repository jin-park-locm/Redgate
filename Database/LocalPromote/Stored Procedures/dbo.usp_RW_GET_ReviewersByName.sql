SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_GET_ReviewersByName]
/**********************************************************************************
Description   :   Get all reviews by Last Name
Change History

Date       Name     Description
---------- -------- ------------------------------------
06-03-2008 Johnny Kang    Initial Development

EXAMPLES: 	usp_RW_GET_ReviewersByName 'sieg', 1,100
		
**********************************************************************************/
@Name			varchar(50),
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
  Active
)
Select  
	m.lMemberId as MemberID, 
	szLoginEmail as LoginEmail, 
	m.szFirstName + ' ' +  m.szLastName as FullName,
	szPassword as Password, 
	szDisplayName as DisplayName,
	m.sUserType as UserType, 
	szUserDesc as UserDesc, 
	p.sActive as Active
	From tblLP_MemberInfo m (nolock)
	Left Join tblRW_UserInfo p (nolock)
	On m.lMemberId = p.lMemberId
	Left Join tblLP_MemberSecurity s (nolock)
	On m.lMemberId = s.lMemberId
	Left Join tblAL_UserType u (nolock)
	On m.sUserType = u.sUserType
	where 
		p.sActive = 'Y'
		AND m.szLastName LIKE '%' + @name + '%'
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
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByName] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByName] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByName] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByName] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByName] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByName] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByName] TO [web_user]
GO
