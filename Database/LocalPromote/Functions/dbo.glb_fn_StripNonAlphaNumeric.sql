SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create function [dbo].[glb_fn_StripNonAlphaNumeric]
(@token varchar (255))
returns varchar (255)
as
begin
  -- fun replaces non alpha numeric with a single space ' '
  -- by Stephen Ely, Jinn Sheu, & Ian Niles 5/19/2005
  declare @len smallint
  set @len = 1
  while @len <= len (@token)
  begin
    if not exists (select asCode from glb_tbl_AlphaNumericASCII where asCode = ascii (substring (@token, @len, 1)))
      set @token = substring (@token, 1, @len-1) + ' ' + substring (@token, @len + 1, len (@token)-@len)
    set @len = @len  + 1
  end
return @token
end
GO
GRANT EXECUTE ON  [dbo].[glb_fn_StripNonAlphaNumeric] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[glb_fn_StripNonAlphaNumeric] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[glb_fn_StripNonAlphaNumeric] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[glb_fn_StripNonAlphaNumeric] TO [web_user]
GO
