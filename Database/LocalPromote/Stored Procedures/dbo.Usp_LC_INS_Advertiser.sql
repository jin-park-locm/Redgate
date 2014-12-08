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
--    ,@lMemberAddressID  int    ,@szStreeName  varchar(50)    ,@szUnit  varchar(10)	= NULL    ,@szCity  varchar(50)    ,@sState  char(2)    ,@sPostalCode  varchar(10)    ,@lCountryID  int    ,@sAdrTypeCode  char(2)--    ,@sActive  char(1)--    ,@dtUpdate  datetime

--MemberEmail
    ,@szEmail  varchar(150)    ,@sEmailType  char(1)--    ,@sActive  char(1)--    ,@dtUpdate  datetime

-- MemberPhone
--     @lMemberID  int    ,@sCountryCode  varchar(5)    ,@szPhone  varchar(12)    ,@szExt  varchar(5)		= NULL    ,@sPhoneType  char(1)


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
      INSERT INTO [dbo].[tblLP_MemberAddress]    (          [szStreeName]        ,[szUnit]        ,[szCity]        ,[sState]        ,[sPostalCode]        ,[lCountryID]        ,[lMemberID]        ,[sAdrTypeCode]        ,[sActive]        ,[dtUpdate]            )    VALUES    (         @szStreeName        ,@szUnit        ,@szCity        ,@sState        ,@sPostalCode        ,@lCountryID        ,@lMemberID        ,@sAdrTypeCode        ,@sActive        ,Getdate()            )
		SELECT	@ERROR =  @ERROR + @@ERROR 
		SELECT @lMemberAddressID  = SCOPE_IDENTITY()	

    INSERT INTO [dbo].[tblLP_MemberEmail]    (          [lMemberID]        ,[szEmail]        ,[sEmailType]        ,[sActive]        ,[dtUpdate]            )    VALUES    (         @lMemberID        ,@szEmail        ,@sEmailType        ,@sActive        ,Getdate()            )

		SELECT	@ERROR =  @ERROR + @@ERROR 
		SELECT @lMemberEmailID  = SCOPE_IDENTITY()	

     INSERT INTO [dbo].[tblLP_MemberPhone]    (          [lMemberID]        ,[sCountryCode]        ,[szPhone]        ,[szExt]        ,[sPhoneType]        ,[sActive]        ,[dtUpdate]            )    VALUES    (         @lMemberID        ,@sCountryCode        ,@szPhone        ,@szExt        ,@sPhoneType        ,@sActive        ,Getdate()            )

		SELECT	@ERROR			 =  @ERROR + @@ERROR 
		SELECT	@lMemberPhoneID  =	SCOPE_IDENTITY()	
IF @ERROR = 0
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
