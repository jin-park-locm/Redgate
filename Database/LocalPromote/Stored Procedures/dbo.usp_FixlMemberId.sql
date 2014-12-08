SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [dbo].[usp_FixlMemberId]
(
@lAdvertiser int,@LoginEmail varchar(100)
)
as

/****** Script for SelectTopNRows command from SSMS  ******/
--usp_FixlMemberId 497188,'philip581@yahoo.com'
--get the listings

SELECT *
  FROM [LocalPromote].[dbo].[tblLP_BusListing]
 where ladvertiserid = @lAdvertiser
-- where ladvertiserid in (497188, 497667, 498148, 498154 )

--get the current MemberId
 select * from [LocalPromote].[dbo].tblLP_MemberInfo
 where lmemberid =
(SELECT top 1
      [lMemberID]
  FROM [LocalPromote].[dbo].[tblLP_BusListing]
 where ladvertiserid = @lAdvertiser)
-- where ladvertiserid in (497188, 497667, 498148, 498154 ) ) 
 
--get the new MemberId
 select lMemberId 
 from [LocalPromote].[dbo].tblLP_MemberInfo 
 where szLoginEmail=@LoginEmail
--where szLoginEmail='philip581@yahoo.com'

--Update the Listing MemberId
 Update [LocalPromote].[dbo].[tblLP_BusListing]
 Set lMemberId =  (
	select lMemberId 
	from [LocalPromote].[dbo].tblLP_MemberInfo 
	where szLoginEmail= @LoginEmail)
 where ladvertiserid = @lAdvertiser
-- where ladvertiserid in (497188, 497667, 498148, 498154 ) ) 
GO
