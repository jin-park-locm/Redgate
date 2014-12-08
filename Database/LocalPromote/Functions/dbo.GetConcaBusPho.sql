SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[GetConcaBusPho]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText, '') + isNull(szPhoto,'')	
	FROM	(select lAdvertiserid, 
					'<a href="' + szFullLocation+ '"><img src="'+szThumbnail+'" style="max-width:60px;max-height:60px;" onclick="return false">' +
					'<img src="'+ szFullLocation+ '" class="hoverview" id="pf'+convert(varchar(10),lPhotoFileID)+'" onclick="return ShowImage(this.id, '''+isNull(replace(szPhotoDesc,'''','\'''),'')+''')"></a>&nbsp;'
					as szPhoto from tblLP_BusPhotoFile where sPhotoType='PTO' and sActive='Y'

			) as BusPho
	WHERE   lAdvertiserID=@lAdvertiserID 
	RETURN  @ConcaText
END 
GO
