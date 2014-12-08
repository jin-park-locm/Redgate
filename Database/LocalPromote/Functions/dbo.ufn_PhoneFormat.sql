SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[ufn_PhoneFormat]
	(@szPhone	CHAR(10))
	RETURNS		CHAR(14)
AS
BEGIN
	RETURN '(' + SUBSTRING(@szPhone, 1, 3) + ') ' + 
				 SUBSTRING(@szPhone, 4, 3) + '-' + 
				 SUBSTRING(@szPhone, 7, 4) 
END
GO
