SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_LP_CHK_ZipCode]
/**********************************************************************************
Description   :   Validate the right zipcode based on city and state

Change History

Date       Name     Description
---------- -------- ------------------------------------
05-07-2010 bwu	    Initial Development
03-12-2012 Amar		using zipcodes table and normalizeCity function
EXAMPLES: 	usp_LP_CHK_ZipCode 'Irvine','CA', '92618'
		
**********************************************************************************/

@City varchar(64),
@State char(2),
@ZipCode char(5)

as
SET NOCOUNT ON

declare @result int

select	@result=isnull(count(*), 0)
from	DataStaging..tblAL_CityZIPCode --zipcodes
where	ZIPCode = @ZipCode
and		CityName = @City --dbo.glb_fn_normalizeCity(@City,@ZipCode)
and		StateAbbr = @State

if @result=0
begin
	select	@result=isnull(count(*), 0)
	from	DataStaging..tblAL_CityZIPCode --zipcodes
	where	ZIPCode = @ZipCode
	and		CityName = dbo.glb_fn_normalizeCity(@City,@ZipCode)
	and		StateAbbr = @State
end

select @result

GO
GRANT EXECUTE ON  [dbo].[usp_LP_CHK_ZipCode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_CHK_ZipCode] TO [web_user]
GO
