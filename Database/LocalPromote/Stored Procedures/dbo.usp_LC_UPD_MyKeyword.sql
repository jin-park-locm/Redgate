SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_UPD_MyKeyword]
/**********************************************************************************
Description   :   Get Default Campaign info for checkout

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-16-2009 dlabrie    Initial Development

EXAMPLES: 	usp_LC_UPD_MyKeyword 11, '207129'--lmemberid of dlabrie@local.com in tblLP_Memberinfo

		
**********************************************************************************/
@lKeywordId int output
,@UpdatedBy		varchar(50)

AS
SET NOCOUNT ON

BEGIN


Update	tblLP_Advertiserkeyword
set		sActive='Y',
		dtUpdate=getdate(),
		szUpdatedBy=@UpdatedBy
Where	lKeywordid=@lKeywordid


Return @lKeywordID
	
ENd
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MyKeyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MyKeyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MyKeyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MyKeyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MyKeyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MyKeyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MyKeyword] TO [web_user]
GO
