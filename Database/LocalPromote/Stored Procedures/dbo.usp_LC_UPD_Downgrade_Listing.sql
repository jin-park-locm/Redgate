SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[usp_LC_UPD_Downgrade_Listing]  
/**********************************************************************************
Description   :   Down grade a listing

Date       Name     Description
---------- -------- ---------------------------------------------------------------
03-23-2010 bwu		Added heading, and removed code to update partnerlisting table

EXAMPLES:	Exec usp_LC_UPD_Downgrade_Listing '124354', '2'
**********************************************************************************/
 
@lAdvertiserID		int,
@lSiteID			int			--= NULL the lSiteID must be passed in. 
AS
SET NOCOUNT ON  

DECLARE @lOrderNo int, @ERR int

select @ERR = 0

BEGIN

	SELECT TOP 1 @lOrderNo = lOrderNo
	FROM tblLP_ProductOrder  
	WHERE lAdvertiserID = @lAdvertiserID	

	UPDATE o
		SET		o.dtEnd	= Getdate(),
				o.sActive = 'N'
	FROM tblLP_ProductOrder o
	JOIN tblLP_ProductCampaign c ON c.lCIDNo		= o.lCIDNo
	JOIN tblLP_PartnerSite     s ON s.lSiteID		= c.lSiteID
	WHERE o.lAdvertiserID = @lAdvertiserID	
	AND   s.lSiteID = @lSiteID
	AND   o.sActive = 'Y'

	
	SELECT @ERR = @@ERROR

	UPDATE po
	SET sActive = 'I'
 	FROM tblLP_ProductOrder    po
	JOIN tblLP_ProductCampaign c ON c.lCIDNo		= po.lCIDNo
	JOIN tblLP_PartnerSite     s ON s.lSiteID		= c.lSiteID
	WHERE po.lAdvertiserID = @lAdvertiserID
	AND   s.lSiteID = @lSiteID
	AND   DATEDIFF(day, po.dtBeginning, po.dtEnd) < 1

	SELECT @ERR = @ERR + @@ERROR
END

IF @ERR = 0
BEGIN
	SELECT @lOrderNo AS lOrderNo
END



GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Downgrade_Listing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Downgrade_Listing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Downgrade_Listing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Downgrade_Listing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Downgrade_Listing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Downgrade_Listing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Downgrade_Listing] TO [web_user]
GO
