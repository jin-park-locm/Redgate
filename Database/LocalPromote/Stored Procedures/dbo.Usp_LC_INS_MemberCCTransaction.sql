SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_MemberCCTransaction]
@lCreditCardID			int,
@lMemberID				int,
@lOrderNo				int,
@mPymtAmount			money,
@szFirstName			varchar(50),
@szLastName				varchar(50),
@sApprovalCode			char(6),
@lResponseID			int,
@lResponseReasonID		int
--, @dtUpdate				datetime,
AS
SET NOCOUNT ON

DECLARE @lTransactionID int
INSERT INTO tblLP_MemberCCTransaction (
	lCreditCardID,
	lMemberID,
	lOrderNo,
	mPymtAmount,
	szFirstName,
	szLastName,
	sApprovalCode,
	lResponseID,
	lResponseReasonID,
	dtUpdate
)
Values (
	@lCreditCardID,
	@lMemberID,
	@lOrderNo,
	@mPymtAmount,
	@szFirstName,
	@szLastName,
	@sApprovalCode,
	@lResponseID,
	@lResponseReasonID,
	Getdate() --@dtUpdate
		)

IF @@ERROR = 0
BEGIN
	SELECT @lTransactionID = SCOPE_IDENTITY()
	SELECT @lTransactionID AS lTransactionID
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberCCTransaction] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberCCTransaction] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberCCTransaction] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberCCTransaction] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberCCTransaction] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberCCTransaction] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberCCTransaction] TO [web_user]
GO
