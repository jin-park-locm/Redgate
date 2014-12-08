SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_RW_GET_ReviewStatusByReviewID]
/**********************************************************************************
Description   :   Get the Review Status by lReviewID

Change History

Date       Name     Description
---------- -------- ------------------------------------
02-04-2008 jkang    Initial Development

EXAMPLES: 	usp_RW_GET_ReviewStatusByReviewID 3, 'ABU'
		
**********************************************************************************/

@ReviewID	 	int,   
@Status			char(3)
as
SET NOCOUNT ON

Select	lStatusID, lReviewID, sStatus
From	tblRW_LocalReviewStatus 
Where	lReviewID= @ReviewID
		AND sStatus=@Status
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewStatusByReviewID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewStatusByReviewID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewStatusByReviewID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewStatusByReviewID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewStatusByReviewID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewStatusByReviewID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewStatusByReviewID] TO [web_user]
GO
