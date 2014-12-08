SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_rpt_geoLocation_off]
AS
BEGIN
	SET NOCOUNT ON;

	declare @rcnt int
	if exists (select 1 from sys.objects where name='rpt_geoLocation_off' and type='U')
		drop table rpt_geoLocation_off

	select a.latitude*180/PI() as l_lat,a.longitude*180/PI() as l_long,z.latitude as z_lat,z.Longitude as z_long,b.*
	into rpt_geoLocation_off
	from localpromote.dbo.tblLP_BusListingLatLong a (nolock)
	join localpromote.dbo.tblLP_BusListing b (nolock) on a.lAdvertiserID=b.lAdvertiserID
	join localpromote..zipcodes z (nolock) on (b.sPostalCode=z.ZIPCode and z.CityType='D')
	where (sqrt(square(a.latitude-(pi()*z.latitude/180))+SQUARE(a.longitude-(pi()*z.longitude/180))) > 0.01) --over 25 miles
	and b.sAction='TRN'

	set @rcnt=@@ROWCOUNT

	declare @lsubject varchar(1000)
	set @lsubject= 'Weekly Rpt - '+CAST(@rcnt as varchar(10))+' LP records with lat/long way off from zipcode'

	EXEC msdb..sp_send_dbmail  
	@profile_name =  'ReportingSvc', 
    @recipients = 'asingireddy@local.com;sxia@local.com;jipark@local.com',
    @subject=@lsubject,
    @body = 'Note: Some listings may indeed be 25 miles away from zipcode geo location but are correct. This report is used to track the growth of off geo-locations count and re-geocode as and when required. The results are saved in LocalPromote..rpt_geoLocation_off table for analysis.'
    --@query = 'select * from LocalPromote.dbo.tmp_geoLocation_off',
    --@attach_query_result_as_file = 1,
    --@query_attachment_filename='weekly_LP_geoLocation_off.csv',
    --@query_result_separator=','


END
GO
