SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_MemberWebsite]     @lMemberID			int    ,@szWebURL			varchar(150)= NULL    ,@sActive			char(1)		= NULL    ,@szUpdatedBy		varchar(50)	= NULL    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_MemberWebsite]    SET          [lMemberid]	= ISNULL(@lMemberID, [lMemberid])        ,[szWebURL]		= ISNULL(@szWebURL, [szWebURL])        ,[sActive]		= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]	= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]		= ISNULL(@dtUpdate, Getdate())            WHERE [lMemberid] = @lMemberIDIF @@ERROR = 0SELECT @lMemberID AS lMemberIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberWebsite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberWebsite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberWebsite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberWebsite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberWebsite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberWebsite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberWebsite] TO [web_user]
GO
