SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_BusListingContent]

@lAdvertiserID		int,
@szTagline			varchar(60) = null,
@szReturnPolicy		varchar(200),
@lLocationTotal		int,
@lEmployeeTotal		int,
@szYearEstablished	varchar(4),
@sFemale		char(1),
@sMinority		char(1),
@sEmergency			char(1),
@szAward			varchar(300), 
@szCertification	varchar(180), 
--	@BusDesc			Varchar(4000),
@szUpdatedBy				Varchar(20)

AS
SET NOCOUNT ON
-- modify by MU
INSERT INTO tblLP_BusListingContent
	(lAdvertiserID, szTagLine, szReturnPolicy, lLocationTotal, lEmployeeTotal, szYearEstablished, sFemale, sMinority, sEmergency, szAward, szCertification, szUpdatedBy, dtUpdate)
VALUES
	(@lAdvertiserID, @szTagline, @szReturnPolicy, @lLocationTotal, @lEmployeeTotal, @szYearEstablished, @sFemale, @sMinority, @sEmergency, @szAward, @szCertification, @szUpdatedBy, Getdate())



IF @@ERROR = 0
SELECT @lAdvertiserID AS lAdvertiserID
 
/*
INSERT INTO tblLP_BusDescription
	(lAdvertiserid, szBusDesc, szUpdatedBy, dtUpdate)
VALUES
	(@lAdvertiserID, @BusDesc, @szUser,getdate())
*/
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingContent] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingContent] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingContent] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingContent] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingContent] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingContent] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingContent] TO [web_user]
GO
