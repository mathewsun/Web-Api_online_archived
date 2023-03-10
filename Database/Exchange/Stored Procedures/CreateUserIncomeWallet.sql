USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[CreateUserIncomeWallet]    Script Date: 14.12.2021 15:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CreateUserIncomeWallet]
@userid nvarchar(450),
@address nvarchar(max),
@addressLabel nvarchar(max),
@currencyAcronim nvarchar(10),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[IncomeWallets] (UserId, Address, AddressLabel, CurrencyAcronim)
VALUES (@userid, @address, @addressLabel, @currencyAcronim)

SET @new_identity = SCOPE_IDENTITY()

END

