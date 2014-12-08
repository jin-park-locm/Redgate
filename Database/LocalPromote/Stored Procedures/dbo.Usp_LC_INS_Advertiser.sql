SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_Advertiser]
	@szLoginEmail		varchar(100),
	@szPassword			varchar(20),
	@sUserType			char(2),
	@szLastName			varchar(50),
	@szMidName			varchar(50) = NULL,
	@szFirstName		varchar(50),
	@sTermsAccepted		char(1),
	@sActive			char(1) = 'Y',
--	@dtUpdate			datetime,
	 @szLoginName		varchar(50)

-- MemberAddress
--    ,@lMemberAddressID  int

--MemberEmail


-- MemberPhone
--     @lMemberID  int


as
SET NOCOUNT ON

DECLARE 
 @ERROR				int
,@lMemberID			int 
,@lMemberAddressID  int
,@lMemberEmailID	int
,@lMemberPhoneID	int

BEGIN
BEGIN TRAN

		Insert Into tblLP_MemberInfo 
		(
			szLoginEmail, 
			szPassword, 
			sUserType, 
			szLastName, 
			szMidName, 
			szFirstName, 
			sTermsAccepted, 
			sActive, 
			dtUpdate,
			szLoginName
									 )
		Values 
		(
			@szLoginEmail, 
			@szPassword, 
			@sUserType, 
			@szLastName, 
			@szMidName,
			@szFirstName, 
			@sTermsAccepted, 
			@sActive, 
			getdate(), 
			@szLoginName)
  

		SELECT	@ERROR =  @@ERROR  
		SELECT @lMemberID = SCOPE_IDENTITY()
-- sp_help [tblLP_MemberEmail]
 
		SELECT	@ERROR =  @ERROR + @@ERROR 
		SELECT @lMemberAddressID  = SCOPE_IDENTITY()	

    INSERT INTO [dbo].[tblLP_MemberEmail]

		SELECT	@ERROR =  @ERROR + @@ERROR 
		SELECT @lMemberEmailID  = SCOPE_IDENTITY()	



		SELECT	@ERROR			 =  @ERROR + @@ERROR 
		SELECT	@lMemberPhoneID  =	SCOPE_IDENTITY()	

BEGIN 
	COMMIT TRAN
	SELECT @lMemberID AS lMemberID 

END
ELSE
BEGIN
	ROLLBACK TRAN
END
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Advertiser] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Advertiser] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Advertiser] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Advertiser] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Advertiser] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Advertiser] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Advertiser] TO [web_user]
GO