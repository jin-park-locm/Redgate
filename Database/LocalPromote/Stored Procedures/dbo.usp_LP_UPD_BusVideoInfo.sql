SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS OFF
GO
--ALTER 
CREATE 
PROCEDURE [dbo].[usp_LP_UPD_BusVideoInfo]
-- --------------------------------------------------------------------------------  -- 
-- Description   :  Insert a Listing's Video and / or Video link and Information.
--
-- These scripts may be used by the following:
--     - Web Application named Local Promote - LPAdmin.
--     - Web Application named Local.com Self Serivce website.
--
-- Change History:
-- Date     Name     Description
-- -------- -------- ------------------------------------
-- 2008-12-08 rfox    Initial Development
-- 2009-04-28 rfox	  Added tables see LCENH-324 and LPENH-220
--
-- EXAMPLE to run this sp_ usp_LP_UPD_BusVideoInfo: 	
--		exec usp_LP_INS_BusVideoInfo @lBusVideoInfoId=2,@lAdvertiserID=170593,@lBusVideoTypeId=3,
--		@lBusVideoLocationId=2,@szVideoTitle='Video Killed the Radio Star',
--		@szVideoDesc='Classic New Wave Music Video by the Buggles.',
--		@ADDRlDataScrubbedStatusId=4,@lBusVideoAddressTypeId=4,@szBusVideoAddress='&lt;object 
--			classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" 
--			id="mixpo_player" 
--			codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab" 
--			width="320" 
--			height="240"&gt; 
--				&lt;param 
--					name="movie" 
--					value="http://swf.mixpo.com/player/main.swf" 
--					/&gt; 
--
--				&lt;param 
--					name="quality" 
--					value="high" 
--					/&gt; 
--				&lt;param 
--					name="bgcolor" 
--					value="#000000" 
--					/&gt; 
--				&lt;param 
--					name="allowScriptAccess" 
--					value="always" 
--					/&gt; 
--				&lt;param 
--					name="allowFullScreen" 
--					value="true" 
--					/&gt; 
--				&lt;param 
--					name="flashvars" 
--					value="guid=08d42359-7b27-4c17-a7e0-1a79bc9bf29d&environment=&host=www.mixpo.com&forcePlay=false&autoPlay=true&autoPlayAudio=false" 
--					/&gt; 
--
--				&lt;embed 
--					src="http://swf.mixpo.com/player/main.swf" 
--					quality="high" 
--					bgcolor="#000000" 
--					width="320" 
--					height="240" 
--					name="mixpo_player" 
--					align="middle" 
--					play="true" 
--					loop="false" 
--					quality="high" 
--					allowScriptAccess="always" 
--					allowFullScreen="true" 
--					flashvars="guid=08d42359-7b27-4c17-a7e0-1a79bc9bf29d&environment=&host=www.mixpo.com&forcePlay=false&autoPlay=true&autoPlayAudio=false" 
--					type="application/x-shockwave-flash" 
--					pluginspage="http://www.adobe.com/go/getflashplayer"&gt; 
--				&lt;/embed&gt; 
--		&lt;/object&gt;
--		&lt;a href="http://www.mixpo.com" style="font-size: 10px; display:block"&gt;VideoAd by Mixpo&lt;/a&gt;
--
--
--		',@XMLlDataScrubbedStatusId=4,@szXmlTag='embed',@szXmlTagValue=default,@SRClDataScrubbedStatusId=4,
--		@SRCszXmlTagElement='src',@SRCszXmlTagElementValue='http://swf.mixpo.com/player/main.swf',
--		@FVARlDataScrubbedStatusId=4,@FVARszXmlTagElement='flashvars',
--		@FVARszXmlTagElementValue='guid=08d42359-7b27-4c17-a7e0-1a79bc9bf29d&environment=&host=www.mixpo.com&forcePlay=false&autoPlay=true&autoPlayAudio=false'
--
-- Example to see results:
--	SELECT 
--		i.*
--		,a.*
--		,x.*
--		,e.*
--	FROM
--		tblLP_BusVideoInfo i
--		JOIN
--			tblLP_BusVideoAddress a
--				ON i.lBusVideoInfoId = a.lBusVideoInfoId
--			JOIN
--				tblLP_BusVideoXmlTag x
--					ON a.lBusVideoAddressId = x.lBusVideoAddressId
--				JOIN tblLP_BusVideoXmlTagElement e
--					ON x.lBusVideoXmlTagId = e.lBusVideoXmlTagId
--
--
-- --------------------------------------------------------------------------------  --	

	-- TABLE tblLP_BusVideoInfo --
	@lBusVideoInfoId			INT				= NULL,
	@lAdvertiserID				INT,
	@lBusVideoTypeId			INT,
	@lBusVideoLocationId		INT,
	@szVideoTitle 				VARCHAR(100),
	@szVideoDesc 				VARCHAR(255)	= NULL,

	-- TABLE tblLP_BusVideoAddress --
	@ADDRlDataScrubbedStatusId	INT				= NULL,
	@lBusVideoAddressTypeId		INT				= NULL,
	@szBusVideoAddress			VARCHAR(6000)	= NULL, -- This is where we store the user's embed code and the like.

	-- TABLE tblLP_BusVideoXmlTag  -
	@XMLlDataScrubbedStatusId	INT				= NULL,
	@szXmlTag					VARCHAR(255)	= NULL,
	@szXmlTagValue				VARCHAR(6000)	= NULL,

	-- TABLE tblLP_BusVideoXmlTagElement --
	@SRClDataScrubbedStatusId	INT				= NULL,
	@SRCszXmlTagElement			VARCHAR(255)	= NULL,
	@SRCszXmlTagElementValue	VARCHAR(6000)	= NULL,
	@FVARlDataScrubbedStatusId	INT				= NULL,
	@FVARszXmlTagElement		VARCHAR(255)	= NULL,
	@FVARszXmlTagElementValue	VARCHAR(6000)	= NULL

AS

-- SET NOCOUNT ON

BEGIN -- Begin sp_

-- BEGIN Declare vars --

	DECLARE @err						INT
	DECLARE @rowC						INT
	DECLARE @TranCountOnEntry			INT	
	DECLARE @xScope_Identity			INT
	
	DECLARE @xlBusVideoInfoId			INT
	DECLARE @xlBusVideoFileId			INT
	DECLARE @xlBusVideoAddressId		INT
	DECLARE @xlBusVideoXmlTagId			INT
	DECLARE @xlBusVideoXmlTagElementId	INT

	DECLARE @xUrl						VARCHAR(8000)
	DECLARE @xUrlPath					VARCHAR(8000)
	DECLARE @xUrlSearchPart				VARCHAR(8000)
	DECLARE @xQueryStringParam			VARCHAR(255)
	DECLARE @xQueryStringValue			VARCHAR(255)
	DECLARE @xSearchPartBeginsWith		VARCHAR(100)
	DECLARE @xSearchPartDelimiter		VARCHAR(20)
	DECLARE @xLoopCounter				INT
	DECLARE @xCharIndexSearchPart		INT
	DECLARE @xCharIndexAmpersand		INT
	DECLARE @xCharIndexAmpersandXml		INT
	DECLARE @xCharIndexEqualSign		INT
	DECLARE @xCharIndexStart			INT
	DECLARE @xCharIndexEnd				INT
	DECLARE @xSubstringLength			INT
	DECLARE @xSearchPartDelimiterQuestionMark INT
	DECLARE @xSearchPartDelimiterAmpersand INT
	DECLARE @xSearchPartDelimiterSlash	INT
	DECLARE @xSearchPartDelimiterEqual	INT
	DECLARE @xSearchPartDelimiterComma	INT
	DECLARE @xCharIndexAmpersandNext	INT


-- END Declare vars --
-- BEGIN Set Vars --

	SET @err = 0
	
-- END Set Vars --


-- Keeping with this application's design we are deleting rather than really updating.
--IF (@lBusVideoInfoId IS NOT NULL)
--BEGIN
	EXEC @err = usp_LP_DEL_BusVideoInfo NULL, @lAdvertiserID
--END

IF (@err = 0)
BEGIN

	INSERT INTO tblLP_BusVideoInfo
	(
		lAdvertiserID,
		lBusVideoTypeId,
		lBusVideoLocationId,
		szVideoTitle,
		szVideoDesc
	)
	VALUES
	(
		@lAdvertiserID,
		@lBusVideoTypeId,
		@lBusVideoLocationId,
		@szVideoTitle,
		@szVideoDesc
	)

	-- Get the id of the last INSERT:
	SELECT @rowC = @@ROWCOUNT, @err = @@ERROR

	IF (@rowC > 0)
	BEGIN
		SELECT @xlBusVideoInfoId = SCOPE_IDENTITY()
	END

	-- ---------------------------------------------------------------- --

	INSERT INTO tblLP_BusVideoAddress
	(
		lBusVideoInfoId,
		lBusVideoAddressTypeId,
		lDataScrubbedStatusId,
		szBusVideoAddress
	)
	VALUES
	(
		@xlBusVideoInfoId,
		@lBusVideoAddressTypeId,
		@ADDRlDataScrubbedStatusId,
		@szBusVideoAddress
	)

	-- Get the id of the last INSERT:
	SELECT @rowC = @rowC + @@ROWCOUNT, @err = @@ERROR

	IF (@rowC > 0)
	BEGIN
		SELECT @xlBusVideoAddressId = SCOPE_IDENTITY()
	END

	-- ---------------------------------------------------------------- --

	INSERT INTO tblLP_BusVideoXmlTag
	(
		lBusVideoAddressId,
		lDataScrubbedStatusId,
		szXmlTag,
		szXmlTagValue
	)
	VALUES
	(
		@xlBusVideoAddressId,
		@XMLlDataScrubbedStatusId,
		@szXmlTag,
		@szXmlTagValue
	)

	-- Get the id of the last INSERT:
	SELECT @rowC = @rowC + @@ROWCOUNT, @err = @@ERROR

	IF (@rowC > 0)
	BEGIN
		SELECT @xlBusVideoXmlTagId = SCOPE_IDENTITY()
	END

	-- ---------------------------------------------------------------- --

	INSERT INTO tblLP_BusVideoXmlTagElement
	(
		lBusVideoXmlTagId,
		lDataScrubbedStatusId,
		szXmlTagElement,
		szXmlTagElementValue
	)
	VALUES
	(
		@xlBusVideoXmlTagId,
		@SRClDataScrubbedStatusId,
		@SRCszXmlTagElement,
		@SRCszXmlTagElementValue
	)

	-- Get the id of the last INSERT:
	SELECT @rowC = @rowC + @@ROWCOUNT, @err = @@ERROR

	SET @xScope_Identity = SCOPE_IDENTITY()

-- ---------------------------------------------------------------- --


-- ---------------------------------------------------------------- --
-- ---------------------------------------------------------------- --
--																	--
-- START Parse and INSERT of BusVideo URL Query String parameteres	--
--					(reference RFC 1738)							--
-- ---------------------------------------------------------------- --
-- ---------------------------------------------------------------- --

--USE LOCALPROMOTE
--GO
--DECLARE @err						INT
--DECLARE @rowC						INT
--DECLARE @xScope_Identity INT
--SET @xScope_Identity = 5000


--DECLARE @xUrl VARCHAR(8000)
--DECLARE @xUrlPath VARCHAR(8000)
--DECLARE @xUrlSearchPart VARCHAR(8000)
--DECLARE @xLoopCounter INT
--DECLARE @xCharIndexSearchPart INT
--DECLARE @xCharIndexAmpersand INT
--DECLARE @xCharIndexAmpersandXml INT
--DECLARE @xCharIndexEqualSign INT
--DECLARE @xCharIndexStart INT
--DECLARE @xCharIndexEnd INT
--DECLARE @xSubstringLength INT
--DECLARE @xQueryStringParam AS VARCHAR(255)
--DECLARE @xQueryStringValue AS VARCHAR(255)
--DECLARE @xSearchPartDelimiterQuestionMark INT
--DECLARE @xSearchPartDelimiterAmpersand INT
--DECLARE @xSearchPartDelimiterSlash INT
--DECLARE @xSearchPartDelimiterEqual INT
--DECLARE @xSearchPartDelimiterComma INT
--DECLARE @xSearchPartBeginsWith VARCHAR(100)
--DECLARE @xSearchPartDelimiter VARCHAR(20)
--DECLARE @xCharIndexAmpersandNext	INT

SET @xUrl = RTRIM(@SRCszXmlTagElementValue)

-- Test USE CASES:
-- Assumptions: 
-- 1) SearchPart / Query string can only begin with: "?", "&" , "/", "," .
-- 2) SearchPart / Query string can only be delimited with: "&" , "," .
-- 3) SearchPart / Query string can only end with nothing or one of the delimiters.

--SET @xUrl = 'http://www.youtube.com/v/yZLTDPYcryY&hl=en&fs=1'
--SET @xUrl = 'http://www.youtube.com/watch?v=GXqJ1MJQPhQ'
--SET @xUrl = 'http://www.youtube.com/watch?=GXqJ1MJQPhQ'
--SET @xUrl = 'http://www.youtube.com/watchv=GXqJ1MJQPhQ'
--SET @xUrl = 'http://www.youtube.com/watch?GXqJ1MJQPhQ'
--SET @xUrl = 'http://www.youtube.com/watch&GXqJ1MJQPhQ'
--SET @xUrl = 'http://www.youtube.com/watchGXqJ1MJQPhQ'
--SET @xUrl = 'http://www.youtube.com/v/1UZtbusLD-c&hl=en&fs=1'
--SET @xUrl = 'http://www.youtube.com/v/yZLTDPYcryY&hl=en&fs=1'
--SET @xUrl = 'http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?ver=2.2.34'
--SET @xUrl = 'http://www.youtube.com/v/1UZtbusLD-c'
--SET @xUrl = 'http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?ver'
--SET @xUrl = 'http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?cat=May2009&ver=2.2.34&Product=gear1324'
--SET @xUrl = 'http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?Product=gear1324&amp;cat=May2009&amp;ver=2.2.34='
--SET @xUrl = 'http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?Product=gear1324&amp;cat=May2009&amp;ver=2.2.34=&rel=0'
--SET @xUrl = 'http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?catMay2009&ver=2.2.34&Product=gear1324'
--SET @xUrl = 'http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?cat=May2009ver=2.2.34&Product=gear1324'
--SET @xUrl = 'http://www.youtube.com/v/yZLTDPYcryY?show=0&h&l=enfs=1&rel=0'
--SET @xUrl = 'http://mediaservices.myspace.com/services/media/embed.aspx/m=56597350,t=1,mt=video,searchID=,primarycolor=,secondarycolor='
--SET @xUrl = 'http://mediaservices.myspace.com/services/media/embed/m=56597350,t=1,mt=video,searchID=,primarycolor=,secondarycolor='


-- replace Ampersand code with an ampersand
SET @xUrl = REPLACE(@xUrl, '&amp;', '&')

SET @xSearchPartDelimiterQuestionMark = CHARINDEX('?', @xUrl)
SET @xSearchPartDelimiterAmpersand = CHARINDEX('&', @xUrl)

SET @xLoopCounter = 0

SET @xCharIndexSearchPart = 
	CASE @xSearchPartDelimiterQuestionMark 
		WHEN 0 
			THEN @xSearchPartDelimiterAmpersand 
		ELSE @xSearchPartDelimiterQuestionMark 
	END


IF (@xCharIndexSearchPart < 1)
BEGIN
	-- For MySpace video replace Commas with Ampersands.
	-- "mediaservices.myspace.com/" does not use a Search Part "begin with".

	SET @xSearchPartDelimiterEqual = CHARINDEX('=', @xUrl)
	SET @xSearchPartDelimiterSlash = LEN(@xUrl) - CHARINDEX('/', REVERSE(@xUrl)) + 1
	SET @xSearchPartDelimiterComma = CHARINDEX(',', @xUrl)

	IF (@xSearchPartDelimiterEqual > 0)
	BEGIN
		PRINT 'We have an Equal sign so we MAY have params.'
		
		IF (@xSearchPartDelimiterComma < 1)
		BEGIN
			PRINT 'We have an Equal sign but no Comma so we We MAY have zero or one param. Setting SearchPart at slash.'
			SET @xCharIndexSearchPart = @xSearchPartDelimiterSlash
		END
		ELSE IF (@xSearchPartDelimiterComma < @xSearchPartDelimiterEqual)
		BEGIN
			PRINT 'We have a Comma that is BEFORE the Equal sign. Setting SearchPart at Comma.'
			SET @xSearchPartDelimiter = ','
			SET @xCharIndexSearchPart = @xSearchPartDelimiterComma
			SET @xUrl = REPLACE(@xUrl, ',', '&')
		END
		ELSE
		BEGIN
			PRINT 'We have a Comma past the Equal sign. Setting SearchPart at slash.'
			SET @xSearchPartDelimiter = ','
			SET @xCharIndexSearchPart = @xSearchPartDelimiterSlash
			SET @xUrl = REPLACE(@xUrl, ',', '&')
		END -- Ends else "IF (@xSearchPartDelimiterComma < 1)"
	END -- Ends "IF (@xSearchPartDelimiterEqual > 0)"
END -- Ends "IF (@xCharIndexSearchPart < 1)"
	

IF (@xCharIndexSearchPart > 0)
BEGIN
	PRINT 'We have a Search Part starting at CharIndex number.'
	PRINT @xCharIndexSearchPart
	
	SET @xSearchPartBeginsWith = SUBSTRING(@xUrl, @xCharIndexSearchPart, 1)

	-------------------------------
	--  START Prep of Url Path  ---
	-------------------------------
	
	SELECT @xUrlPath = SUBSTRING(@xUrl, 1, @xCharIndexSearchPart - 1)
	PRINT '@xUrlPath'
	PRINT @xUrlPath
	
	
	-----------------------------
	--  END Prep of Url Path  ---
	-----------------------------

	SET @xUrlSearchPart = SUBSTRING(@xUrl, @xCharIndexSearchPart + 1, LEN(@xUrl) - @xCharIndexSearchPart)


	WHILE (LEN(@xUrlSearchPart) > 0)
	BEGIN
		PRINT 'We have a SearchPart, @xUrlSearchPart ='
		PRINT @xUrlSearchPart

		-- This @xLoopCounter is used for the parent table insert code below & the fail safe code below.
		SET @xLoopCounter = @xLoopCounter + 1

		IF @xSearchPartDelimiter IS NULL
		BEGIN
			SET @xSearchPartDelimiter = '&'
		END
				
		--------------------------------------
		-- START Prep for Url Query String ---
		--------------------------------------
		SET @xCharIndexEqualSign = CHARINDEX('=', @xUrlSearchPart)
		PRINT '@xCharIndexEqualSign = '
		PRINT @xCharIndexEqualSign
		
		SET @xCharIndexAmpersand = CHARINDEX('&', @xUrlSearchPart)
		PRINT '@xCharIndexAmpersand = '
		PRINT @xCharIndexAmpersand

		SET @xCharIndexStart = 1

		--------------------------------------
		--  END Prep for Url Query String  ---
		--------------------------------------
		--IF (@xCharIndexAmpersand > 0 AND @xCharIndexAmpersand < @xCharIndexEqualSign)
		--BEGIN
		--	PRINT 'Ampersands in parameter names are not valid. Rejecting this entire Query String.'
		--	BREAK
		--END



-- ******************************************************************************************** --

		IF (@xCharIndexEqualSign < 1)
		BEGIN 
			PRINT 'We have a SearchPart without a param value.'
			SET @xQueryStringParam = SUBSTRING(@xUrlSearchPart, @xCharIndexStart, LEN(@xUrlSearchPart) - @xCharIndexStart + 1)
			SET @xQueryStringValue = ''
			PRINT '@xQueryStringParam = '
			PRINT @xQueryStringParam
		END
		ELSE IF (@xCharIndexEqualSign = 1)
		BEGIN 
			PRINT 'We have no parameter so exit'
		END
		ELSE
		BEGIN
			PRINT 'We have a param and maybe a value.'

			IF (@xCharIndexAmpersand < 1)
			BEGIN 
				PRINT 'We have no more parameters.'
				SET @xCharIndexStart = 1
				SET @xSubstringLength = @xCharIndexEqualSign -1 
				SET @xQueryStringParam = SUBSTRING(@xUrlSearchPart, @xCharIndexStart, @xSubstringLength)
				
				-- Prep to grab value.
				SET @xCharIndexStart = @xCharIndexEqualSign + 1
				
			END
			ELSE IF (@xCharIndexEqualSign > @xCharIndexAmpersand)
			BEGIN 
				PRINT 'We have a param with no EqualSign so it will have no value.'
				PRINT '@xCharIndexEqualSign > @xCharIndexAmpersand'
				
				SET @xCharIndexStart = 1
				SET @xSubstringLength = CHARINDEX('&', @xUrlSearchPart) - @xCharIndexStart
				SET @xQueryStringParam = SUBSTRING(@xUrlSearchPart, @xCharIndexStart, @xSubstringLength)

				-- Prep to grab value (which will be '' in this case).	
				SET @xCharIndexStart = @xSubstringLength + 1

			END
			ELSE
			BEGIN
				PRINT 'We have an EqualSign delimiter. @xCharIndexEqualSign was not > than @xCharIndexAmpersand'
				
				SET @xSubstringLength = @xCharIndexEqualSign - @xCharIndexStart
				SET @xQueryStringParam = SUBSTRING(@xUrlSearchPart, @xCharIndexStart, @xSubstringLength)
				
				-- Prep to grab value.	
				SET @xCharIndexStart = @xSubstringLength + 2

			END

			PRINT '@xSubstringLength = '
			PRINT @xSubstringLength

			PRINT '@xQueryStringParam = '
			PRINT @xQueryStringParam
			
			PRINT '@xCharIndexStart for the value = '
			PRINT @xCharIndexStart
							
			-- ----------------------------- --
			-- START search for the value    --
			-- ----------------------------- --
			PRINT 'START search for the value.'			
			
			SET @xCharIndexAmpersand = CHARINDEX('&', @xUrlSearchPart, @xCharIndexStart)

			PRINT '@xCharIndexAmpersand = '
			PRINT @xCharIndexAmpersand
			
			IF (@xCharIndexAmpersand = 1)
			BEGIN
				PRINT 'No value so set to blank.'
				SET @xQueryStringValue = ''
			END
			ELSE IF (@xCharIndexAmpersand > 1)
			BEGIN
				PRINT 'We have a value'
				SET @xSubstringLength = CHARINDEX('&', @xUrlSearchPart, @xCharIndexStart) - @xCharIndexStart
				SET @xQueryStringValue = SUBSTRING(@xUrlSearchPart, @xCharIndexStart, @xSubstringLength)
			END
			ELSE
			BEGIN
				PRINT 'Last param, we may have a value.'
				PRINT 'LEN(@xUrlSearchPart) = '
				PRINT LEN(@xUrlSearchPart)
			
				SET @xSubstringLength = LEN(@xUrlSearchPart) + 1 - @xCharIndexStart
				SET @xQueryStringValue = SUBSTRING(@xUrlSearchPart, @xCharIndexStart, @xSubstringLength)
			END			
			
			PRINT '@xSubstringLength = '
			PRINT @xSubstringLength
			
			PRINT '@xQueryStringValue = '
			PRINT @xQueryStringValue


		END -- Ends "IF (@xCharIndexEqualSign < 1)"
		
		
		IF (LEN(@xQueryStringParam) > 0)
		BEGIN
		
			------------------------------
			-- START INSERT of URL Path --
			------------------------------
			IF (@xLoopCounter = 1)
			BEGIN
			
				-- Since the string did not delimit SearchPath parameters, set @xSearchPartDelimiter = NULL.
				IF LEN(@xUrlSearchPart) >= @xCharIndexStart + 1 
				AND 
				@xCharIndexAmpersand < @xCharIndexStart + 1		
				BEGIN
					SET @xSearchPartDelimiter = NULL
				END
					
				INSERT INTO tblLP_BusVideoUrlSansQueryString
				(
					lBusVideoXmlTagElementId,
					szVideoUrlSansQueryString,
					szSearchPathBeginsWith,
					szSearchPathDelimiter					
				)
				VALUES
				(
					@xScope_Identity,
					@xUrlPath, -- @SRCszXmlTagElementValue without Query String (if any).
					@xSearchPartBeginsWith,
					@xSearchPartDelimiter
				)

				-- Get the id of the last INSERT:
				SELECT @rowC = @rowC + @@ROWCOUNT, @err = @@ERROR

				SELECT @xScope_Identity = SCOPE_IDENTITY()
				
				PRINT '@xScope_Identity = '
				PRINT @xScope_Identity		
				
			END
			------------------------------
			--  END INSERT of URL Path  --
			------------------------------
			
			--------------------------------------
			-- START INSERT of URL Query Params --
			--------------------------------------
		
			INSERT INTO tblLP_BusVideoUrlQueryString
			(
				lBusVideoUrlSansQueryStringId,
				szVideoUrlQsParameter,
				szVideoUrlQsValue
			)
			VALUES
			(
				@xScope_Identity,
				@xQueryStringParam,		--szVideoUrlQsParameter,
				@xQueryStringValue			--szVideoUrlQsValue
			)

			SELECT @rowC = @rowC + @@ROWCOUNT, @err = @@ERROR

			--------------------------------------
			--  END INSERT of URL Query Params  --
			--------------------------------------
			
		END -- Ends "IF (LEN(@xQueryStringParam) > 0)"

		-- Delete inserted piece of @xUrlSearchPart. --
		IF (LEN(@xUrlSearchPart) > @xCharIndexStart + @xSubstringLength + 1)
		BEGIN
			SET @xUrlSearchPart = SUBSTRING(@xUrlSearchPart, @xCharIndexStart + @xSubstringLength + 1, LEN(@xUrlSearchPart) - @xCharIndexStart + @xSubstringLength + 1)
		END
		ELSE
		BEGIN
			SET @xUrlSearchPart = ''
		END
		
		PRINT '@xUrlSearchPart = '
		PRINT @xUrlSearchPart
		
		-- Fail safe --
		IF (@xLoopCounter = 5000) 
		BEGIN
			BREAK	
		END
		
	END -- Ends "WHILE (LEN(@xUrlSearchPart) > 0)"
		
END -- Ends "IF (@xCharIndexSearchPart > 0)"

-- --------------------------------------- --
-- START SECTION - QUERIES USE FOR TESTING --
-- --------------------------------------- --
--
--SELECT b.*, c.* 
--FROM 
--	(
--		SELECT 
--			MAX(lBusVideoUrlSansQueryStringId) AS lBusVideoUrlSansQueryStringId
--		FROM 
--			tblLP_BusVideoUrlSansQueryString
--	) a 
--		JOIN 
--			(
--				SELECT 
--					lBusVideoUrlSansQueryStringId,
--					lBusVideoXmlTagElementId,
--					szVideoUrlSansQueryString,
--					szSearchPathBeginsWith,
--					szSearchPathDelimiter
--				FROM 
--					tblLP_BusVideoUrlSansQueryString
--			) b
--				ON a.lBusVideoUrlSansQueryStringId = b.lBusVideoUrlSansQueryStringId
--					JOIN
--						tblLP_BusVideoUrlQueryString c
--							ON b.lBusVideoUrlSansQueryStringId = c.lBusVideoUrlSansQueryStringId
--
--SELECT * FROM tblLP_BusVideoUrlSansQueryString
--SELECT * FROM tblLP_BusVideoUrlQueryString
--
--TRUNCATE TABLE tblLP_BusVideoUrlSansQueryString
--TRUNCATE TABLE tblLP_BusVideoUrlQueryString
--
-- --------------------------------------- --
--  END SECTION - QUERIES USE FOR TESTING  --
-- --------------------------------------- --


-- ---------------------------------------------------------------- --
-- ---------------------------------------------------------------- --
--																	--
--  END Parse and INSERT of BusVideo URL Query String parameteres	--
--																	--
-- ---------------------------------------------------------------- --
-- ---------------------------------------------------------------- --

-- ---------------------------------------------------------------- --

	INSERT INTO tblLP_BusVideoXmlTagElement
	(
		lBusVideoXmlTagId,
		lDataScrubbedStatusId,
		szXmlTagElement,
		szXmlTagElementValue
	)
	VALUES
	(
		@xlBusVideoXmlTagId,
		@FVARlDataScrubbedStatusId,
		@FVARszXmlTagElement,
		@FVARszXmlTagElementValue
	)

	-- Get the id of the last INSERT:
	SELECT @rowC = @rowC + @@ROWCOUNT, @err = @@ERROR

END -- Ends "IF (@err = 0)"

IF (@err <> 0)
BEGIN

	SELECT 'ERROR: in INSERTING the Video and data into the Database. SQL error code = ' + @err AS Result, @rowC AS RowC

END
ELSE IF (@rowC > -1)
BEGIN

	SELECT 'No Errors.' AS Result, @rowC AS RowC

END


END -- End sp_
GO
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusVideoInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusVideoInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusVideoInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusVideoInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusVideoInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusVideoInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_BusVideoInfo] TO [web_user]
GO
