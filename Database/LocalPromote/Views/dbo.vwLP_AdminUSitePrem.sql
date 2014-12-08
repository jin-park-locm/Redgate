SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/**********************************************************************************
Description   :   to retireve the active orders belong to a specific site

Change History

Date       Name     Description
---------- -------- ------------------------------------
09-08-08   dlabrie    Initial Development

EXAMPLES: 

**********************************************************************************/
CREATE VIEW dbo.vwLP_AdminUSitePrem
AS
SELECT     dbo.tblLP_ProductOrder.lAdvertiserID, 'Premium' AS szProductName, dbo.tblLP_ProductCampaign.lSiteID, dbo.tblLP_BusListing.sztitle, 
                      dbo.tblLP_BusListing.szCity, dbo.tblLP_BusListing.sState, dbo.tblLP_BusListing.sPostalCode, dbo.tblLP_BusListing.szPhone, 
                      dbo.tblLP_MemberInfo.szLoginEmail, dbo.tblLP_MemberInfo.szLastName, dbo.tblLP_MemberInfo.szFirstName, dbo.tblLP_BusListing.RIDAX, 
                      dbo.tblLP_BusListing.sHideAddress, dbo.tblLP_BusListing.szStreetName, dbo.tblLP_ProductOrder.sActive, dbo.tblLP_BusListing.szTitleSearch, 
                      dbo.tblLP_ProductOrder.lOrderNo
FROM         dbo.tblLP_PartnerListing WITH (nolock) INNER JOIN
                      dbo.tblLP_ProductCampaign WITH (nolock) INNER JOIN
                      dbo.tblLP_ProductOrder WITH (nolock) ON dbo.tblLP_ProductCampaign.lCIDNo = dbo.tblLP_ProductOrder.lCIDNo ON 
                      dbo.tblLP_PartnerListing.lAdvertiserID = dbo.tblLP_ProductOrder.lAdvertiserID AND 
                      dbo.tblLP_PartnerListing.lSiteID = dbo.tblLP_ProductCampaign.lSiteID INNER JOIN
                      dbo.tblLP_BusListing WITH (nolock) ON dbo.tblLP_PartnerListing.lAdvertiserID = dbo.tblLP_BusListing.lAdvertiserID AND 
                      dbo.tblLP_ProductOrder.lAdvertiserID = dbo.tblLP_BusListing.lAdvertiserID INNER JOIN
                      dbo.tblLP_MemberInfo WITH (nolock) ON dbo.tblLP_BusListing.lMemberID = dbo.tblLP_MemberInfo.lMemberID
WHERE     (dbo.tblLP_PartnerListing.sListingType = 'pay')
GO
GRANT SELECT ON  [dbo].[vwLP_AdminUSitePrem] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[vwLP_AdminUSitePrem] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[vwLP_AdminUSitePrem] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[vwLP_AdminUSitePrem] TO [lcssui]
GRANT SELECT ON  [dbo].[vwLP_AdminUSitePrem] TO [web_user]
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[75] 4[4] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblLP_PartnerListing"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLP_ProductCampaign"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLP_ProductOrder"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 375
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLP_BusListing"
            Begin Extent = 
               Top = 114
               Left = 227
               Bottom = 235
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 24
         End
         Begin Table = "tblLP_MemberInfo"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
   ', 'SCHEMA', N'dbo', 'VIEW', N'vwLP_AdminUSitePrem', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'      Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vwLP_AdminUSitePrem', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vwLP_AdminUSitePrem', NULL, NULL
GO
