SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_Note] 
@lNoteID		int,
@lRefID			int			 = NULL,
@sNoteType		char(3)		 = NULL,
@szNote			varchar(500) = NULL,
@sActive		char(1)		 = NULL,
@szUpdatedBy	int
,@dtUpdate		datetime	 = NULL

AS
SET NOCOUNT ON


UPDATE n
SET
	lRefID			= ISNULL (@lRefID, lRefID),
	sNoteType		= ISNULL (@sNoteType,sNoteType),
	szNote			= ISNULL (@szNote,szNote),
	sActive			= ISNULL (@sActive,sActive),
	szUpdatedBy		= ISNULL (@szUpdatedBy,szUpdatedBy),
	dtUpdate		= ISNULL(@dtUpdate, Getdate())
 
FROM  tblAL_Note N
WHERE lNoteID = @lNoteID

IF @@ERROR = 0
SELECT @lNoteID AS lNoteID
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Note] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Note] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Note] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Note] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Note] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Note] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Note] TO [web_user]
GO
