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
    [OriginAccount] VARCHAR(10),
    [BankName] VARCHAR(50),
    [DestinyAccount] VARCHAR(11),
    [DestinyDocument] VARCHAR(13),
    [Currency] VARCHAR(4),
    [Amount] MONEY NULL,
    [Concept] TEXT,
    [Date] DATETIME,
    PRIMARY KEY ([TransactionID])
);

INSERT INTO Transactions
VALUES
    ('803900473', 'APAP', '803900475', '40248975984', 'USD', 1000.00, 'Para abuela', '2019-10-03')

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
    @OriginAccount VARCHAR(10),
    @BankName VARCHAR(50),
    @DestinyAccount VARCHAR(11),
    @DestinyDocument VARCHAR(13),
    @Currency VARCHAR(4),
    @Amount MONEY NULL,
    @Concept TEXT,
AS
BEGIN
    INSERT INTO Transactions
    VALUES(
            @OriginAccount,
            @BankName,
            @DestinyAccount,
            @DestinyDocument,
            @Currency,
            @Amount,
            @Concept,
            GETDATE())
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
--  GO