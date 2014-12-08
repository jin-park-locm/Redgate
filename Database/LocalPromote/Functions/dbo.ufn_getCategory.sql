SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
 
CREATE function [dbo].[ufn_getCategory]
(@rid int)
returns varchar(1000)
as
begin
 
declare @retText varchar(1000)
set @retText = ''
select @retText = @retText + Title + '; ' from 
(
select distinct
l.RId
, isNull( b.displayTitle, b.Title ) as Title
, b.BDC
from
(Select Rid, Case 
When b.sCatActCode='D' then (a.BDC - a.BDC % 100)
When b.sCatActCode='R' and b.sCatTypeCode='B' then (a.BDC - a.BDC % 100)
Else b.BDC 
 End as BDC 
from ListingStore2..acx_map_ListingBdc a  (nolock), glb_tbl_BDC b (nolock)
where RID=@rid and a.BDC=b.BDC)l 
, glb_tbl_BDC b (nolock) 
where
l.RID = @rid
and        l.BDC=b.BDC
) X
 
return left(@retText, 1000)
 
end
 
 
GO
