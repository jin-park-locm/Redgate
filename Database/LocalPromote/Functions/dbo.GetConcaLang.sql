SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



--GetConcaLang
CREATE FUNCTION [dbo].[GetConcaLang]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+'<LI>', '') + ISNULL(szLanguage, '') 
	FROM	(select  lAdvertiserID, szLanguage
			 from	 tblLP_BusLanguageSpoken bls join 
					 tblAL_Language ala on bls.lLanguageID = ala.lLanguageID
			where bls.sActive='Y') as Lang
	WHERE   lAdvertiserID=@lAdvertiserID 
	RETURN   Left('<LI>' + @ConcaText,2000)	
END 


GO
