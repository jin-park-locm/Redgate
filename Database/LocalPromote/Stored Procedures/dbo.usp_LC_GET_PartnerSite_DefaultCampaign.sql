SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerSite_DefaultCampaign]  
	@lSiteID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


BEGIN

DECLARE @tbl Table (
					 szCID				varchar(30)
					,lCIDNo				int
					,lProductID			int
					,mSpecialPrice		money
					,sTimeCode			char(2)
					)
	INSERT INTO @tbl
	SELECT 
			 szCID
			,lCIDNo
			,lProductID 
			,mSpecialPrice
			,sTimeCode

	FROM tblLP_ProductCampaign  c
	JOIN tbllp_Partnersite		s ON s.lSiteID = c.lSiteID
	WHERE 	s.lSiteID	= @lSiteID
	AND     s.sSiteType		= 'PS'
	AND     c.sDefault		= 'Y'

IF @@ROWCOUNT <> 0 SELECT * FROM @tbl
ELSE
BEGIN
	SELECT 
			 szCID
			,lCIDNo
			,lProductID 
			,mSpecialPrice, sTimeCode, s.lSiteID

	FROM tblLP_ProductCampaign  c
	JOIN tbllp_Partnersite		s ON s.lSiteID = c.lSiteID
	WHERE 	s.lSiteID	= @lSiteID
--	AND     s.sSiteType		= 'PS'
	AND     c.sDefault		= 'Y'

END 

END

GO
