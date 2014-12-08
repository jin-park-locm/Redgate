SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.testLPView
AS
SELECT DISTINCT 
                      ListingStoreMaster.dbo.glb_tbl_KeywordDNA.Keyword, ListingStoreMaster.dbo.glb_tbl_KeywordDNA.DefaultTier3, 
                      CASE WHEN dbo.glb_tbl_BDC.displayTitle IS NULL THEN Title ELSE DisplayTitle END AS CategoryDesc
FROM         ListingStoreMaster.dbo.glb_tbl_KeywordDNA INNER JOIN
                      dbo.glb_tbl_BDC ON ListingStoreMaster.dbo.glb_tbl_KeywordDNA.DefaultTier3 = dbo.glb_tbl_BDC.BDC
WHERE     (SUBSTRING(CAST(ListingStoreMaster.dbo.glb_tbl_KeywordDNA.DefaultTier3 AS Varchar(10)), 7, 2) = '00')
GO
GRANT SELECT ON  [dbo].[testLPView] TO [lcssui]
GRANT SELECT ON  [dbo].[testLPView] TO [web_user]
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
         Begin Table = "glb_tbl_KeywordDNA (ListingStoreMaster.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 193
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "glb_tbl_BDC"
            Begin Extent = 
               Top = 67
               Left = 439
               Bottom = 256
               Right = 590
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
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'testLPView', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'testLPView', NULL, NULL
GO
