SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create view [dbo].[glb_v_Noun]
as
select
	[Noun]
from glb_tbl_WordNetNoun
union
select
	[Name]
from
	glb_tbl_ProperName
GO
GRANT SELECT ON  [dbo].[glb_v_Noun] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[glb_v_Noun] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[glb_v_Noun] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[glb_v_Noun] TO [lcssui]
GRANT SELECT ON  [dbo].[glb_v_Noun] TO [web_user]
GO
