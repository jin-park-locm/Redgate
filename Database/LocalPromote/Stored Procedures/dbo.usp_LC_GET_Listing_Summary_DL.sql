SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_GET_Listing_Summary_DL]
/**********************************************************************************
Description   :		Get Summary results of listing status 
					for the sites the login user belongs to

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-03-2009 dlabrie    Initial Development

EXAMPLES: 	usp_LC_GET_Listing_Summary_DL 193678 -- level 5 CS
			usp_LC_GET_Listing_Summary_DL 385665 -- level 3 partner
			usp_LC_GET_Listing_Summary_DL 385649 -- level 4 partnersite
		
**********************************************************************************/
@lMemberid	int

AS
SET NOCOUNT ON

BEGIN

--Declare @lMemberid int
--set @lMemberid=193678
Declare @lsiteID int
Set @lsiteid =(	select lSiteid from tblLP_PartnerSitemember where lmemberid=@lMemberid)
--select @lsiteid as siteid

Declare @lPartnerid int
Set @lPartnerid=(	select lpartnerid from tblLP_PartnerSiteMember m, tblLP_PartnerSite s
					Where m.lMemberid=@lMemberid and m.lsiteid=s.lSiteid)
--select @lPartnerid as partnerid

Declare @SecurityLevel int
Set @SecurityLevel=(select lSecurityLevelID 
					from tblLP_MemberSecurity 
					where lMemberid=@lMemberid and sActive='Y')
---select @SecurityLevel as security

Declare @TotalToBeDeleted int
Declare @NeedApprovalB int
Declare @NeedApprovalP int

If @SecurityLevel=5
Begin
set @TotalToBeDeleted=(Select COUNT( distinct lCCListingID) 
						from tblCC_acxListing where sAction='DEL' and sConfirm='N')

Set @NeedApprovalB=(Select	count(*) 
					from	tblLP_busListingStatus a,
							tblLP_PartnerListing b 
					where	--b.lSiteid=@lsiteid and
							sListingType='FRE'
					and		a.slastStatus='Y' 
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid) 

Set @NeedApprovalP=(Select	count(*) 
					from	tblLP_busListingStatus a,
							tblLP_ProductOrder b 
					where	b.sActive='Y'
					and		a.slastStatus='Y' 
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid) 

Select 'Basic' as [Listing Type], @NeedApprovalB as [Total NeedsApproval], 
@TotalToBeDeleted as [Total ToBeDeleted]
union
Select 'Premium' as [Listing Type], @NeedApprovalP as [Total NeedsApproval], 
0 as [Total ToBeDeleted]
END

If  @SecurityLevel=4 -- Partner site

Begin
set @TotalToBeDeleted=(Select	COUNT( distinct lCCListingID) 
						from	tblCC_acxListing a,
								tblLP_PartnerListing b
						where	sAction='DEL' and sConfirm='N'
						AND		a.ladvertiserid=b.ladvertiserid
						AND		b.lSiteid=@lSiteid)
Set @NeedApprovalB=(Select	count(*) 
					from	tblLP_busListingStatus a,
							tblLP_PartnerListing b 
					where	b.lSiteid=@lsiteid 
					and		sListingType='FRE'
					and		a.slastStatus='Y' 
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid) 

Set @NeedApprovalP=(Select	count(*) 
					from	tblLP_busListingStatus a,
							tblLP_ProductOrder b ,
							tblLP_ProductCampaign c
					where	c.lSiteid=@lsiteid  
					and		c.lCIDno=b.lcidno
					and		a.slastStatus='Y' 
					and		b.sActive='Y'
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid) 

Select 'Basic' as [Listing Type], @NeedApprovalB as [Total NeedsApproval], @TotalToBeDeleted as [Total ToBeDeleted]
union
Select 'Premium' as [Listing Type], @NeedApprovalP as [Total NeedsApproval], 0 as [Total ToBeDeleted]

END

If  @SecurityLevel=3 -- Partner
Begin
set @TotalToBeDeleted=(Select	COUNT( distinct lCCListingID) 
						from	tblCC_acxListing a,
								tblLP_PartnerListing b,
								tblLP_PartnerSite c
						where	sAction='DEL' and sConfirm='N'
						AND		a.ladvertiserid=b.ladvertiserid
						AND		b.lSiteid=c.lSiteid
						And		c.lpartnerid=@lPartnerid)
Set @NeedApprovalB=(Select	count(*) 
					from	tblLP_busListingStatus a,
							tblLP_PartnerListing b ,
							tblLP_PartnerSite c
					where	sListingType='FRE'
					and		a.slastStatus='Y' 
					and		sStatus in ('AWA','CFM')
					and		a.ladvertiserid =b.ladvertiserid
					AND		b.lSiteid=c.lSiteid
					And		c.lpartnerid=@lPartnerid) 

Set @NeedApprovalP=(Select	count(*) 
					from	tblLP_busListingStatus a,
							tblLP_ProductOrder b ,
							tblLP_PartnerSite c,
							tblLP_ProductCampaign n
					where	a.slastStatus='Y' 					
					and		sStatus in ('AWA','CFM')
					and		b.sActive='Y'
					and		a.ladvertiserid =b.ladvertiserid
					and		b.lCIDNO=n.lCIDno
					AND		n.lSiteid=c.lSiteid
					And		c.lpartnerid=@lPartnerid)  

Select 'Basic' as [Listing Type], @NeedApprovalB as [Total NeedsApproval], 
@TotalToBeDeleted as [Total ToBeDeleted]
union
Select 'Premium' as [Listing Type], @NeedApprovalP as [Total NeedsApproval], 
0 as [Total ToBeDeleted]
END



	
ENd
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_DL] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_DL] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_DL] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_DL] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_DL] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_DL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_DL] TO [web_user]
GO
