ALTER PROCEDURE [dbo].[spGetUserWallets]
@userid nvarchar(450)
AS
BEGIN

--declare @acronim nvarchar(10)
--set @acronim = 'GPS'

select * 
from [CoinsRates] 
where Acronim = @acronim

END
