SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*****************************************************************************
File Name     :   usp_LP_GET_ImageByBDCforListing.sql
Description   :   Get Photo by BDC for a listing 
Comments      :   

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-13-2010 dlabrie   Initial Development

<example>
usp_LP_GET_ImageByBDCforListing 72105
</example>
*****************************************************************************/

CREATE procedure [dbo].[usp_LP_GET_ImageByBDCforListing]

@AID int

AS 
	

BEGIN

Select  Distinct a.lImageID, szImageName, szServerName, szDirectory, sSizeName
from	tblLP_ImageLibrary a,
		tblLP_ImageLibraryCategory b,
		tblLP_BusListingCat c,
		tblAL_ImageSize d
where	c.lAdvertiserid=@AID
and		c.sAction<>'DEL'
and		c.BDC=b.BDC		
and		a.lImageid=b.lImageid
and		a.sActive='Y'
and		a.sSize=d.sSize

END		


GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_ImageByBDCforListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_ImageByBDCforListing] TO [LocalConnect]
GO
