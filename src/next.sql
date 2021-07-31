-- DROP DATABASE IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Transactions]') AND type in (N'U'))
-- DROP TABLE [dbo].[Transactions]
-- GO

use master
DROP DATABASE BankApp

CREATE DATABASE bankapp
use BankApp

CREATE TABLE [Transactions]
(
    [TransactionID] INTEGER NOT NULL IDENTITY(1, 1),
    [OriginBankName] VARCHAR(10),
    [DestinyBankName] VARCHAR(50),
    [OriginAccount] VARCHAR(11),
    [DestinyAccount] VARCHAR(11),
    [OriginDocument] VARCHAR(13),
    [DestinyDocument] VARCHAR(13),
    [Amount] money NULL,
    [Type] VARCHAR(4),
    [OriginCurrency] VARCHAR(4),
    [DestinyCurrency] VARCHAR(4),
    [Concept] VARCHAR(20),
    [Date] date,
    [Time] time

        PRIMARY KEY ([TransactionID])
);
INSERT INTO Transactions
VALUES
    ('BHD', 'APAP', '58965785987', '78965412548', '4020125478', '4025698741', 1000.00, 'LBTR', 'USD', 'DOP', 'Para abuela', '06/11/2021', '07:55:00')
select *
from Transactions
-- Create Stored Procedure
SET ANSI_NULLS ON
 GO
SET QUOTED_IDENTIFIER ON
 GO
-- GET
CREATE PROCEDURE dbo.getTransactions
AS
BEGIN
    SELECT *
    FROM Transactions;
END
 GO
-- POST
CREATE PROCEDURE dbo.addTransaction
    @OriginBankName VARCHAR(10),
    @DestinyBankName VARCHAR(50),
    @OriginAccount VARCHAR(11),
    @DestinyAccount VARCHAR(11),
    @OriginDocument VARCHAR(13),
    @DestinyDocument VARCHAR(13),
    @Amount money NULL,
    @Type VARCHAR(4),
    @OriginCurrency VARCHAR(4),
    @DestinyCurrency VARCHAR(4),
    @Concept VARCHAR(20),
    @Date date,
    @Time time
AS
BEGIN
    INSERT INTO Transactions
    VALUES(
            @OriginBankName,
            @DestinyBankName,
            @OriginAccount,
            @DestinyAccount,
            @OriginDocument,
            @DestinyDocument,
            @Amount,
            @Type,
            @OriginCurrency ,
            @DestinyCurrency ,
            @Concept,
            @Date,
            @Time)

End
END
--  GO
-- CREATE PROCEDURE dbo.deleteTransactionById
--     @Id INTEGER
-- AS
-- BEGIN
--     DELETE FROM Transactions WHERE Id = @Id;
-- END
--  GO
-- CREATE PROCEDURE dbo.updateTransactionById
--     @Id INTEGER,
--     @Brand VARCHAR(50),
--     @Model VARCHAR(100),
--     @Type VARCHAR(100),
--     @Color VARCHAR(50),
--     @Year INTEGER,
--     @Emissions INTEGER,
--     @Condition VARCHAR(50),
--     @Wheels INTEGER,
--     @Passengers INTEGER
-- AS
-- BEGIN
--     UPDATE Transactions SET
--     Brand = @Brand,
--     Model = @Model,
--     Type = @Type,
--     Color = @Color,
--     Year = @Year,
--     Emissions = @Emissions,
--     Condition = @Condition,
--     Wheels = @Wheels,
--     Passengers = @Passengers
--  WHERE Id = @Id;
-- END
--  GO
-- CREATE PROCEDURE dbo.getTransactionById
--     @Id INTEGER
-- AS
-- BEGIN
--     SELECT *
--     FROM
--         Transactions
--     WHERE Id = @Id
-- END