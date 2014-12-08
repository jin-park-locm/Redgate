SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author: Ron Kirkland
-- Create date: 05/25/2011
-- Description: Associates a Busniess Listing with another MemberID
-- =============================================
CREATE PROCEDURE [dbo].[USP_LC_UPD_BusListingMemberID] 
-- Add the parameters for the stored procedure here
@lMemberID int, 
@lAdvertiserID int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

-- Insert statements for procedure here
UPDATE tblLP_BusListing
SET lMemberID = @lMemberID
WHERE lAdvertiserID = @lAdvertiserId

END
GO
GRANT EXECUTE ON  [dbo].[USP_LC_UPD_BusListingMemberID] TO [iisLpAdmin]
GRANT EXECUTE ON  [dbo].[USP_LC_UPD_BusListingMemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[USP_LC_UPD_BusListingMemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[USP_LC_UPD_BusListingMemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[USP_LC_UPD_BusListingMemberID] TO [web_user]
GO
