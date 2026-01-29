-- (Query 7) Veículos mais visitados por marca
-- Objetivo: Identificar quais veículos receberam mais visitas no site, analisando o volume de acessos por marca e modelo.

SELECT
	pro.brand,
	pro.model,
	COUNT(*) as "visitas (#)"

FROM sales.funnel as fun
LEFT JOIN sales.products as pro
	ON fun.product_id = pro.product_id

GROUP BY pro.brand, pro.model
ORDER BY pro.brand, pro.model, "visitas (#)"
