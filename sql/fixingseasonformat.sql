--Format Season --
UPDATE dbo.brighton_transfers_clean
SET transfer_season = REPLACE(LEFT(CAST(transfer_season AS VARCHAR(50)), 5), ':', '/');

ALTER TABLE dbo.brighton_transfers_clean
ALTER COLUMN transfer_season VARCHAR(10) NOT NULL;
GO