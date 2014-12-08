SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_ListingSalesPerson]     @lSalesPersonID	int	,@lAdvertiserID		int    ,@szFirstName		varchar(50)	= NULL    ,@szLastName		varchar(50)	= NULL    ,@szFullName		varchar(50)	= NULL    ,@sActive			char(1)		= NULL    ,@szUpdatedBy		varchar(20)	= NULL    ,@dtUpdate			datetime	= NULL    ,@LongID			uniqueidentifier	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE  s    SET          s.[szFirstName]		= ISNULL(@szFirstName, s.[szFirstName])        ,s.[szLastName]			= ISNULL(@szLastName,  s.[szLastName])        ,s.[szFullName]			= ISNULL(@szFullName,  s.[szFullName])        ,s.[sActive]			= ISNULL(@sActive,     s.[sActive])        ,s.[szUpdatedBy]		= ISNULL(@szUpdatedBy, s.[szUpdatedBy])        ,s.[dtUpdate]			= ISNULL(@dtUpdate,	   Getdate())        ,s.[LongID]				= ISNULL(@LongID,	   s.[LongID])        	FROM tblLP_SalesPerson  s
	JOIN tblLP_ProductOrder p	ON	p.lSalesPersonID = s.lSalesPersonID
	JOIN tblLP_BusListing	b	ON  b.lAdvertiserID  = p.lAdvertiserID    WHERE s.[lSalesPersonID] = @lSalesPersonID	AND		b.[lAdvertiserID]	= @lAdvertiserIDIF @@ERROR = 0SELECT @lSalesPersonID AS lSalesPersonID, @lAdvertiserID AS lAdvertiserIDEND
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [web_user]
GO
