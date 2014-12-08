SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_MemberEmail]
     @lMemberID		int
    ,@szEmail		varchar(150)
    ,@sEmailType	char(1)
    ,@sActive		char(1)		= 'Y'
--    ,@dtUpdate		datetime
    
AS
SET NOCOUNT ON
DECLARE @lMemberEmailID int
 
BEGIN

    INSERT INTO [dbo].[tblLP_MemberEmail]
    ( 
         [lMemberID]
        ,[szEmail]
        ,[sEmailType]
        ,[sActive]
        ,[dtUpdate]
        
    )
    VALUES
    (
         @lMemberID
        ,@szEmail
        ,@sEmailType
        ,@sActive
        ,Getdate()
        
    ) 
--SD
SET @lMemberEmailID = SCOPE_IDENTITY()

IF @@ERROR = 0
SELECT  @lMemberEmailID AS lMemberEmailID 
 
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberEmail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberEmail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberEmail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberEmail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberEmail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberEmail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberEmail] TO [web_user]
GO
