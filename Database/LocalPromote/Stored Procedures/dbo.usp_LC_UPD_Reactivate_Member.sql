SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Reactivate_Member]

@lMemberID                    int

AS 

SET NOCOUNT ON

BEGIN

      UPDATE m
            SET  m.sActive = 'Y',
				 m.dtEnd = NULL
      FROM tblLP_MemberInfo m
      WHERE m.lMemberID = @lMemberID
      AND     m.sActive = 'D' 

      IF @@ERROR = 0
      SELECT   @lMemberID   AS lMemberID

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Member] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Member] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Member] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Member] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Member] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Member] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Member] TO [web_user]
GO
