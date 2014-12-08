SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_ExpiredApiKeys] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here

	UPDATE [LocalPromote].[dbo].[tbl_apiauth] 
	SET lActive='N' 
	WHERE DATEDIFF(dd, dtDateTime, GETDATE()) > 1

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_ExpiredApiKeys] TO [LocalConnect]
GO
