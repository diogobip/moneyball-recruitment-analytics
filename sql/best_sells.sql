--Player-Level--
select top 10 player_name,transfer_fee,market_value_in_eur
from brighton_transfers_clean
where transfer_type = 'Outbound'
order by transfer_fee desc

select top 10
	player_name,
	transfer_fee,
	opponent_club as buyer_club,
	(transfer_fee - market_value_in_eur) as markup_eur,
    CAST((transfer_fee - market_value_in_eur) / 1000000.0 as decimal(10,2)) as markup_eur_m
from brighton_transfers_clean
where transfer_type = 'Outbound'
	and transfer_fee is not null
	and market_value_in_eur is not null
order by (transfer_fee - market_value_in_eur) desc
