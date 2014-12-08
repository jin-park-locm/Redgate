SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_LP_CHK_ZipCode_2]
/**********************************************************************************
Description   :   Validate the right zipcode based on city and state

Change History

Date       Name     Description
---------- -------- ------------------------------------
05-07-2010 bwu	    Initial Development

EXAMPLES: 	usp_LP_CHK_ZipCode 'Irvine','CA', '92612'
		
**********************************************************************************/

@City nvarchar(64),
@State nvarchar(2),
@ZipCode nvarchar(5)

as
SET NOCOUNT ON
print @city + '-' + @state + '-' + @zipcode
select	isnull(count(*), 0)
from	DataStaging..tblAL_CityZIPCode
where	ZIPCode = @ZipCode
and		CityName = @City
and		StateAbbr = @State


GO
