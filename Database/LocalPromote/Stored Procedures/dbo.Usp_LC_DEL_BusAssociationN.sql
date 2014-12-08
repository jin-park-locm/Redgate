SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusAssociationN]     @lBusAssociationID  int    ASSET NOCOUNT ON-- MIBEGIN	UPDATE	[dbo].[tblLP_BusAssociation]	SET		sActive = 'N',			dtUpdate = getdate()	WHERE	lBusAssociationID = @lBusAssociationIDIF @@ERROR <> 0SELECT @lBusAssociationID AS lBusAssociationIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociationN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociationN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociationN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociationN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociationN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociationN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociationN] TO [web_user]
GO
