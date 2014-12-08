SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_DT_CouponAnalog_filelist] 
(
	@importFolder varchar(512)
)
AS
BEGIN
	SET NOCOUNT ON

	create table #files(
	[file] varchar(2000) 
	)
	
	declare @dir varchar(2000)
	set @importFolder=@importFolder+case when RIGHT(@importFolder,1)='\' then '' else '\' end
	
	set @dir = 'dir /B '+@importFolder+'*-analog-coupon-change-notice.txt'
	
	insert #files
	exec master..xp_cmdshell @dir

	delete #files
	where [file] is null

	delete #files
	where [file] not like '%-analog-coupon-change-notice.txt'

	update #files
	set [file]=@importFolder+ltrim(rtrim([file]))

	delete #files 
	where [file] in ( select [FileName] from tblNG_ProcessedFileLog)
	
	select [file] from #files
	order by [file] asc

	drop table #files

	declare @command varchar(1000)
	set @command = 'xcopy "\\caalarm01\ftpusers\ftpanalog\*" "\\republic\Public\Public Archive\Database File_Report\Coupon\AnalogCoupon\" /q /y /d > nul'
	exec master.dbo.xp_cmdshell @command
	
END
GO
