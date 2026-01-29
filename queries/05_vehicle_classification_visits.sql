-- Query 5 - Classificação dos veículos visitados
-- Objetivo: Classificar os veículos visitados no e-commerce em novos e seminovos, com base na idade do veículo no momento da visita, e contabilizar o volume de visitas por categoria.
-- Regra de negócio: veículos novos têm até 2 anos; acima disso são seminovos

WITH classificacao AS (

    SELECT
        fun.visit_page_date,
        pro.model_year,

        -- Cálculo da idade do veículo no momento da visita
        EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int AS idade_veiculo,

        -- Classificação do veículo conforme regra de negócio
        CASE
            WHEN (EXTRACT('YEAR' FROM visit_page_date) - pro.model_year::int) <= 2 
                THEN 'novo'
            ELSE 'seminovo' 
        END AS "classificação do veículo"

    FROM sales.funnel AS fun
    LEFT JOIN sales.products AS pro
        ON fun.product_id = pro.product_id
)

SELECT
    "classificação do veículo",
    COUNT(*) AS "veículos visitados (#)"

FROM classificacao
GROUP BY "classificação do veículo"
