SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_LP_UPD_BusListingMID]
/**********************************************************************************
Description   :   Update the lmemberid= 432251 to the user mid 

Change History

Date       Name     Description
---------- -------- ------------------------------------
02-08-2010 Bwu  Initial Development

EXAMPLES: usp_LP_UPD_BusListing 2, 1

**********************************************************************************/
	@AdvertiserId int,
	@MemberId int
AS
	SET NOCOUNT ON

	Update	tblLP_BusListing 
	Set		lMemberid=@Memberid
	Where	lmemberid=432251
	and		lAdvertiserid=@Advertiserid

GO
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusListingMID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusListingMID] TO [LocalConnect]
GO
