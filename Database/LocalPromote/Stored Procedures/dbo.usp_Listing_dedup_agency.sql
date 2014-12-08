SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [dbo].[usp_Listing_dedup_agency] 
(@priority int)
as
insert [ListingStore2].[dbo].[acx_tbl_Listing_dup]
select distinct d.* 
from  [ListingStore2].[dbo].[acx_tbl_Listing_dup] d join glb_tbl_AgencyId_Priority a on d.agencyid=a.agencyid
where a.priority =@priority
delete z
from [ListingStore2].[dbo].[acx_tbl_Listing_dup01] z join [ListingStore2].[dbo].[acx_tbl_Listing_dup] l 
on    z.[Title]=l.[Title]
and   z.[Address]=l.[Address]
and   z.[City]=l.[City]
and   z.[State]=l.[State]
and   z.[ZipCode]=l.[ZipCode]
and   z.[PhoneNumber]=l.[PhoneNumber]
and   z.[Latitude]=l.[Latitude]
and   z.[Longitude]=l.[Longitude]
GO
