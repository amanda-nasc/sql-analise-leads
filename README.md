# Análise do Perfil de Leads com SQL

Este projeto foi desenvolvido como parte do curso **“SQL para Análise de Dados: Do básico ao avançado”**, ministrado por **Midori Toyota**.

O objetivo foi utilizar **SQL para explorar e analisar dados de um e-commerce**, focando no **perfil dos leads** e no **comportamento de navegação e interesse por veículos**, com o suporte de visualizações em dashboard para facilitar a interpretação dos resultados.

---

## 🎯 Objetivo do Projeto
Analisar as **principais características dos leads que visitam o e-commerce**, respondendo perguntas como:

- Qual é o perfil demográfico dos leads?
- Como esses leads se distribuem por faixa etária e renda?
- Quais tipos de veículos despertam maior interesse?
- Quais marcas e modelos recebem mais visitas?


Essas análises ajudam a apoiar decisões de **marketing, estratégia comercial e posicionamento de produtos**.

---

## 🛠️ Ferramentas Utilizadas
- SQL (PostgreSQL)
- Excel (análise e visualização dos dados)

---

## 📊 Análises Realizadas
As análises foram desenvolvidas em SQL e organizadas em queries individuais. Cada arquivo abaixo representa uma análise específica:

- **[Distribuição de leads por gênero](queries/01_leads_by_gender.sql)** \
  Identificação do perfil de público segmentado por gênero.

- **[Status profissional dos leads](queries/02_leads_by_professional_status.sql)** \
Mapeamento das principais ocupações da base de leads.

- **[Faixa etária dos leads](queries/03_leads_by_age_group.sql)** \
Análise demográfica por idade para entender a maturidade do público.

- **[Faixa salarial dos leads](queries/04_leads_by_income_range.sql)**\
Segmentação por faixa salarial e distribuição de renda dos potenciais clientes.

- **[Classificação dos veículos visitados (novos vs. seminovos)](queries/05_vehicle_classification_visits.sql)**\
Levantamento da preferência de mercado entre veículos zero quilômetro e usados.

- **[Distribuição da idade dos veículos mais acessados](queries/06_vehicle_age_distribution.sql)**\
Análise dos anos de fabricação que concentram o maior volume de buscas.

- **[Veículos mais visitados por marca e modelo](queries/07_most_visited_vehicles_by_brand.sql)**\
Ranking de popularidade para identificar os veículos que geram maior engajamento na plataforma.

---

## 📈 Dashboard
A partir dos resultados das queries, foi construído um **dashboard no Excel**, consolidando os principais indicadores do projeto e permitindo uma visão clara e objetiva sobre o perfil dos leads e seus interesses no e-commerce.

![Dashboard de Vendas](dashboard/dashboard_leads_ecommerce.png)

---

## 📂 Estrutura do Repositório
```text
📁 queries
 ├── 01_leads_by_gender.sql
 ├── 02_leads_by_professional_status.sql
 ├── 03_leads_by_age_group.sql
 ├── 04_leads_by_income_range.sql
 ├── 05_vehicle_classification_visits.sql
 ├── 06_vehicle_age_distribution.sql
 └── 07_most_visited_vehicles_by_brand.sql

📁 dashboard
 └── dashboard_leads_ecommerce.png

README.md
