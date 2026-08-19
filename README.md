# Bangladesh Banking Intelligence Dashboard

A portfolio-ready **banking performance, risk and management intelligence** case study designed for Data Analyst, Business Analyst, Management Trainee (MTO), Graduate Trainee and banking roles in Bangladesh.

> **Important:** The included bank-level financial data is **synthetic and fictional**, generated to resemble plausible commercial-banking patterns. It is not presented as actual performance data for any real Bangladeshi bank.

## What this project demonstrates
- Business and banking KPI understanding
- SQL analytics and window functions
- Python exploratory analysis
- Power BI data modeling and DAX
- Executive dashboard design
- Management recommendations based on evidence

## Project structure
```text
data/
  raw/bank_financials_synthetic.csv
  processed/bank_financials_enriched.csv
  banking_intelligence.db
sql/
  analysis_queries.sql
python/
  eda.py
  requirements.txt
powerbi/
  DAX_measures.txt
  dashboard_layout.txt
  theme.json
docs/
  KPI_DICTIONARY.md
  BUSINESS_CASE.md
  INTERVIEW_TALK_TRACK.md
Bangladesh_Banking_Intelligence_Dashboard.xlsx
```

## Dashboard KPIs
**Scale:** Total Assets, Deposits, Loans  
**Profitability:** Net Profit, ROA, ROE  
**Risk:** NPL Ratio, Capital Adequacy, Loan-to-Deposit Ratio  
**Efficiency:** Cost-to-Income, Profit per Employee  
**Funding:** CASA Ratio  
**Distribution:** Branches, Digital Users  
**Growth:** YoY Assets, Deposits, Loans, Profit  
**Composite:** Performance Score

## Power BI setup
1. Open Power BI Desktop.
2. Get Data → Text/CSV → `data/processed/bank_financials_enriched.csv`.
3. Rename the table to `bank_financials_enriched`.
4. Set `year` to Whole Number; financial columns to Decimal Number.
5. Copy the measures from `powerbi/DAX_measures.txt`.
6. Import `powerbi/theme.json` from View → Themes → Browse for themes.
7. Build the five pages following `powerbi/dashboard_layout.txt`.

## SQL setup
Open `data/banking_intelligence.db` in DB Browser for SQLite or VS Code SQLite extension and run `sql/analysis_queries.sql`.

## Python setup
```bash
python -m venv .venv
.venv\Scripts\activate
pip install -r python/requirements.txt
python python/eda.py
```

.



## Replacing synthetic data with public data
For a production/academic version, use Bangladesh Bank publications and individual bank annual reports. Keep the same column schema so the SQL, DAX and dashboard structure remain reusable.
