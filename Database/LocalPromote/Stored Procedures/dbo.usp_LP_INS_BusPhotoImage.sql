SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*****************************************************************************
File Name     :   usp_LP_INS_BusPhotoImage.sql
Description   :   Insert Stock images for a listing
Comments      :   

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-13-2010 dlabrie   Initial Development

<example>
usp_LP_INS_BusPhotoImage 405844, 2, 'test1 title', 'test desc', '217762'
</example>
*****************************************************************************/

Create procedure [dbo].usp_LP_INS_BusPhotoImage

@AID int,
@Imageid int,
@title varchar(100),
@Desc Varchar(100),
@UpdateUser varchar(20)


AS 
	

BEGIN

INSERT INTO tblLP_BusPhotoImage
( lAdvertiserid, lImageid, szImageTitle, szImageDesc, sActive, szUpdatedBy, dtUpdate)
Values (@AID, @ImageID, @title, @Desc, 'Y', @UpdateUser, getdate())

END		


GO
GRANT EXECUTE ON  [dbo].[usp_LP_INS_BusPhotoImage] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_BusPhotoImage] TO [LocalConnect]
GO
