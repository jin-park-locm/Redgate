SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

Create procedure [dbo].[usp_LC_DEL_MyKeyword]
/**********************************************************************************
Description   :   Get Default Campaign info for checkout

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-16-2009 dlabrie    Initial Development

EXAMPLES: 	usp_LC_DEL_MyKeyword 25

		
**********************************************************************************/
@Keywordid	int
--,@Keyword		Varchar(150)

AS
SET NOCOUNT ON

BEGIN

/*Declare @NormKeyword varchar(150)
Set @NormKeyword = dbo.glb_fn_NormalizeKeyword(@Keyword,0)*/

Update	tblLP_Advertiserkeyword
set		sActive='N',
		dtUpdate=getdate()
Where	lKeywordid=@Keywordid
	
ENd
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_MyKeyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_MyKeyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_MyKeyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_MyKeyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_MyKeyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_MyKeyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_MyKeyword] TO [web_user]
GO
