SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_CreateApiKey]
(
	@cUsername VARCHAR(50),
	@cIpaddress VARCHAR(50),
	@lMemberID INT,
	@lSecurityID INT
)
AS

	DECLARE @NEWID uniqueidentifier 
	DECLARE @cAPIKey varchar(50)
	SET @NEWID = NEWID()
	SET @cAPIKey = Convert(VARCHAR(50),@NEWID)

	INSERT INTO tbl_apiauth 
	(
		 username
		,ipaddress
		,apikey
		,memberID
		,lSecurityID
	)
	VALUES
	(
		 @cUsername
		,@cipaddress
		,@cAPIKey
		,@lMemberID
		,@lSecurityID
	)
	
	SELECT apikey 
	FROM tbl_apiauth 
	WHERE apikey = @cAPIKey 
	AND lActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CreateApiKey] TO [LocalConnect]
GO
