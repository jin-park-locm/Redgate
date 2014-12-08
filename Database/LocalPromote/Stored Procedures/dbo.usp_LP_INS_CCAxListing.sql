SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

Create PROCEDURE [dbo].[usp_LP_INS_CCAxListing]

/**********************************************************************************
Description   :   Inserts a record into the tblCC_acxLisitng table

Change History

Date       Name     Description
---------- -------- ------------------------------------
08-08-08   bwu      Initial Development
08-12-08   dlabrie  make insert only and remove all conditions
09-16-2008 dlabrie  add confirm code to the sp
11-03-08   bwu		Changed @Advertiserid to varchar(20) from int	
11-05-08   bwu      Changed delete exsisting RID for upd and del
11-06-08   bwu      changed postcode to varchar(10) from char(10)
03-13-09   bwu      changed to insert BDC to tblCC_AXBDC table.

EXAMPLES: exec usp_LP_INS_CCAxListing 
	@RID=12345, @AdvertiserID='567__89', @AgencyId='AF', @Title='JSK Cleaning Company', 
	@Address='1234 Main Street uuu', @City='Irvine', @State='CA', @PostalCode=92618, 
	@PhoneNumber='9491234567', @URL='www.test.com',
	@BDC1='123456', @Action='UPD', @HideAddr='Y',@user='test',@UserType=0

exec usp_LP_INS_CCAxListing @AgencyID='AX',@Title='Cuong Testing CC listing',@Address='1 technology',
	@City='Irvine',@State='CA',@PostalCode='92618',@PhoneNumber='9999999999',@URL='http://local.test.com',
	@BDC1=25180222,@BDC2=22041019,@user='175338',@Action='ADD',@UserType=1,@HideAddr='N'

SELECT * from tblCC_acxListing where szTitle like '%Cuong Testing CC%'
select * from tblCC_acxBDC where lCCListingID in (SELECT lCCListingID from tblCC_acxListing where szTitle like '%Cuong Testing CC%')

**********************************************************************************/
@RID			int = null,
@AdvertiserID	varchar(20) = null,
@AgencyId		char(2) = null,		
@Title			varchar(250),
@Address		varchar(250)=null,
@City			varchar(50),
@State			char(2),
@PostalCode		varchar(10),
@PhoneNumber	varchar(12),
@URL			varchar(250) = null,
@BDC1			int,
@BDC2			int = null,
@Action			char(3),
@HideAddr		char(1)='N',
@user			varchar(20),
@UserType		tinyint --- 1: super user Local.com 0: Other
AS

SET NOCOUNT ON

BEGIN

Declare @lCCListingID int
Declare @Confirm char(1)
Set @confirm=(Select case @UserType when 1 then 'Y' else 'N' end)

if @Action in ('A', 'a') 
	set @Action = 'ADD'

if @Action in ('D', 'd')
	set @Action = 'DEL'

if @Action in ('U', 'u')
	set @Action = 'UPD'

delete from tblCC_acxListing 
where RID = @RID and sAction = @Action and sConfirm <> 'T' 
	and sAction in ('UPD', 'DEL') and ((RID is not null) or (RID <> 0)) 

	Insert Into tblCC_acxListing
	(
		RID,
		lAdvertiserID,
		sAgencyID,
		szTitle, 
		szAddress,
		szCity, 
		sState, 
		szZip,
		szPhone, 
		szURL, 
		sHideAddr,
		sAction,
		sUpdate,
		sConfirm,
		dtAdd
	)
	values( 
		@RID,
		@AdvertiserID,
		@AgencyId,
		@Title, 
		@Address,
		@City, 
		@State, 
		@PostalCode,
		@PhoneNumber, 
		@URL, 	
		@HideAddr,
		@Action, 
		@user,  
		@Confirm,
		getdate()
	)

set @lCCListingID = (select max(lCCListingID) from tblCC_acxListing)

if isnull(@RID, 0) <> 0
begin
	if not exists(select * from tblCC_acxBDC where RID = @RID and sDBState = 'OLD' and dtTurn is null)
		insert into tblCC_acxBDC
		(lCCListingID, RID, BDC, sDBState, sAction, sConfirm, sUpdate, dtUpdate)
		select @lCCListingID, @RID, BDC, 'OLD', @Action, @Confirm, @user, getdate()
		from listingStoreMaster..acx_map_ListingBDC
		where RID = @RID

	update tblCC_acxBDC set sConfirm = '0' where RID = @RID and sDBState = 'NEW' and dtTurn is null

end

if isnull(@BDC1, 0) <> 0
	begin	
		if not exists (select * from tblCC_acxBDC where RID = @RID and BDC = @BDC1 and sDBState = 'NEW' and dtTurn is null)
			insert into tblCC_acxBDC
			(lCCListingID, RID, BDC, sDBState, sAction, sConfirm, sUpdate, dtUpdate)
			values(@lCCListingID, @RID, @BDC1, 'NEW', @Action, @Confirm, @user, getdate())	
		else 
			update  tblCC_acxBDC set sConfirm = @confirm where RID = @RID and BDC = @BDC1 and sDBState = 'NEW' and dtTurn is null
	end
else
	BEGIN
		RAISERROR('Min of 1 category is required.', 16, 1)
		RETURN 50000
	END

if isnull(@BDC2, 0) <> 0
	begin
		if not exists (select * from tblCC_acxBDC where RID = @RID and BDC = @BDC2 and sDBState = 'NEW' and dtTurn is null)
			insert into tblCC_acxBDC
			(lCCListingID, RID, BDC, sDBState, sAction, sConfirm, sUpdate, dtUpdate)
			values(@lCCListingID, @RID, @BDC2, 'NEW', @Action, @Confirm, @user, getdate())	
		else
			update  tblCC_acxBDC set sConfirm = @confirm where RID = @RID and BDC = @BDC2 and sDBState = 'NEW' and dtTurn is null
	End

delete from tblCC_acxBDC where RID = @RID and sDBState = 'NEW' and sConfirm = '0' and dtTurn is null

END

GO
GRANT EXECUTE ON  [dbo].[usp_LP_INS_CCAxListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_CCAxListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_CCAxListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_CCAxListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_CCAxListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_CCAxListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_CCAxListing] TO [web_user]
GO
