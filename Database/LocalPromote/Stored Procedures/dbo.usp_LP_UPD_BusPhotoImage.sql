SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*****************************************************************************
File Name     :   usp_LP_UPD_BusPhotoImage.sql
Description   :   Insert Stock images for a listing
Comments      :   

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-13-2010 dlabrie   Initial Development

<example>
usp_LP_UPD_BusPhotoImage 405844, 2, 'N'
usp_LP_UPD_BusPhotoImage 405844, 2, 'Y'
</example>
*****************************************************************************/

Create procedure [dbo].usp_LP_UPD_BusPhotoImage

	@AID int,
	@Imageid int,
	@sActive char(1)= NULL,
    @szImageTitle varchar(100) = NULL,
    @szImageDesc varchar(300) = NULL,
    @szUpdatedBy varchar(20) = NULL



AS 
	
BEGIN

UPDATE		dbo.tblLP_BusPhotoImage
SET			sActive = isNull(@sActive, sActive)
		,	szImageTitle  = isNull(@szImageTitle, szImageTitle)
		,	szImageDesc   = isNull(@szImageDesc, szImageDesc)
		,	szUpdatedBy   = isNull(@szUpdatedBy, szUpdatedBy)
		,	dtUpdate      = GETDATE()
WHERE		lAdvertiserid = @AID
AND			lImageid      = @ImageID


END		


GO
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusPhotoImage] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusPhotoImage] TO [LocalConnect]
GO
