--create views-
--Finacial Summary--
CREATE VIEW vw_brighton_season_summary AS
SELECT 
    transfer_season,
    CAST(SUM(CASE WHEN LOWER(TRIM(transfer_type)) = 'outbound' THEN transfer_fee ELSE 0 END) / 1000000.0 AS DECIMAL(10,2)) AS total_sales_m,
    CAST(SUM(CASE WHEN LOWER(TRIM(transfer_type)) = 'inbound' THEN transfer_fee ELSE 0 END) / 1000000.0 AS DECIMAL(10,2)) AS total_spend_m,
    CAST((SUM(CASE WHEN LOWER(TRIM(transfer_type)) = 'outbound' THEN transfer_fee ELSE 0 END) - 
          SUM(CASE WHEN LOWER(TRIM(transfer_type)) = 'inbound' THEN transfer_fee ELSE 0 END)) / 1000000.0 AS DECIMAL(10,2)) AS net_spend_m
FROM dbo.brighton_transfers_clean
GROUP BY transfer_season;
GO

--Top Partners and Big six--
CREATE VIEW vw_brighton_trading_partners AS
SELECT 
    opponent_club,
    CASE 
        WHEN opponent_club IN ('Chelsea', 'Arsenal', 'Manchester City', 'Manchester United', 'Liverpool', 'Tottenham Hotspur') THEN 'Big Six'
        ELSE 'Other Clubs'
    END AS club_category,
    COUNT(*) AS total_deals,
    CAST(SUM(CASE WHEN LOWER(TRIM(transfer_type)) = 'outbound' THEN transfer_fee ELSE 0 END) / 1000000.0 AS DECIMAL(10,2)) AS total_revenue_m
FROM dbo.brighton_transfers_clean
WHERE opponent_club IS NOT NULL
  AND opponent_club NOT LIKE '%Brighton%'
  AND opponent_club NOT LIKE '%U21%'
  AND opponent_club NOT LIKE '%U18%'
GROUP BY opponent_club;
	