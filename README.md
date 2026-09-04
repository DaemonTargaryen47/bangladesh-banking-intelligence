<div align="center">

# 🏦 Bangladesh Banking Intelligence

**Which bank looks profitable on paper — but is quietly taking on too much risk?**

A Power BI + SQL + Python analytics project that scores Bangladeshi banks across profitability, risk, efficiency, and digital adoption — and turns the numbers into management-level recommendations.

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=sqlite&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-yellow?style=flat)
![License](https://img.shields.io/github/license/DaemonTargaryen47/bangladesh-banking-intelligence)
![Last Commit](https://img.shields.io/github/last-commit/DaemonTargaryen47/bangladesh-banking-intelligence)

**[⭐ View Live Dashboard Walkthrough](#-dashboard-preview)** • **[📊 KPI Dictionary](docs/KPI_DICTIONARY.md)** • **[💼 Business Case](docs/BUSINESS_CASE.md)**

</div>

---

<!-- Insert a banner image or GIF here: wide screenshot montage or a click-through demo -->
<!-- e.g. ![Demo](docs/screenshots/demo.gif) -->

## 🎯 The Problem

Bank financials are noisy. A bank can look strong on profit growth while its NPL ratio is quietly climbing, or scale digital users fast while its branch network overextends. Raw financial statements don't surface this — you need to see profitability, risk, efficiency, and funding **side by side** to catch it.

This project builds that view: a 5-page interactive Power BI dashboard that turns raw bank financials into a **performance score, risk status, and management priority** for each bank, year over year.

---

## 📊 Dashboard Preview

### 1. Executive Overview
High-level view of assets, deposits, loans, profitability, NPL ratios, and bank-to-bank comparisons.

![Executive Overview](https://github.com/DaemonTargaryen47/bangladesh-banking-intelligence/raw/main/docs/screenshots/01_executive_overview.PNG)

### 2. Risk & Asset Quality
Credit risk and financial stability via NPL ratios, capital adequacy, loan-to-deposit ratios, and risk positioning.

![Risk & Asset Quality](https://github.com/DaemonTargaryen47/bangladesh-banking-intelligence/raw/main/docs/screenshots/02_risk_asset_quality.PNG)

### 3. Profitability & Efficiency
Net profit, ROA, ROE, cost-to-income ratios, profit growth, and employee productivity.

![Profitability & Efficiency](https://github.com/DaemonTargaryen47/bangladesh-banking-intelligence/raw/main/docs/screenshots/03_profitability_efficiency.PNG)

### 4. Digital & Distribution
Digital adoption, branch networks, CASA ratios, and distribution efficiency.

![Digital & Distribution](https://github.com/DaemonTargaryen47/bangladesh-banking-intelligence/raw/main/docs/screenshots/04_digital_distribution.PNG)

### 5. Management Insights & Recommendations
Combines every signal into a single management priority view.

![Management Insights](https://github.com/DaemonTargaryen47/bangladesh-banking-intelligence/raw/main/docs/screenshots/05_management_insights.PNG)

---

## 🧠 How It Works
Synthetic Banking Data
↓
Data Preparation
↓
SQL Analysis
↓
Python EDA
↓
Power BI Data Model
↓
DAX Measures
↓
Interactive Dashboard
↓
Management Insights
↓
Business Recommendations

Raw financials are cleaned and loaded into SQLite, then queried in SQL to surface year-over-year trends, risk flags, and profitability patterns. Python handles exploratory analysis and sanity-checks the data before it enters Power BI, where DAX measures turn raw numbers into performance scores, risk classifications, and growth metrics. The result is an interactive dashboard that doesn't just show what happened to each bank — it flags what management should do about it.

---

## 📈 Key Performance Indicators

| Area              | KPIs                                                |
| ----------------- | ---------------------------------------------------- |
| **Scale**         | Total Assets, Deposits, Loans                        |
| **Profitability** | Net Profit, ROA, ROE                                 |
| **Risk**          | NPL Ratio, Capital Adequacy, Loan-to-Deposit Ratio   |
| **Efficiency**    | Cost-to-Income, Profit per Employee                  |
| **Funding**       | CASA Ratio                                           |
| **Distribution**  | Branches, Digital Users                              |
| **Growth**        | YoY Asset, Profit, Branch & Digital User Growth      |
| **Management**    | Performance Score, Risk Status, Management Priority  |

---

## 💡 Management Insights Baked Into the Model

- Rapid loan growth is only evaluated alongside NPL trends and capital adequacy.
- Higher profitability is weighted against operating efficiency, not viewed in isolation.
- A rising cost-to-income ratio flags automation/cost-optimization opportunities.
- Strong CASA ratios signal a healthier low-cost funding base.
- Digital growth outpacing branch growth signals distribution scalability.
- Growth is never treated as good news on its own — it's checked against asset quality and capital resilience.

---

## 🛠️ Tools & Technologies

| Layer | Tool |
|---|---|
| Visualization | Power BI |
| Business logic | DAX |
| Data querying | SQL / SQLite |
| Data prep & EDA | Python |
| Supporting analysis | Excel |
| Versioning | Git & GitHub |

---

## 📂 Project Structure
Bangladesh_Banking_Intelligence/
│
├── data/
│ ├── raw/bank_financials_synthetic.csv
│ ├── processed/bank_financials_enriched.csv
│ └── banking_intelligence.db
│
├── docs/
│ ├── screenshots/
│ ├── KPI_DICTIONARY.md
│ ├── BUSINESS_CASE.md
│ └── INTERVIEW_TALK_TRACK.md
│
├── powerbi/
│ ├── DAX_measures.txt
│ ├── dashboard_layout.txt
│ └── theme.json
│
├── python/
│ ├── eda.py
│ └── requirements.txt
│
├── sql/
│ └── analysis_queries.sql
│
├── Bangladesh_Banking_Intelligence.pbix
├── Bangladesh_Banking_Intelligence_Dashboard.xlsx
├── README.md
└── LICENSE

---

## 🗄️ SQL Analysis

Covers latest-year performance, YoY asset growth, profitability vs. risk, high-NPL banks, digital adoption growth, operating efficiency, and portfolio trends.
SQLite database: `data/banking_intelligence.db`

---

## 🐍 Run the Python Analysis

```bash
python -m venv .venv
.venv\Scripts\activate
pip install -r python/requirements.txt
python python/eda.py
```

---

## 📊 Power BI Report

Five interactive pages — Executive Overview, Risk & Asset Quality, Profitability & Efficiency, Digital & Distribution, and Management Insights & Recommendations — with filters for year, bank, and bank type.

---

## ⚠️ Data Disclaimer

This is a **portfolio case study**. All figures, scores, and classifications are based on a **synthetic dataset** built for analytical demonstration — not official Bangladesh Bank data or real institutional assessments.

---

## 🔄 Future Development

The data model is built to be reusable: real financial data from Bangladesh Bank or individual bank annual reports can drop into the existing SQL, DAX, and Power BI framework with minimal rework.

---

## 👤 About the Author

**Chowdhury Aseer Ruthbah** — Computer Science undergraduate focused on data analytics, business intelligence, and data-driven decision making. Built this to practice turning raw financial data into decisions a bank's management team could actually act on.

[GitHub](https://github.com/DaemonTargaryen47) • [LinkedIn](https://www.linkedin.com/in/chowdhury-aseer-ruthbah-0a9ba9275)

---

<div align="center">

⭐ **If this was useful or interesting, a star helps a lot.**

</div>
