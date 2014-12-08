SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_MemberAddress]     @lMemberAddressID  int    ,@szStreeName		varchar(50)	= NULL    ,@szUnit			varchar(10)	= NULL    ,@szCity			varchar(50)	= NULL    ,@sState			char(2)		= NULL    ,@sPostalCode		varchar(10)	= NULL    ,@lCountryID		int			= NULL    ,@lMemberID			int			= NULL    ,@sAdrTypeCode		char(2)		= NULL    ,@sActive			char(1)		= NULL    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ONBEGIN     UPDATE [dbo].[tblLP_MemberAddress]    SET          [szStreeName]		= ISNULL(@szStreeName, [szStreeName])        ,[szUnit]			= ISNULL(@szUnit, [szUnit])        ,[szCity]			= ISNULL(@szCity, [szCity])        ,[sState]			= ISNULL(@sState, [sState])        ,[sPostalCode]		= ISNULL(@sPostalCode, [sPostalCode])        ,[lCountryID]		= ISNULL(@lCountryID, [lCountryID])        ,[lMemberID]		= ISNULL(@lMemberID, [lMemberID])        ,[sAdrTypeCode]		= ISNULL(@sAdrTypeCode, [sAdrTypeCode])        ,[sActive]			= ISNULL(@sActive, [sActive])        ,[dtUpdate]			= ISNULL(@dtUpdate, Getdate())            WHERE [lMemberAddressID] = @lMemberAddressIDSET @lMemberAddressID = SCOPE_IDENTITY()IF @@ERROR = 0SELECT @lMemberAddressID AS lMemberAddressID 
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberAddress] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberAddress] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberAddress] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberAddress] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberAddress] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberAddress] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberAddress] TO [web_user]
GO
