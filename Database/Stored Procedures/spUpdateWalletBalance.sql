USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spCreateUserWallet]    Script Date: 16.08.2021 21:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateWalletBalance]
@newWalletBalance decimal(38,20),
@walletId    INT    OUTPUT
AS
BEGIN

UPDATE Wallets
SET Value = @newWalletBalance
WHERE Id = @walletId

RETURN

END
