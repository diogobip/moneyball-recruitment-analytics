--trading partners--
SELECT 
    opponent_club,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN LOWER(TRIM(transfer_type)) = 'inbound' THEN 1 ELSE 0 END) AS players_bought,
    SUM(CASE WHEN LOWER(TRIM(transfer_type)) = 'outbound' THEN 1 ELSE 0 END) AS players_sold,
    CAST(SUM(CASE WHEN LOWER(TRIM(transfer_type)) = 'outbound' THEN transfer_fee ELSE 0 END) / 1000000.0 AS DECIMAL(10,2)) AS revenue_received_eur_m
FROM dbo.brighton_transfers_clean
WHERE opponent_club IS NOT NULL
  AND opponent_club NOT LIKE '%Brighton%'   -- Removes internal squad moves
  AND opponent_club NOT LIKE '%U21%'        -- Removes youth academy promotions
  AND opponent_club NOT LIKE '%U18%'
GROUP BY opponent_club
HAVING SUM(CASE WHEN LOWER(TRIM(transfer_type)) = 'outbound' THEN transfer_fee ELSE 0 END) > 0 -- Filters out clubs with 0 total fee (pure loans/free moves)
ORDER BY revenue_received_eur_m DESC;

--big six revenue generation--
SELECT 
    opponent_club AS big_six_club,
    COUNT(*) AS players_sold,
    CAST(SUM(transfer_fee) / 1000000.0 AS DECIMAL(10,2)) AS total_revenue_eur_m
FROM dbo.brighton_transfers_clean
WHERE LOWER(TRIM(transfer_type)) = 'outbound'
  AND transfer_fee > 0
  AND opponent_club IN ('Chelsea', 'Arsenal', 'Manchester City', 'Manchester United', 'Liverpool', 'Tottenham Hotspur')
GROUP BY opponent_club
ORDER BY total_revenue_eur_m DESC;
