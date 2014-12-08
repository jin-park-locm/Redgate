SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_LC_INS_MyKeyword]
/**********************************************************************************
Description   :   Get Default Campaign info for checkout

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-16-2009 dlabrie    Initial Development
03-23-2012 jipark	Modification to remove Normalization on keyword
EXAMPLES: 	usp_LC_INS_MyKeyword 223835, 'Wedding Planer', '217762'

		
**********************************************************************************/
@Advertiserid	int,
@Keyword		Varchar(150),
@updatedBy		Varchar(50)

AS
SET NOCOUNT ON

BEGIN

Declare @NormKeyword varchar(150)
/*
FIFO-1228 and DB-369
Keyword normalization removed
Set @NormKeyword = dbo.glb_fn_NormalizeKeyword(@Keyword,0)
*/
Set @NormKeyword = @Keyword

if exists (select * from tblLP_Advertiserkeyword where lAdvertiserid = @Advertiserid 
				and szKeyword = @NormKeyword)
	Begin
		Update	a
		set		sActive = 'Y'
				, szUpdatedBy = @updatedBy
				, dtUpdate = getdate() 
		from	tblLP_Advertiserkeyword a
		where	lAdvertiserid = @Advertiserid 
		and		szKeyword = @NormKeyword
	End
else
	Begin
		Insert into tblLP_Advertiserkeyword
			(lAdvertiserid,szKeyword,sActive,szUpdatedBy,dtUpdate)
		Values (@Advertiserid, @NormKeyword, 'Y', @updatedBy, getdate())
	End 

End


GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MyKeyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MyKeyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MyKeyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MyKeyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MyKeyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MyKeyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MyKeyword] TO [web_user]
GO
