SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_CategoryForLeadGen]   
AS  
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED  
SET NOCOUNT ON  
  

SELECT DISTINCT
		BDC,
		Case when g.displayTitle='Car Dealer' then g.title
			 When g.displayTitle is null then g.title
			 When g.displaytitle is not null then g.displaytitle
		END as Title,
		g.DisplayTitle
FROM glb_tbl_BDC g
where iTier in (3,4)
order by Title
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CategoryForLeadGen] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CategoryForLeadGen] TO [web_user]
GO
