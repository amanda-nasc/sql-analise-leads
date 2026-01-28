-- Query 3
-- Objetivo: Analisar a distribuição percentual dos leads por faixa etária

SELECT
    CASE
        WHEN DATEDIFF('YEARS', birth_date, CURRENT_DATE) < 20 THEN '0-20'
        WHEN DATEDIFF('YEARS', birth_date, CURRENT_DATE) < 40 THEN '20-40'
        WHEN DATEDIFF('YEARS', birth_date, CURRENT_DATE) < 60 THEN '40-60'
        WHEN DATEDIFF('YEARS', birth_date, CURRENT_DATE) < 80 THEN '60-80'
        ELSE '80+'
    END AS "faixa etária",

    COUNT(*)::float 
    / (SELECT COUNT(*) FROM sales.customers) AS "leads (%)"

FROM sales.customers
GROUP BY "faixa etária"
ORDER BY "faixa etária"
