SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_MemberEmail]     @lMemberEmailID	int    ,@lMemberID			int			= NULL    ,@szEmail			varchar(150)= NULL    ,@sEmailType		char(1)		= NULL    ,@sActive			char(1)		= NULL    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_MemberEmail]    SET          [lMemberID]		= ISNULL(@lMemberID, [lMemberID])        ,[szEmail]			= ISNULL(@szEmail, [szEmail])        ,[sEmailType]		= ISNULL(@sEmailType, [sEmailType])        ,[sActive]			= ISNULL(@sActive, [sActive])        ,[dtUpdate]			= ISNULL(@dtUpdate, GetDate())            WHERE [lMemberEmailID] = @lMemberEmailIDSET @lMemberEmailID = SCOPE_IDENTITY()

IF @@ERROR = 0
SELECT  @lMemberEmailID AS lMemberEmailID 
 END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [web_user]
GO
