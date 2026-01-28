-- Query 2 - Status profissional dos leads
-- Objetivo: Analisar a distribuição percentual dos leads por status profissional

SELECT 
    CASE
        WHEN professional_status = 'freelancer' THEN 'freelancer'
        WHEN professional_status = 'retired' THEN 'aposentado(a)'
        WHEN professional_status = 'clt' THEN 'clt'
        WHEN professional_status = 'self_employed' THEN 'autônomo(a)'
        WHEN professional_status = 'other' THEN 'outro'
        WHEN professional_status = 'businessman' THEN 'empresário(a)'
        WHEN professional_status = 'civil_servant' THEN 'funcionário(a) público(a)'
        WHEN professional_status = 'student' THEN 'estudante'
    END AS "status profissional",

    COUNT(*)::float 
    / (SELECT COUNT(*) FROM sales.customers) AS "leads (%)"

FROM sales.customers
GROUP BY professional_status
ORDER BY "leads (%)"
