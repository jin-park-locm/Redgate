SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [dbo].[usp_LC_INS_ListingDeletionRequestNote]	 @lCCListingID	int
    ,@szNote		varchar(500)
    ,@szUpdatedby	varchar(20)
    ,@dtAdd			datetime = NULL	,@sActive		char(1) = 'N'    ASSET NOCOUNT ONDECLARE      @lCCNoteID			intIF @sActive = 'N'BEGININSERT INTO [tblCC_acxListingNote]
           (
			[lCCListingID]
           ,[szNote]
           ,[szUpdatedby]
           ,[dtAdd]
		   ,[sActive]
			)
     VALUES
           (
			 @lCCListingID
			,@szNote
			,@szUpdatedby
			,getdate()
		    , @sActive
			)IF @@ERROR = 0SELECT      @lCCNoteID = SCOPE_IDENTITY()SELECT      @lCCNoteID AS lCCNoteID RETURNENDIF @sActive = 'R'BEGINSELECT	DISTINCT 
		  n.lCCNoteID
		, x.lCCListingID as [lCCListingID] 
	    , listingID = CASE WHEN x.RID IS NULL THEN x.lAdvertiserID 
						 ELSE x.RID
					END
--		,@szNote as [szNote], 
--		@szUpdatedby as [szUpdatedby] , 
--		GETDATE() as [dtAdd], 
--		@sActive as [sActive]
 	into #lCCListingID
--drop table #lCCListingID
FROM tblCC_acxListing x
JOIN tblCC_acxListingNote n ON n.lCCListingID = x.lCCListingID
WHERE 
	((
	x.lAdvertiserID IN (
	SELECT lAdvertiserID FROM tblCC_acxListing 
	WHERE lCCListingID = @lCCListingID )
	)	OR	(
	x.RID IN (
	SELECT RID FROM tblCC_acxListing 
	WHERE lCCListingID = @lCCListingID )
	))AND n.sActive = 'N'INSERT INTO [tblCC_acxListingNote]
           (
			[lCCListingID]
           ,[szNote]
           ,[szUpdatedby]
           ,[dtAdd]
		   ,[sActive]
			)

SELECT 			
			  [lCCListingID]
			, @szNote			--as [szNote] 
			, @szUpdatedby		--as [szUpdatedby] , 
			,  GETDATE()			--as [dtAdd], 
			,  @sActive			--as [sActive]

FROM #lCCListingID

SELECT t.lCCListingID, 
	    listingID ,
--		= CASE WHEN x.RID IS NULL THEN x.lAdvertiserID 
--						 ELSE x.RID
--					END,
		p.lPartnerID,
		ps.lSiteID,
		n.lCCNoteID,
		n.szNote,
		n.szUpdatedby,
		n.sActive
into #result
FROM [tblCC_acxListingNote] n
--JOIN [tblCC_acxListing]      x ON n.lCCListingID = x.lCCListingID
JOIN #lCCListingID								  t ON t.lCCListingID = n.lCCListingID
JOIN [tblLP_PartnerSiteMember]					psm ON psm.[lMemberID] = n.[szUpdatedby]
JOIN [tblLP_PartnerSite]						 ps ON ps.lSiteID = psm.lSiteID
JOIN [tblLP_Partner]							  p	ON p.[lPartnerID] = ps.[lPartnerID]
WHERE n.sActive = 'N'

--select top 1 * from [tblCC_acxListingNote]
	UPDATE  b	SET b.[sActive] = 'Y'      	FROM [tblCC_acxListingNote] b	JOIN #lCCListingID x ON x.lCCListingID = b.lCCListingID
	WHERE 
--	((
--	x.lAdvertiserID IN (
--	SELECT lAdvertiserID FROM tblCC_acxListing 
--	WHERE lCCListingID = @lCCListingID )
--	)--	OR--	(
--	x.RID IN (
--	SELECT RID FROM tblCC_acxListing 
--	WHERE lCCListingID = @lCCListingID )
--	))	  b.sActive = 'N'
 select * from #result


END




GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequestNote] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequestNote] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequestNote] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequestNote] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequestNote] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequestNote] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequestNote] TO [web_user]
GO
