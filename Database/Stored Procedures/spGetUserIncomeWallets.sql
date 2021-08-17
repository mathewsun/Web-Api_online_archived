USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spGetUserIncomeWallets]    Script Date: 16.08.2021 22:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetUserIncomeWallets]
@userid nvarchar(450)
AS
BEGIN

--declare @acronim nvarchar(10)
--set @acronim = 'GPS'

SELECT iw.[Id]
      ,iw.[UserId]
      ,iw.[Address]
      ,iw.[AddressLabel]
      ,iw.[CurrencyAcronim]
      ,iw.[Created]
      ,iw.[LastUpdate]
  FROM [IncomeWallets] iw
  where iw.[UserId] = @userid

END



