-- (Query 1) Gênero dos leads
-- Objetivo: Identificar a distribuição de gênero dos leads que visitaram o e-commerce, para entender o perfil predominante do público e apoiar decisões de marketing e comunicação.

SELECT
	CASE 
		WHEN ibge.gender = 'male' THEN 'homens'
		WHEN ibge.gender = 'female' THEN 'mulheres'
	END AS "gênero",
	COUNT(*) AS "leads (#)"

FROM sales.customers AS cus
LEFT JOIN temp_tables.ibge_genders AS ibge
	ON LOWER(cus.first_name) = LOWER(ibge.first_name)
GROUP BY "gênero"
