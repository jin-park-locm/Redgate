SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_RW_GET_AllAgeRange]
/**********************************************************************************
Description   :   Get the age range data

Change History

Date       Name     Description
---------- -------- ------------------------------------
02-05-2008 jkang    Initial Development

EXAMPLES: 	usp_RW_GET_AllAgeRange
		
**********************************************************************************/

as
SET NOCOUNT ON

Select	lAgeRangeID as AgeRangeID, szAgeRange as AgeRange
From	tblAL_AgeRange
Where	sActive = 'Y'

GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AllAgeRange] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AllAgeRange] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AllAgeRange] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AllAgeRange] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AllAgeRange] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AllAgeRange] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AllAgeRange] TO [web_user]
GO
