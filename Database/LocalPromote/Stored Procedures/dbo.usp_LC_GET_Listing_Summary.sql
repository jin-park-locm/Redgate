SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_GET_Listing_Summary]
/**********************************************************************************
Description   :		Get Summary results of listing status 
					for the sites the login user belongs to

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-03-2009 dlabrie    Initial Development
06-10-2010 bwu		  Added Total Active count

EXAMPLES: 	usp_LC_GET_Listing_Summary 193678 -- level 5 CS
			usp_LC_GET_Listing_Summary 385665 -- level 3 partner
			usp_LC_GET_Listing_Summary 385649 -- level 4 partnersite
		
**********************************************************************************/
@lMemberid	int

AS
SET NOCOUNT ON

BEGIN

--Declare @lMemberid int
--set @lMemberid=193678
Declare @lsiteID int
Set @lsiteid =(	select lSiteid from tblLP_PartnerSitemember (nolock) where lmemberid=@lMemberid)
--select @lsiteid as siteid

Declare @lPartnerid int
Set @lPartnerid=(	select lpartnerid from tblLP_PartnerSiteMember m (nolock), tblLP_PartnerSite s (nolock)
					Where m.lMemberid=@lMemberid and m.lsiteid=s.lSiteid)
--select @lPartnerid as partnerid

Declare @SecurityLevel int
Set @SecurityLevel=(select lSecurityLevelID 
					from tblLP_MemberSecurity  (nolock)
					where lMemberid=@lMemberid and sActive='Y')
---select @SecurityLevel as security

Declare @TotalToBeDeleted int
Declare @NeedApprovalB int
Declare @NeedApprovalP int
Declare @TotalActiveB int
Declare @TotalActiveP int

If @SecurityLevel=5
Begin
set @TotalToBeDeleted=(Select COUNT( distinct lCCListingID) 
						from tblCC_acxListing (nolock) where sAction='DEL' and sConfirm='N')

Set @NeedApprovalB=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_PartnerListing b  (nolock)
					where	--b.lSiteid=@lsiteid and
							sListingType='FRE'
					and		b.sActive='Y'
					and		a.slastStatus='Y' 
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid) 

Set @TotalActiveB=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_PartnerListing b  (nolock)
					where	--b.lSiteid=@lsiteid and
							sListingType='FRE'
					and		b.sActive='Y'
					and		a.slastStatus='Y' 
					and		sStatus in ('APV', 'TRN')
					and		a.ladvertiserid =b.ladvertiserid) 

Set @NeedApprovalP=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_ProductOrder b  (nolock)
					where	b.sActive='Y'
					and		a.slastStatus='Y' 
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid) 

Set @TotalActiveP = (Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_ProductOrder b  (nolock)
					where	b.sActive='Y'
					and		a.slastStatus='Y' 
					and		sStatus in ('APV', 'TRN')
					and		a.ladvertiserid =b.ladvertiserid) 

Select	'Basic' as [Listing Type], 
		@NeedApprovalB as [Total NeedsApproval], 
		@TotalToBeDeleted as [Total ToBeDeleted], 
		@TotalActiveB as [Total Active]
union
Select	'Premium' as [Listing Type], 
		@NeedApprovalP as [Total NeedsApproval], 
		0 as [Total ToBeDeleted],
		@TotalActiveP as [Total Active]
END		

If  @SecurityLevel=4 -- Partner site

Begin
set @TotalToBeDeleted=0 
Set @NeedApprovalB=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_PartnerListing b  (nolock)
					where	b.lSiteid=@lsiteid 
					and		sListingType='FRE'
					and		b.sActive='Y'
					and		a.slastStatus='Y' 
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid) 

Set @TotalActiveB=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_PartnerListing b  (nolock)
					where	b.lSiteid=@lsiteid 
					and		sListingType='FRE'
					and		b.sActive='Y'
					and		a.slastStatus='Y' 
					and		sStatus in ('APV', 'TRN')
					and		a.ladvertiserid =b.ladvertiserid) 

Set @NeedApprovalP=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_ProductOrder b  (nolock),
							tblLP_ProductCampaign c (nolock)
					where	c.lSiteid=@lsiteid  
					and		c.lCIDno=b.lcidno
					and		a.slastStatus='Y' 
					and		b.sActive='Y'
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid) 

Set @TotalActiveP=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_ProductOrder b  (nolock),
							tblLP_ProductCampaign c (nolock)
					where	c.lSiteid=@lsiteid  
					and		c.lCIDno=b.lcidno
					and		a.slastStatus='Y' 
					and		b.sActive='Y'
					and		sStatus in ('APV', 'TRN')
					and		a.ladvertiserid =b.ladvertiserid) 

Select 'Basic' as [Listing Type], @NeedApprovalB as [Total NeedsApproval], @TotalToBeDeleted as [Total ToBeDeleted], 
		@TotalActiveB as [Total Active]
union
Select 'Premium' as [Listing Type], @NeedApprovalP as [Total NeedsApproval], 0 as [Total ToBeDeleted],
		@TotalActiveP as [Total Active]

END

If  @SecurityLevel=3 -- Partner
Begin
set @TotalToBeDeleted=0 /*(Select	COUNT( distinct lCCListingID) 
						from	tblCC_acxListing a,
								tblLP_PartnerListing b,
								tblLP_PartnerSite c
						where	sAction='DEL' and sConfirm='N'
						AND		a.ladvertiserid=b.ladvertiserid
						AND		b.lSiteid=c.lSiteid
						And		c.lpartnerid=@lPartnerid)*/
Set @NeedApprovalB=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_PartnerListing b  (nolock),
							tblLP_PartnerSite c (nolock)
					where	sListingType='FRE'
					and		b.sActive='Y'
					and		a.slastStatus='Y' 
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid
					AND		b.lSiteid=c.lSiteid
					And		c.lpartnerid=@lPartnerid) 

Set @TotalActiveB=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_PartnerListing b  (nolock),
							tblLP_PartnerSite c (nolock)
					where	sListingType='FRE'
					and		b.sActive='Y'
					and		a.slastStatus='Y' 
					and		sStatus in ('APV', 'TRN')
					and		a.ladvertiserid =b.ladvertiserid
					AND		b.lSiteid=c.lSiteid
					And		c.lpartnerid=@lPartnerid) 

Set @NeedApprovalP=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_ProductOrder b  (nolock),
							tblLP_PartnerSite c (nolock),
							tblLP_ProductCampaign n (nolock)
					where	a.slastStatus='Y' 					
					and		sStatus in ('AWA','CFM')
					and		b.sActive='Y'
					and		a.ladvertiserid =b.ladvertiserid
					and		b.lCIDNO=n.lCIDno
					AND		n.lSiteid=c.lSiteid
					And		c.lpartnerid=@lPartnerid)  

Set @TotalActiveP=(Select	count(*) 
					from	tblLP_busListingStatus a (nolock),
							tblLP_ProductOrder b  (nolock),
							tblLP_PartnerSite c (nolock),
							tblLP_ProductCampaign n (nolock)
					where	a.slastStatus='Y' 					
					and		sStatus in ('APV', 'TRN')
					and		b.sActive='Y'
					and		a.ladvertiserid =b.ladvertiserid
					and		b.lCIDNO=n.lCIDno
					AND		n.lSiteid=c.lSiteid
					And		c.lpartnerid=@lPartnerid)  

Select 'Basic' as [Listing Type], @NeedApprovalB as [Total NeedsApproval], 
@TotalToBeDeleted as [Total ToBeDeleted], 
		@TotalActiveB as [Total Active]
union
Select 'Premium' as [Listing Type], @NeedApprovalP as [Total NeedsApproval], 
0 as [Total ToBeDeleted],
		@TotalActiveP as [Total Active]
END

	
END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary] TO [web_user]
GO
