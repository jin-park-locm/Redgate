SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_ProductList]     @lPartnerID		int			= NULL    ,@szProductName		varchar(50)		    ,@szProductDesc		varchar(60)    ,@mDefaultPrice		money		= NULL	    ,@lLevel			int    ,@sTimeCode			char(2)    ,@sActive			char(1)		= 'Y'    ,@szUpdatedBy		varchar(20)	= 'UI'    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ON BEGINDECLARE @lProductID int    INSERT INTO [dbo].[tblLP_ProductList]    (          [lPartnerID]        ,[szProductName]        ,[szProductDesc]        ,[mDefaultPrice]        ,[lLevel]        ,[sTimeCode]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lPartnerID        ,@szProductName        ,@szProductDesc        ,@mDefaultPrice        ,@lLevel        ,@sTimeCode        ,@sActive        ,@szUpdatedBy        ,ISNULL(@dtUpdate, Getdate())            )IF @@ERROR = 0BEGIN	SELECT @lProductID = SCOPE_IDENTITY()	SELECT @lProductID AS lProductIDEND
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductList] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductList] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductList] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductList] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductList] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductList] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductList] TO [web_user]
GO
