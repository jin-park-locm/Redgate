SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*****************************************************************************
File Name     :   usp_LC_GET_BusImageforListing.sql
Description   :   Get Photo path for a listing 
Comments      :   

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-13-2010 dlabrie   Initial Development

<example>
usp_LC_GET_BusImageforListing 405844
</example>

Select * from tblLP_BusPhotoImage
*****************************************************************************/

Create procedure [dbo].usp_LC_GET_BusImageforListing

@AID int

AS 
	

BEGIN


SELECT
	lib.lImageId
,	b.lAdvertiserId
,	b.szImageTitle
,	b.szImageDesc
,	lib.szServerName
,	lib.szDirectory
,	lib.szImageName
,	sz.sSizeName
FROM	dbo.tblLP_ImageLibrary lib
INNER
JOIN	dbo.tblLP_BusPhotoImage b
ON		b.lImageId = lib.lImageId
INNER
JOIN	dbo.tblAL_ImageSize sz
ON		sz.sSize = lib.sSize
WHERE	b.lAdvertiserId = @AID
AND		lib.sActive = 'Y'
AND		b.sActive = 'Y'
END		


GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusImageforListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusImageforListing] TO [LocalConnect]
GO
