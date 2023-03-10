CREATE PROCEDURE [dbo].[CreateIncomeTransaction_UpdateBalance_CreateEvent]
@currencyAcronim nvarchar(10),
@transactionId nvarchar(max),
@amount decimal(38, 20),
@transactionFee decimal(38, 20),
@fromAddress nvarchar(max),
@toAddress nvarchar(max),
@dateFloat decimal(38, 20),
@userId nvarchar(450),
@incomeWalletId int
AS
BEGIN

if 0 = (Select Count(*) From IncomeTransactions Where TransactionId = @transactionId) 
	BEGIN
		INSERT INTO [Exchange].[dbo].[IncomeTransactions](CurrencyAcronim, TransactionId, Amount,
			TransactionFee, FromAddress, ToAddress, Date, UserId, IncomeWalletsId)
		VALUES (@currencyAcronim, @transactionId, @amount, @transactionFee, @fromAddress,
			@toAddress, @dateFloat, @userId, @incomeWalletId)

		UPDATE [Exchange].[dbo].[Wallets]
		SET Value = Value + @amount
		WHERE CurrencyAcronim = @currencyAcronim and UserId = @userId

		INSERT INTO [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
		VALUES (@userid, 2, @amount, 'Income transaction '+ @currencyAcronim, GETDATE(), @currencyAcronim)

		RETURN
	END

END