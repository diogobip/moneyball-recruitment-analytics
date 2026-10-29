-- Table for Inbound Transfers
CREATE TABLE transfer_inbound (
    player_id INT,
    transfer_date DATE,
    transfer_season VARCHAR(10),
    from_club_id INT,
    to_club_id INT,
    from_club_name VARCHAR(100),
    to_club_name VARCHAR(100),
    transfer_fee DECIMAL(15, 2),
    market_value_in_eur DECIMAL(15, 2),
    player_name VARCHAR(100)
);

-- Table for Outbound Transfers
CREATE TABLE transfers_outbound (
    player_id INT,
    transfer_date DATE,
    transfer_season VARCHAR(10),
    from_club_id INT,
    to_club_id INT,
    from_club_name VARCHAR(100),
    to_club_name VARCHAR(100),
    transfer_fee DECIMAL(15, 2),
    market_value_in_eur DECIMAL(15, 2),
    player_name VARCHAR(100)
);