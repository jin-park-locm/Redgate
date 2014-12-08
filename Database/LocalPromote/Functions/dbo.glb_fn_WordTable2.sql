SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE     FUNCTION [dbo].[glb_fn_WordTable2]
/*
  Name:		fn_WordTable
  Author:	David J. Rodecker
  Date:		10/06/04
  Description:	Returns distinct Word table of the space delimeted text
  Usage Example:
	EXEC 
  Revision History
		This version is stripped to return the full text of
		every token, not just the first eight characteres. It
		doesn't return a hash code, and it returns the order
		the tokens appear in the string.
_______________________________________________________________________
*/
	(
	@Words varchar(8000)
	)
RETURNS @tblResult
TABLE ( RowId int identity, vcWord varchar(255) NOT NULL )
AS
BEGIN
DECLARE @iWordSpace int
DECLARE @vcWord varchar(50), @SpacePOS int, @LastPos int
-- remove non-useful characters such as double space
-- 	SET @Words = REPLACE( @Words, '.', ' ')	-- Period replace
-- 	SET @Words = REPLACE( @Words, ',', ' ')	-- Commareplace
	set @Words = dbo.glb_fn_stripNonAlphaNumeric (@Words)
	WHILE CHARINDEX ( '  ', @Words) > 0
	  SET @Words = REPLACE( @Words, '  ', ' ')
	SET @iWordSpace = 1
	SET @LastPos = 0
	IF LEN( @Words ) = 0 GOTO ExitNow
	WHILE @iWordSpace > 0
	  BEGIN
		SET @SpacePOS = CHARINDEX( ' ', @Words, @LastPos )
		IF @SpacePOS = 0
		  SET @SpacePOS = LEN( @Words ) + 1
		SET @vcWord = SUBSTRING( @Words, @LastPos, @SpacePOS - @LastPos)
		  INSERT INTO @tblResult ( vcWord )
		  VALUES ( @vcWord )
		-- Move  the word window forward
		SET @LastPos = @SpacePOS + 1
		IF @LastPos > LEN( @Words )
		  BREAK
	  END
ExitNow:
  RETURN
END


GO
GRANT SELECT ON  [dbo].[glb_fn_WordTable2] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[glb_fn_WordTable2] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[glb_fn_WordTable2] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[glb_fn_WordTable2] TO [web_user]
GO
