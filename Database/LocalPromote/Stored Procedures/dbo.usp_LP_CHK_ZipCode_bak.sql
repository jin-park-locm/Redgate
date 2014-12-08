SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_LP_CHK_ZipCode_bak]
/**********************************************************************************
Description   :   Validate the right zipcode based on city and state

Change History

Date       Name     Description
---------- -------- ------------------------------------
05-07-2010 bwu	    Initial Development

EXAMPLES: 	usp_LP_CHK_ZipCode 'Irvine','CA', '92612'
		
**********************************************************************************/

@City varchar(64),
@State char(2),
@ZipCode char(5)

as
SET NOCOUNT ON

select	isnull(count(*), 0)
from	DataStaging..tblAL_CityZIPCode
where	ZIPCode = @ZipCode
and		CityName = @City
and		StateAbbr = @State


GO
