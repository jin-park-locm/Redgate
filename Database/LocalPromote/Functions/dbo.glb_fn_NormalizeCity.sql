SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE FUNCTION [dbo].[glb_fn_NormalizeCity]
(
	@cityname varchar(80),
	@zipcode char(5)
)
RETURNS varchar(80)
AS
/*
	Amar Singireddy		08/17/2011	Intial

*/
BEGIN
	-- Declare the return variable here
	DECLARE @ncityname varchar(80),@cityname2 varchar(80),@slice varchar(80)
	DECLARE @delimiter char(1),@idx int
	
	set @ncityname = ''
	set @delimiter = ' '

	-- Add the T-SQL statements to compute the return value here
	set @cityname2=replace(@cityname,'.',' ')
	set @cityname2=replace(@cityname2,',',' ')
	set @cityname2=ltrim(rtrim(replace(@cityname2,'''','')))

	if len(@cityname2)<1 or @cityname2 is null return @cityname
	else set @idx = 1
	
	while @idx!=0
	begin
		set @idx=charindex(@delimiter,@cityname2)
		if @idx!=0
			set @slice = left(@cityname2,@idx-1)
		else
			set @slice = @cityname2
		
		if(len(@slice)>0)
		begin
			if exists (select 1 from dbo.nf_city cnf (nolock) where cnf.literal=@slice)
				select @ncityname=@ncityname+cnf.norm+' ' from dbo.nf_city cnf (nolock) where cnf.literal=@slice
			else
				set @ncityname=@ncityname+@slice+' '
		end
			
		set @cityname2 = ltrim(right(@cityname2,len(@cityname2)-@idx))
		if len(@cityname2)=0 break
	end
	
	set @ncityname = rtrim(@ncityname)
	
	if not exists (select 1 from dbo.zipcodes (nolock) where ZIPCode=@zipcode and CityName=@ncityname)
	begin
		if len(@ncityname) > 3 and exists (select 1 from dbo.zipcodes (nolock) where ZIPCode=@zipcode and CityName=left(@ncityname,len(@ncityname)-3))
			set @ncityname=left(@ncityname,len(@ncityname)-3)
		else
			set @ncityname=ltrim(rtrim(@cityname))
	end
		
	-- Return the result of the function
	RETURN @ncityname

END
GO
