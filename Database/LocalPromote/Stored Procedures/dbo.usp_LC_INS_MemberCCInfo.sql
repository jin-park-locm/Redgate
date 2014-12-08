SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_MemberCCInfo]

	@lMemberID int,
	@lPCardID int,
	@szCardFirst12 Varchar(12),
	@sCardLast4 char(4),
	@sCardCVV char(3),
	@dtExpireDate char(2),
	@dtExpireMon char(2),
	@dtExpireYear char(4),
	@szNameOnCard varchar(100),
	@szBillingFirst varchar(50),
	@szBillingLast varchar(50),
	@szBillingAddress varchar(50),
	@szUnit varchar(10),
	@szCity varchar(50),
	@sState char(2),
	@sPostalCode char(5),
	@sZip4 char(4),
	@sActive char(1),
	@szUpdatedBy varchar(20) = 'UI' 
AS 
SET NOCOUNT ON 

DECLARE @lCreditCardID int
INSERT INTO [dbo].[tblLP_MemberCCInfo] (
	[lMemberID],
	[lPCardID],
	[szCardFirst12],
	[sCardLast4],
	[sCardCVV],
	[dtExpireDate],
	[dtExpireMon],
	[dtExpireYear],
	[szNameOnCard],
	[szBillingFirst],
	[szBillingLast],
	[szBillingAddress],
	[szUnit],
	[szCity],
	[sState],
	[sPostalCode],
	[sZip4],
	[sActive],
	[szUpdatedBy],
	[dtUpdate]
) VALUES (
	@lMemberID,
	@lPCardID,
	cast(@szCardFirst12 as varbinary(128)),
	@sCardLast4,
	Cast(@sCardCVV as varbinary(128)),
	@dtExpireDate,
	@dtExpireMon,
	@dtExpireYear,
	@szNameOnCard,
	@szBillingFirst,
	@szBillingLast,
	@szBillingAddress,
	@szUnit,
	@szCity,
	@sState,
	@sPostalCode,
	@sZip4,
	@sActive,
	@szUpdatedBy,
	Getdate()
)
 
IF @@ERROR = 0
BEGIN
	SELECT @lCreditCardID = SCOPE_IDENTITY ()
	SELECT @lCreditCardID AS lCreditCardID
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberCCInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberCCInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberCCInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberCCInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberCCInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberCCInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberCCInfo] TO [web_user]
GO
