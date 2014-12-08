SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--drop function [dbo].[ufn_LSGetBDC2]
--GO


-- select [dbo].[ufn_LSGetBDC2](10242983)

CREATE      function [dbo].[ufn_LSGetBDC2]
(
	@RID bigint
)
RETURNS VARCHAR(20) 
as

BEGIN 

	Declare @ConcaText VARCHAR(20)
	
	if ((	select COUNT(1) from ListingStoreMaster..acx_map_ListingBDC 
			WHERE   RID = @RID) > 1)
	begin
		
		SELECT	@ConcaText = cast(ISNULL(BDC, '') as varchar(10))
		FROM	(	select top 1 BDC from ListingStoreMaster..acx_map_ListingBDC 
					WHERE   RID = @RID
					order by BDC desc
				) X 
		
	end
	
	RETURN  @ConcaText
	
END 

GO
