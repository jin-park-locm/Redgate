SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create proc [dbo].[usp_FixListinglMemberId]
(
@Old varchar(100),@New varchar(100)
)
As
--exec  usp_FixListinglMemberId 'junkacarnation@gmail.com','topcashjunkcars@gmail.com'
--select lmemberid As NewAdversiser from [LocalPromote].[dbo].tblLP_MemberInfo where szLoginEMail='topcashjunkcars@gmail.com'
--select lmemberid As OldAdversiser from [LocalPromote].[dbo].tblLP_MemberInfo where szLoginEMail='junkacarnation@gmail.com'

Declare @NewlMemberId int 
Set @NewlMemberId = (select lmemberid As NewAdversiser from [LocalPromote].[dbo].tblLP_MemberInfo where szLoginEMail=@New)
Declare @OldlMemberId int 
Set @OldlMemberId = (select lmemberid As NewAdversiser from [LocalPromote].[dbo].tblLP_MemberInfo where szLoginEMail=@Old)

select lmemberid As OldAdversiser from [LocalPromote].[dbo].tblLP_MemberInfo where szLoginEMail=@Old
select lmemberid As NewAdversiser from [LocalPromote].[dbo].tblLP_MemberInfo where szLoginEMail=@New

Update [LocalPromote].[dbo].[tblLP_BusListing]
Set lmemberid = @NewlMemberId
Where lmemberid = @OldlMemberId
GO
