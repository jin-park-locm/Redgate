SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_BulkUploadErrorByTableKey]
    ,@ServiceCountySt2		char(2)			= NULL
    ,@Pymt_Check			char(1)			= NULL
        ,Phone 					= ISNULL(@Phone, Phone)
		,DisplayURL 			= ISNULL(@DisplayURL, DisplayURL)
        

GO