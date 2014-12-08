SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [dbo].[usp_final_listing_dedup] as

--clean up old working DUP tables
if 1 = (select count(*) from [ListingStore2].[dbo].sysobjects where name='acx_tbl_Listing_dup01') drop table [ListingStore2].[dbo].[acx_tbl_Listing_dup01] 
if 1 = (select count(*) from [ListingStore2].[dbo].sysobjects where name='acx_tbl_Listing_nodup01') drop table [ListingStore2].[dbo].[acx_tbl_Listing_nodup01] 

--1
Select [Title]
      ,[Address]
      ,[City]
      ,[State]
      ,[ZipCode]
      ,[PhoneNumber]
      ,[Latitude]
      ,[Longitude]
--      ,count(*)
into #z10
  FROM [ListingStore2].[dbo].[acx_tbl_Listing]
group by 
       [Title]
      ,[Address]
      ,[City]
      ,[State]
      ,[ZipCode]
      ,[PhoneNumber]
      ,[Latitude]
      ,[Longitude]
Having count(*) = 1
order by 1
--Index for speed
create clustered index z on #z10 (Title,Address,City,State,ZipCode,PhoneNumber,Latitude,Longitude)

--2 (13470463 row(s) affected) -- (813804 row(s) affected) --14284267
select distinct rid into #z20
from #z10 z join [ListingStore2].[dbo].[acx_tbl_Listing] l
on 
      z.[Title]=l.[Title]
and   z.[Address]=l.[Address]
and   z.[City]=l.[City]
and   z.[State]=l.[State]
and   z.[ZipCode]=l.[ZipCode]
and   z.[PhoneNumber]=l.[PhoneNumber]
and   z.[Latitude]=l.[Latitude]
and   z.[Longitude]=l.[Longitude]
--Index for speed
create clustered index z on #z20 (Rid)

--3.1 (13470463 row(s) affected) 
select t.* into [ListingStore2].[dbo].[acx_tbl_Listing_nodup01] 
from [ListingStore2].[dbo].[acx_tbl_Listing] t join #z20 z on t.rid=z.rid

--3.2 (813804 row(s) affected)
select t.* into [ListingStore2].[dbo].[acx_tbl_Listing_dup01] 
from [ListingStore2].[dbo].[acx_tbl_Listing] t 
where t.rid not in (select rid from #z20)

--Index for speed
create index z on [ListingStore2].[dbo].[acx_tbl_Listing_dup01] (Title)
create index z on [ListingStore2].[dbo].[acx_tbl_Listing_nodup01] (Title)

--4
Insert 
into [ListingStore2].[dbo].[acx_tbl_Listing_nodup01] 
select * 
from [ListingStore2].[dbo].[acx_tbl_Listing_dup01] 
Where Title in (
	Select Title 
	from [ListingStore2].[dbo].[acx_tbl_Listing_dup01] 
	where title not in (select title from [ListingStore2].[dbo].[acx_tbl_Listing_nodup01]) group by title having count(*) =1
				)

--5
Delete [ListingStore2].[dbo].[acx_tbl_Listing_dup01] 
Where Title in (
	Select Title 
	from [ListingStore2].[dbo].[acx_tbl_Listing_dup01] 
	group by title having count(*) =1
				)

--6
Select [Title]
      ,[Address]
      ,[City]
      ,[State]
      ,[ZipCode]
      ,[PhoneNumber]
      ,[Latitude]
      ,[Longitude]
into #z100
  FROM [ListingStore2].[dbo].[acx_tbl_Listing_dup01]
where address is null
group by 
       [Title]
      ,[Address]
      ,[City]
      ,[State]
      ,[ZipCode]
      ,[PhoneNumber]
      ,[Latitude]
      ,[Longitude]
Having count(*) = 1

--7
select distinct l.rid into #z200
from #z100 z join [ListingStore2].[dbo].[acx_tbl_Listing_dup01] l
on 
      z.[Title]=l.[Title]
--and   z.[Address]=l.[Address]
and   z.[City]=l.[City]
and   z.[State]=l.[State]
and   z.[ZipCode]=l.[ZipCode]
and   z.[PhoneNumber]=l.[PhoneNumber]
and   z.[Latitude]=l.[Latitude]
and   z.[Longitude]=l.[Longitude]

--8
Insert [ListingStore2].[dbo].[acx_tbl_Listing_nodup01]
select l.* from [ListingStore2].[dbo].[acx_tbl_Listing_dup01] l join #z200 z on l.rid=z.rid where l.address is null

--9
delete l from [ListingStore2].[dbo].[acx_tbl_Listing_dup01] l join #z200 z on l.rid=z.rid where l.address is null

--10 cleanup
drop table #z10
drop table #z20
drop table #z100
drop table #z200

--11 Get distinct listing data
select 
 l.[Title]
,l.[Address]
,l.[City]
,l.[State]
,l.[ZipCode]
,l.[PhoneNumber]
,l.[Latitude]
,l.[Longitude]
into #z
from [ListingStore2].[dbo].[acx_tbl_Listing_dup01] l
group by l.[Title]
,l.[Address]
,l.[City]
,l.[State]
,l.[ZipCode]
,l.[PhoneNumber]
,l.[Latitude]
,l.[Longitude]

--Add Priority
select distinct a.priority,d.* into #z1
from  [ListingStore2].[dbo].[acx_tbl_Listing_dup01] d join glb_tbl_AgencyId_Priority a on d.agencyid=a.agencyid
--Index for speed
create clustered index z on #z1 (Title,Address,City,State,ZipCode,PhoneNumber,Latitude,Longitude)
--Truncate 2nd dup table
truncate table [ListingStore2].[dbo].[acx_tbl_Listing_dup02]

--declare working variables for loop
Declare
	@Title [varchar](255),
	@Address [varchar](255),
	@City [varchar](255),
	@State [char](2),
	@ZipCode [varchar](10),
	@PhoneNumber [char](10),
	@Latitude [decimal](9, 6),
	@Longitude [decimal](9, 6),
	@cnt1 int
select @cnt1 = 1

-- Open cursor on stage table
DECLARE z1 CURSOR FOR 
select 
	Title,
	Address,
	City,
	State,
	ZipCode,
	PhoneNumber,
	Latitude,
	Longitude
from #z order by 1
OPEN z1
-- Fetch search details, listing by listing
FETCH NEXT FROM z1 into	@Title,@Address,@City,@State,@ZipCode,@PhoneNumber,@Latitude,@Longitude
WHILE (@@FETCH_STATUS <> -1 and @cnt1 <= (select count(*) from #z))
	begin
		Insert into [ListingStore2].[dbo].[acx_tbl_Listing_dup02]
		SELECT top 1
			   [ListingID]
			  ,[RID]
			  ,[AdvertiserID]
			  ,[Agencyid]
			  ,[Title]
			  ,[Description]
			  ,[Address]
			  ,[City]
			  ,[State]
			  ,[ZipCode]
			  ,[PhoneNumber]
			  ,[URL]
			  ,[DisplayURL]
			  ,[Tier]
			  ,[Bid]
			  ,[Latitude]
			  ,[Longitude]
			  ,[dtAdd]
			  ,[TitleSearch]
			  ,[Claimed]
			  ,[AdultFlag]
			  ,[AltPhone]
			  ,[AdvertiserIDAX]
			  ,[AgencyAX]
			  ,[Allflag]
			  ,[GEO]
		  FROM #z1 z
		  Where	  z.[Title]=@Title
			and   z.[Address]=@Address
			and   z.[City]=@City
			and   z.[State]=@State
			and   z.[ZipCode]=@ZipCode
			and   z.[PhoneNumber]=@PhoneNumber
			and   z.[Latitude]=@Latitude
			and   z.[Longitude]=@Longitude
		  Order by Priority, url desc
		--Fetch next level value/label pair
		FETCH NEXT FROM z1 into	@Title,@Address,@City,@State,@ZipCode,@PhoneNumber,@Latitude,@Longitude
		--Update counter to next level value/label pair
		Set @cnt1 = @cnt1 + 1
	end
--close and deallocate cursor
CLOSE z1
DEALLOCATE z1

--Insert cleaned up DUPs
insert [ListingStore2].[dbo].[acx_tbl_Listing_nodup01]
select * from [ListingStore2].[dbo].[acx_tbl_Listing_dup02]

--validate
Select [Title]
      ,[Address]
      ,[City]
      ,[State]
      ,[ZipCode]
      ,[PhoneNumber]
      ,[Latitude]
      ,[Longitude],count(*)
from  [ListingStore2].[dbo].[acx_tbl_Listing_nodup01]
group by 
       [Title]
      ,[Address]
      ,[City]
      ,[State]
      ,[ZipCode]
      ,[PhoneNumber]
      ,[Latitude]
      ,[Longitude]
Having count(*) > 1

--counts
select count(*) from  [ListingStore2].[dbo].[acx_tbl_Listing_nodup01]
select count(*) from  [ListingStore2].[dbo].[acx_tbl_Listing_dup01]
GO
