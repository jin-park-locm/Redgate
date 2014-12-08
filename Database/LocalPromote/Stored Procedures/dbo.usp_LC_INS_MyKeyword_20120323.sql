SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_LC_INS_MyKeyword_20120323]
/**********************************************************************************
Description   :   Get Default Campaign info for checkout

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-16-2009 dlabrie    Initial Development

EXAMPLES: 	usp_LC_INS_MyKeyword 223835, 'Wedding Planer', '217762'

		
**********************************************************************************/
@Advertiserid	int,
@Keyword		Varchar(150),
@updatedBy		Varchar(50)

AS
SET NOCOUNT ON

BEGIN

Declare @NormKeyword varchar(150)
Set @NormKeyword = dbo.glb_fn_NormalizeKeyword(@Keyword,0)

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
