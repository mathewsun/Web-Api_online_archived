USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[CreateOutcomeTransaction]    Script Date: 12/26/2021 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CreateOutcomeTransaction]
@id int OUTPUT,
@fromWalletId int,
@toAddress nvarchar(max),
@value decimal(38,20),
@currencyAcronim nvarchar(10),
@state int
AS

BEGIN

INSERT INTO [Exchange].[dbo].[OutcomeTransactions] ( FromWalletId, ToAddress,
			Value, CreateDate, CurrencyAcronim, State, LastUpdateDate)
VALUES (@fromWalletId, @toAddress, @value, GETDATE(), @currencyAcronim, 1, GETDATE())

SET @id = SCOPE_IDENTITY()
END

