SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_DT_CouponAnalog_export]
AS
BEGIN
	SET NOCOUNT ON;

	--first file (AAListingFullList*.csv)
	select	e.lAdvertiserID, e.szTitle as BusinessName, 
			e.szStreetName as Address, e.szCity as City, 
			e.sState as State, e.sPostalCode as Zipcode, 
			e.szPhone as PhoneNumber,  convert(varchar(200), null) as Category, 
			b.szSiteName as SiteName, b.lSiteID as SiteID, f.szLoginEmail as LoginEmail,		
			convert(char(3), null) as sAction, getdate() as dtSend
	into	##AAListingFullList		
	from	tblLP_BusListing e (nolock)
	join	tblLP_ProductOrder d (nolock) on (e.lAdvertiserID = d.lAdvertiserID and d.sActive = 'Y')
	join	tblLP_ProductCampaign c (nolock) on (d.lCIDNo = c.lCIDNo)
	join	tblLP_PartnerSite b (nolock) on (c.lSiteID = b.lSiteID)
	join	tblLP_Partner a (nolock) on (a.lPartnerID = b.lPartnerID)
	join	tblLP_PartnerSiteMember r (nolock) on (r.lSiteID = b.lSiteID and r.sContact = 'Y')
	join	tblLP_MemberInfo f (nolock) on (f.lMemberID = e.lMemberID)
	where	a.szPartnerName like '%PG%'
	and		b.sActive = 'Y'
	and		e.RIDAX is not null
	and		isnull(e.sAgencyID, '') = 'AP'
	and		e.sAction not in ('DND')

	update	a
	set		Category = convert(varchar(200), isnull(c.DisplayTitle, c.Title))
	--		select	a.lAdvertiserID,isnull(c.DisplayTitle, c.Title)
	from	##AAListingFullList a
	join	tblLP_BusListingCat b on (a.lAdvertiserID = b.lAdvertiserID)
	join	glb_tbl_bdc c on (b.BDC = c.BDC)
	where	b.sAction='ADD'

	update	stg
	set		BusinessName = '"' + convert(varchar(148), BusinessName) + '"'
			, Address = '"' + convert(varchar(98), Address) + '"'
			, City = '"' + convert(varchar(48), City) + '"'
			, PhoneNumber = '"' + convert(varchar(10), PhoneNumber) + '"'
			, Category = '"' + convert(varchar(198), Category) + '"'
			, SiteName = '"' + convert(varchar(48), SiteName) + '"'
			, LoginEmail = '"' + convert(varchar(148), LoginEmail) + '"'
	From	##AAListingFullList stg

	exec master.dbo.xp_cmdshell 'echo lAdvertiserID,BusinessName,Address,City,State,Zipcode,PhoneNumber,Category,SiteName,SiteID,LoginEmail>>"\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\header.txt"'
	exec master.dbo.xp_cmdshell 'bcp "select lAdvertiserID,BusinessName,Address,City,State,Zipcode,PhoneNumber,Category,SiteName,SiteID,LoginEmail from ##AAListingFullList" queryout "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\aacoupon.txt" -c -t, -T -S"LA3SQL01\TonyStark"'

	declare		@command varchar(1000)
	declare		@file varchar(200)
	declare		@rundate datetime
	declare		@postdate varchar(11)
	declare		@fileName varchar(100)

	set		@rundate = getdate()
	set		@postdate = replace(convert (varchar(10), @rundate, 120),'-','')
	set		@fileName = 'AAListingFullList_'+@postdate+'.csv'
	set		@file='\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\AAListingFullList_'+@postdate+'.csv'
	-- print @file

	set		@command = 'copy "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\header.txt"+"\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\aacoupon.txt" "'+@file+'"'
	-- print @command
	exec	master.dbo.xp_cmdshell @command

	set		@command = 'copy "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\' + @fileName + '" "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Archive\'+@fileName+'"'
	-- print @command
	exec	master.dbo.xp_cmdshell @command

	exec	master.dbo.xp_cmdshell 'del "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\aacoupon.txt"'
	exec	master.dbo.xp_cmdshell 'del "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\header.txt"'

	drop table ##AAListingFullList

	--second file (AAPartnerSiteLoginUpdate*.csv)
	Select	a.lMemberid as MemberID, p.lsiteid as SiteID, szSiteName as SiteName, 
			szLoginEmail as LoginEmail,szLastName as LastName, szFirstName as FirstName, 'A' as Status 
	into	##AAPartnerSiteLoginUpdate 
	from	tblLP_Memberinfo a (nolock) 
	join	tblLP_MemberSecurity c (nolock) on (a.lmemberid=c.lmemberid and c.lsecurityLevelID in (3, 4)) 
	join	tblal_securityLevel b (nolock) on (c.lsecurityLevelID=b.lsecurityLevelID)
	join	tblLP_PartnerSiteMember r (nolock) on (a.lmemberid = r.lmemberid)
	join	tblLP_partnerSite p (nolock) on (r.lSiteID = p.lSiteID)
	where	a.sactive='Y' 
	and		p.lSiteID not in (select n.lSiteID from DataStaging..tblLP_PartnerSiteMemberIDAACoupon n) 

	Insert	##AAPartnerSiteLoginUpdate (Memberid, SiteID, SiteName, LoginEmail, LastName, FirstName, Status) 
	Select	a.lMemberid as MemberID, p.lsiteid as SiteID, p.szSiteName as SiteName, 
			szLoginEmail as LoginEmail,szLastName as LastName, szFirstName as FirstName, 'U' as Status 
	from	tblLP_Memberinfo a (nolock)
	join	tblLP_MemberSecurity c (nolock) on (a.lmemberid=c.lmemberid and c.lsecurityLevelID in (3, 4))
	join	tblal_securityLevel b (nolock) on (c.lsecurityLevelID=b.lsecurityLevelID) 
	join	tblLP_PartnerSiteMember r (nolock) on (a.lmemberid=r.lmemberid)
	join	tblLP_partnerSite p (nolock) on (r.lSiteID = p.lSiteID) 
	join	DataStaging..tblLP_PartnerSiteMemberIDAACoupon s on (r.lSiteID=s.lSiteID)
	where	a.sactive='Y' 
	and		p.sActive =s.sActive

	Insert	##AAPartnerSiteLoginUpdate (Memberid, SiteID, SiteName, LoginEmail, LastName, FirstName, Status) 
	Select	a.lMemberid as MemberID, p.lsiteid as SiteID, p.szSiteName as SiteName, 
			szLoginEmail as LoginEmail,szLastName as LastName, szFirstName as FirstName, 'D' as Status 
	from	tblLP_Memberinfo a (nolock)
	join	tblLP_MemberSecurity c (nolock) on (a.lmemberid=c.lmemberid and c.lsecurityLevelID in (3, 4))
	join	tblal_securityLevel b (nolock) on (c.lsecurityLevelID=b.lsecurityLevelID) 
	join	tblLP_PartnerSiteMember r (nolock) on (a.lmemberid=r.lmemberid)
	join	tblLP_partnerSite p (nolock) on (r.lSiteID = p.lSiteID) 
	join	DataStaging..tblLP_PartnerSiteMemberIDAACoupon s on (r.lSiteID=s.lSiteID)
	where	a.sactive='Y' 
	and		p.sActive <> s.sActive 

	If exists (select 1 from dataStaging..sysobjects where name ='tblLP_PartnerSiteMemberIDAACoupon_old') 
		drop table datastaging..tblLP_PartnerSiteMemberIDAACoupon_old 

	If exists (select 1 from dataStaging..sysobjects where name ='tblLP_PartnerSiteMemberIDAACoupon') 
	Begin
		select	*
		into	datastaging..tblLP_PartnerSiteMemberIDAACoupon_old
		from	datastaging..tblLP_PartnerSiteMemberIDAACoupon

		drop table datastaging..tblLP_PartnerSiteMemberIDAACoupon
	End


	Select	*, getdate () as dtLoad 
	into	datastaging..tblLP_PartnerSiteMemberIDAACoupon 
	from	tblLP_PartnerSite 

	update	stg
	set		SiteName = '"' + convert(varchar(48), SiteName) + '"'
			,LastName = '"' + convert(varchar(48), LastName) + '"'
			,FirstName = '"' + convert(varchar(48), FirstName) + '"'
			,LoginEmail = '"' + convert(varchar(148), LoginEmail) + '"'
	From	##AAPartnerSiteLoginUpdate stg


	exec master.dbo.xp_cmdshell 'echo MemberID,SiteID,SiteName,LoginEmail,LastName,FirstName,Status>>"\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\header.txt"'
	exec master.dbo.xp_cmdshell 'bcp "select * from ##AAPartnerSiteLoginUpdate" queryout "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\aacoupon.txt" -c -t, -T -S"LA3SQL01\TonyStark"'

	set @rundate = getdate()
	set @postdate = replace(convert (varchar(10), @rundate, 120),'-','')
	set @fileName = 'AAPartnerSiteLoginUpdate_'+@postdate+'.csv'
	set @file='\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\AAPartnerSiteLoginUpdate_'+@postdate+'.csv'
	-- print @file

	set @command = 'copy "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\header.txt"+"\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\aacoupon.txt" "'+@file+'"'
	-- print @command
	exec master.dbo.xp_cmdshell @command

	set @command = 'copy "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\' + @fileName + '" "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Archive\'+@fileName+'"'
	-- print @command

	exec master.dbo.xp_cmdshell @command

	exec master.dbo.xp_cmdshell 'del "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\aacoupon.txt"'
	exec master.dbo.xp_cmdshell 'del "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\header.txt"'
	
	drop table ##AAPartnerSiteLoginUpdate

	--copy two files to ftp
	set @command = 'copy "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\*.csv" "\\caalarm01\ftpusers\ftpanalog\*.csv"'
	exec master.dbo.xp_cmdshell @command

	WaitFor Delay '00:00:15'

	exec master.dbo.xp_cmdshell 'del "\\Republic\public\Public Archive\Database File_Report\Coupon\AnalogCoupon\Outbond\*.csv"'

END
GO
