SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*****************************************************************************
File Name     :   usp_LP_INS_LeadAccountInfo.sql
Description   :   Insert Stock images for a listing
Comments      :   

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-13-2010 dlabrie   Initial Development

<example>
usp_LP_INS_LeadAccountInfo 405844, 'test@test.com', 'TestLast',null, 'TestFirst'
</example>
*****************************************************************************/

Create procedure [dbo].usp_LP_INS_LeadAccountInfo

@AID int,
@szLoginEmail varchar(100),
@szLastName varchar(50),
@szMidName  varchar(50)=null,
@szFirstName  varchar(50)

AS 


BEGIN

DECLARE @lLeadAccountID int

INSERT INTO tblLP_LeadAccountInfo
(  lAdvertiserID, szLoginEmail, szLastName, szMidName, szFirstName, sActive, dtUpdate)
Values (@AID, @szLoginEmail,@szLastName, @szMidName, @szFirstName, 'Y', getdate())

Set		@lLeadAccountID=SCOPE_IDENTITY()		
Return	@lLeadAccountID

END		


GO
GRANT EXECUTE ON  [dbo].[usp_LP_INS_LeadAccountInfo] TO [lcssui]
GO
