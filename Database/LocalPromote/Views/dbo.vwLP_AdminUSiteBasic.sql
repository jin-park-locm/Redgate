SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/**********************************************************************************
Description   :   to retireve thebasic lisitngs belong to a specific site

Change History

Date       Name     Description
---------- -------- ------------------------------------
09-08-08   dlabrie    Initial Development

EXAMPLES: 

**********************************************************************************/
CREATE VIEW [dbo].[vwLP_AdminUSiteBasic]
AS
SELECT     dbo.tblLP_BusListing.lAdvertiserID, 'Basic' AS szProductName, dbo.tblLP_PartnerListing.lSiteID, dbo.tblLP_BusListing.sztitle, 
                      dbo.tblLP_BusListing.szCity, dbo.tblLP_BusListing.sState, dbo.tblLP_BusListing.sPostalCode, dbo.tblLP_BusListing.szPhone, 
                      dbo.tblLP_MemberInfo.szLoginEmail, dbo.tblLP_MemberInfo.szLastName, dbo.tblLP_MemberInfo.szFirstName, dbo.tblLP_BusListing.RIDAX, 
                      dbo.tblLP_BusListing.sHideAddress, dbo.tblLP_BusListing.szStreetName, dbo.tblLP_BusListing.szTitleSearch
FROM         dbo.tblLP_BusListing WITH (nolock) INNER JOIN
                      dbo.tblLP_PartnerListing WITH (nolock) ON dbo.tblLP_BusListing.lAdvertiserID = dbo.tblLP_PartnerListing.lAdvertiserID INNER JOIN
                      dbo.tblLP_MemberInfo WITH (nolock) ON dbo.tblLP_BusListing.lMemberID = dbo.tblLP_MemberInfo.lMemberID
WHERE     (dbo.tblLP_PartnerListing.sListingType = 'FRE') AND (dbo.tblLP_PartnerListing.sActive = 'Y')


GO
GRANT SELECT ON  [dbo].[vwLP_AdminUSiteBasic] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[vwLP_AdminUSiteBasic] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[vwLP_AdminUSiteBasic] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[vwLP_AdminUSiteBasic] TO [lcssui]
GRANT SELECT ON  [dbo].[vwLP_AdminUSiteBasic] TO [web_user]
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
         Begin Table = "tblLP_BusListing"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 24
         End
         Begin Table = "tblLP_PartnerListing"
            Begin Extent = 
               Top = 6
               Left = 233
               Bottom = 114
               Right = 384
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblLP_MemberInfo"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
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
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vwLP_AdminUSiteBasic', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vwLP_AdminUSiteBasic', NULL, NULL
GO
