SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_GET_ReviewersByEmail]
/**********************************************************************************
Description   :   Get all reviews by Email
Change History

Date       Name     Description
---------- -------- ------------------------------------
06-03-2008 Johnny Kang    Initial Development
03-20-2009 bwu			  Added partial e-mail search

EXAMPLES: 	usp_RW_GET_ReviewersByEmail 'Lsiegfried@ex', 1,10
		
**********************************************************************************/
@Email			varchar(100),
@CurrentPage	int,
@PageSize		int

as
SET NOCOUNT ON

Declare @TotalRecord int
DECLARE @FirstRec int, @LastRec int
SELECT @FirstRec = (@CurrentPage - 1) * @PageSize
SELECT @LastRec = (@CurrentPage * @PageSize + 1)

;With RWTable as
( 
SELECT	ROW_NUMBER() OVER(ORDER BY szLoginEmail ASC) as ID,
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
where p.sActive = 'Y'
	AND szLoginEmail like + @Email + '%'
)

SELECT
  MemberID,
  LoginEmail,
  FullName,	
  Password,
  DisplayName,
  UserType,
  UserDesc,
  Active
FROM RWTable
WHERE
  ID > @FirstRec
AND
  ID < @LastRec

--Return the total number of records available as an output parameter
SELECT @TotalRecord = COUNT(*) 
From tblLP_MemberInfo m (nolock)
	Left Join tblRW_UserInfo p (nolock)
	On m.lMemberId = p.lMemberId
	Left Join tblLP_MemberSecurity s (nolock)
	On m.lMemberId = s.lMemberId
	Left Join tblAL_UserType u (nolock)
	On m.sUserType = u.sUserType
where p.sActive = 'Y'
	AND szLoginEmail like + @Email + '%'

Return @TotalRecord

GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByEmail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByEmail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByEmail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByEmail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByEmail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByEmail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewersByEmail] TO [web_user]
GO
