SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_Upd_UserInfo]
			@lMemberID		int
			,@sZip			char(5)
			,@lAgeRangeID	int
			,@sGender		char(1)
			,@sOptIn		char(1)
			,@dtUpdate		datetime		
as

set nocount on 

update U
set U.sZip = @sZip
	,U.lAgeRangeID = @lAgeRangeID
	,U.sGender = @sGender
	,U.sOptIn = @sOptIn
	,U.dtUpdate = @dtUpdate
from dbo.tblrw_UserInfo U
where U.lMemberID = @lMemberID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_Upd_UserInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_Upd_UserInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_Upd_UserInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_Upd_UserInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_Upd_UserInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_Upd_UserInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_Upd_UserInfo] TO [web_user]
GO
