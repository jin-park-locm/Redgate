SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_PartnerSiteRadius]     @lSiteID			int    ,@lSearchMile		int			= NULL    ,@sActive			char(1)		= 'Y'    ,@szUpdatedBy		varchar(20) = 'UI'    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    INSERT INTO [dbo].[tblLP_PartnerSiteRadius]    (          [lSiteID]        ,[lSearchMile]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lSiteID        ,@lSearchMile        ,@sActive        ,@szUpdatedBy        ,ISNULL (@dtUpdate, Getdate())            )IF @@ERROR = 0
SELECT  @lSiteID	AS lSiteIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [web_user]
GO
