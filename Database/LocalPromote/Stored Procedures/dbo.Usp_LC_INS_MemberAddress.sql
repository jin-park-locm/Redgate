SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_MemberAddress]     @szStreeName			varchar(50)    ,@szUnit				varchar(10)	= NULL    ,@szCity				varchar(50)    ,@sState				char(2)    ,@sPostalCode			varchar(10)    ,@lCountryID			int    ,@lMemberID				int    ,@sAdrTypeCode			char(2)    ,@sActive				char(1)		= 'Y'    ,@dtUpdate				datetime	= NULL    ASSET NOCOUNT ONDECLARE @lMemberAddressID int--SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    INSERT INTO [dbo].[tblLP_MemberAddress]    (          [szStreeName]        ,[szUnit]        ,[szCity]        ,[sState]        ,[sPostalCode]        ,[lCountryID]        ,[lMemberID]        ,[sAdrTypeCode]        ,[sActive]        ,[dtUpdate]            )    VALUES    (         @szStreeName        ,@szUnit        ,@szCity        ,@sState        ,@sPostalCode        ,@lCountryID        ,@lMemberID        ,@sAdrTypeCode        ,@sActive        ,ISNULL (@dtUpdate, Getdate())            )SET @lMemberAddressID = SCOPE_IDENTITY()IF @@ERROR = 0SELECT @lMemberAddressID AS lMemberAddressID END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberAddress] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberAddress] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberAddress] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberAddress] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberAddress] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberAddress] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberAddress] TO [web_user]
GO
