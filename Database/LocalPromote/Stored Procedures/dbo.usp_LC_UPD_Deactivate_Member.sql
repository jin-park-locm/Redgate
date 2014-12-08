SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Deactivate_Member]
@lMemberID                    int

AS 

SET NOCOUNT ON
 
BEGIN

      UPDATE m
            SET  m.sActive = 'D',
				 m.dtEnd = getdate()
      FROM tblLP_MemberInfo m
      WHERE m.lMemberID = @lMemberID
      AND     m.sActive = 'Y' 

      IF @@ERROR = 0
      SELECT   @lMemberID   AS lMemberID

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Member] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Member] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Member] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Member] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Member] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Member] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Member] TO [web_user]
GO
