SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/**********************************************************************************
Description   :   retrieve the last active orders

Change History

Date       Name     Description
---------- -------- ------------------------------------
09-08-08   dlabrie    Initial Development

EXAMPLES: 

**********************************************************************************/
CREATE VIEW dbo.vwLP_ListingOrderStatus
AS
SELECT     dbo.tblLP_ProductOrder.lOrderNo, dbo.tblLP_BusListing.lAdvertiserID, dbo.tblLP_ProductOrder.lCIDNo, dbo.tblLP_ProductCampaign.szSpecialName, 
                      dbo.tblLP_ProductList.lProductID, dbo.tblLP_ProductList.szProductName, dbo.tblLP_ProductLevel.lLevel, dbo.tblLP_ProductLevel.szLevelDesc, 
                      dbo.tblLP_ProductCampaign.lSiteID, dbo.tblLP_ProductList.lPartnerID, dbo.tblLP_ProductOrder.dtBeginning, dbo.tblLP_ProductOrder.dtEnd
FROM         dbo.tblLP_ProductList WITH (nolock) INNER JOIN
                      dbo.tblLP_ProductCampaign WITH (nolock) ON dbo.tblLP_ProductList.lProductID = dbo.tblLP_ProductCampaign.lProductID INNER JOIN
                      dbo.tblLP_ProductLevel WITH (nolock) ON dbo.tblLP_ProductList.lLevel = dbo.tblLP_ProductLevel.lLevel INNER JOIN
                      dbo.tblLP_ProductOrder WITH (nolock) ON dbo.tblLP_ProductCampaign.lCIDNo = dbo.tblLP_ProductOrder.lCIDNo INNER JOIN
                      dbo.tblLP_BusListing WITH (nolock) ON dbo.tblLP_ProductOrder.lAdvertiserID = dbo.tblLP_BusListing.lAdvertiserID
WHERE     (dbo.tblLP_ProductOrder.sActive = 'Y')
GO
GRANT SELECT ON  [dbo].[vwLP_ListingOrderStatus] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[vwLP_ListingOrderStatus] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[vwLP_ListingOrderStatus] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[vwLP_ListingOrderStatus] TO [lcssui]
GRANT SELECT ON  [dbo].[vwLP_ListingOrderStatus] TO [web_user]
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "tblLP_ProductList"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLP_ProductCampaign"
            Begin Extent = 
               Top = 6
               Left = 231
               Bottom = 121
               Right = 383
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLP_ProductLevel"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLP_ProductOrder"
            Begin Extent = 
               Top = 126
               Left = 228
               Bottom = 241
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLP_BusListing"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 361
               Right = 196
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
   ', 'SCHEMA', N'dbo', 'VIEW', N'vwLP_ListingOrderStatus', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'      Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vwLP_ListingOrderStatus', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vwLP_ListingOrderStatus', NULL, NULL
GO
