SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_PartnerSiteMember]     @lSiteID		int    ,@lMemberID		int    ,@sSiteType		char(2)		= NULL    ,@sActive		char(1)		= NULL    ,@szUpdatedBy	varchar(20)	= NULL    ,@dtUpdate		datetime	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_PartnerSiteMember]    SET          [sSiteType]	= ISNULL(@sSiteType, [sSiteType])        ,[sActive]		= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]	= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]		= ISNULL(@dtUpdate, Getdate())            WHERE [lSiteID] = @lSiteID AND [lMemberID] = @lMemberIDIF @@ERROR = 0SELECT	@lSiteID	AS lSiteID,		@lMemberID	AS lMemberIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteMember] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteMember] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteMember] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteMember] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteMember] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteMember] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteMember] TO [web_user]
GO
