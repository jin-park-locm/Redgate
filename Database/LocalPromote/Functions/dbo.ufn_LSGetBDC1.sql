SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- select [dbo].[ufn_LSGetBDC1](10242983)

CREATE      function [dbo].[ufn_LSGetBDC1]
(
	@RID bigint
)
RETURNS VARCHAR(20) 
as

BEGIN 

	Declare @ConcaText VARCHAR(20)
	
    SELECT	@ConcaText = cast(ISNULL(BDC, '') as varchar(10))
	FROM	(	select top 1 BDC from ListingStoreMaster..acx_map_ListingBDC 
				WHERE   RID = @RID
				order by BDC
			) X 
		
	RETURN  @ConcaText
	
END 

GO
