-- Query 6 - Idade dos veículos visitados
-- Objetivo: Analisar a distribuição percentual das visitas por faixa de idade dos veículos

WITH faixa_idade_veiculos AS (

    SELECT
        fun.visit_page_date,
        pro.model_year,

        -- Cálculo da idade do veículo no momento da visita
        EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int AS idade_veiculo,

        -- Classificação do veículo por faixa de idade
        CASE
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 2 THEN 'até 2 anos'
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 4 THEN 'de 2 a 4 anos'
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 6 THEN 'de 4 a 6 anos'
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 8 THEN 'de 6 a 8 anos'
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 10 THEN 'de 8 a 10 anos'
            ELSE 'acima de 10 anos'
        END AS "idade do veículo",

        -- Ordem lógica para visualização no dashboard
        CASE
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 2 THEN 1
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 4 THEN 2
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 6 THEN 3
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 8 THEN 4
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 10 THEN 5
            ELSE 6
        END AS ordem

    FROM sales.funnel AS fun
    LEFT JOIN sales.products AS pro
        ON fun.product_id = pro.product_id
)

SELECT
    "idade do veículo",
    COUNT(*)::float 
        / (SELECT COUNT(*) FROM sales.funnel) AS "veículos visitados (%)",
    ordem

FROM faixa_idade_veiculos
GROUP BY "idade do veículo", ordem
ORDER BY ordem
