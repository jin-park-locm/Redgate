SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create View [dbo].[vw_ActiveAdvertiserReport] as
 select 
  bl.sSource as Agency
 ,mi.szFirstName as FirstName	
 ,mi.szLastName as LastName	
 ,bl.sztitle as Title	
 ,bl.szStreetName as streetname	
 ,bl.szCity as city	
 ,bl.sState as state	
 ,bl.sPostalCode as PostalCode	
 ,bl.szEmail as Email	
 ,bl.szPhone as Phone	
 ,po.sActive as Active
 ,po.dtBeginning as Beginning
 ,po.dtEnd as [End]
 from dbo.tblLP_BusListing bl
 join dbo.tblLP_ProductOrder po on bl.ladvertiserId=po.ladvertiserid
 join dbo.tblLP_MemberInfo mi on bl.lmemberid=mi.lmemberid
 join (
		 select mi.lmemberid,min(po.lorderno) as lOrderNo 
		 from dbo.tblLP_BusListing bl
		 join dbo.tblLP_ProductOrder po on bl.ladvertiserId=po.ladvertiserid and po.sactive='y'
		 join dbo.tblLP_MemberInfo mi on bl.lmemberid=mi.lmemberid and mi.sactive='y'
		 group by mi.lmemberid
	) z on po.lOrderNo=z.lOrderNo and mi.lmemberid=z.lmemberid
 join dbo.tblLP_ProductCampaign pc on po.lCIDNo=pc.lCIDNo
 join dbo.tblLP_PartnerSite ps on ps.lSiteId=pc.lSiteId and ps.lPartnerId in (1,5)
GO
