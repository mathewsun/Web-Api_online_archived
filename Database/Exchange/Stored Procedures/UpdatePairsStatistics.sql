USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[UpdatePairsStatistics]    Script Date: 8/15/2022 19:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[UpdatePairsStatistics]
AS
BEGIN

----------------- BCH BTC
--GO
declare @BCH_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @BCH_BTC_1_hour_ago_price DECIMAL(38, 20);
set @BCH_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from BCH_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @BCH_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from BCH_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);


UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from BCH_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@BCH_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@BCH_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'BCHBTC'

------------------- BCH USDT
--GO
declare @BCH_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @BCH_USDT_1_hour_ago_price DECIMAL(38, 20);
set @BCH_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from BCH_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @BCH_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from BCH_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from BCH_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@BCH_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@BCH_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'BCHUSDT'

------------------- BTC USDT
--GO
declare @BTC_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @BTC_USDT_1_hour_ago_price DECIMAL(38, 20);
set @BTC_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from BTC_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @BTC_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from BTC_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from BTC_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@BTC_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@BTC_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'BTCUSDT'

------------------- DASH BTC
--GO
declare @DASH_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @DASH_BTC_1_hour_ago_price DECIMAL(38, 20);
set @DASH_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from DASH_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @DASH_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from DASH_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from DASH_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@DASH_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@DASH_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'DASHBTC'

------------------- DASH USDT
--GO
declare @DASH_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @DASH_USDT_1_hour_ago_price DECIMAL(38, 20);
set @DASH_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from DASH_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @DASH_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from DASH_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from DASH_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@DASH_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@DASH_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'DASHUSDT'

------------------- DOGE BTC
--GO
declare @DOGE_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @DOGE_BTC_1_hour_ago_price DECIMAL(38, 20);
set @DOGE_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from DOGE_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @DOGE_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from DOGE_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from DOGE_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@DOGE_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@DOGE_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'DOGEBTC'

------------------- DOGE USDT
--GO
declare @DOGE_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @DOGE_USDT_1_hour_ago_price DECIMAL(38, 20);
set @DOGE_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from DOGE_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @DOGE_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from DOGE_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from DOGE_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@DOGE_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@DOGE_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'DOGEUSDT'

------------------- ETH BTC
--GO
declare @ETH_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @ETH_BTC_1_hour_ago_price DECIMAL(38, 20);
set @ETH_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from ETH_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @ETH_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from ETH_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from ETH_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@ETH_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@ETH_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'ETHBTC'

------------------- ETH USDT
--GO
declare @ETH_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @ETH_USDT_1_hour_ago_price DECIMAL(38, 20);
set @ETH_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from ETH_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @ETH_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from ETH_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from ETH_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@ETH_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@ETH_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'ETHUSDT'

------------------- LTC BTC
--GO
declare @LTC_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @LTC_BTC_1_hour_ago_price DECIMAL(38, 20);
set @LTC_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from LTC_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @LTC_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from LTC_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from LTC_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@LTC_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@LTC_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'LTCBTC'

------------------- LTC USDT
--GO
declare @LTC_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @LTC_USDT_1_hour_ago_price DECIMAL(38, 20);
set @LTC_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from LTC_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @LTC_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from LTC_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from LTC_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@LTC_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@LTC_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'LTCUSDT'
--GO

END
