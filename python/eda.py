"""
Bangladesh Banking Intelligence - EDA
Synthetic portfolio dataset. Run:
    pip install pandas matplotlib
    python python/eda.py
"""
from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data" / "processed" / "bank_financials_enriched.csv"
OUT = ROOT / "docs" / "charts"
OUT.mkdir(parents=True, exist_ok=True)

df = pd.read_csv(DATA)
latest_year = df["year"].max()
latest = df[df["year"] == latest_year].copy()

print(f"Latest year: {latest_year}")
print("\nTop banks by assets:")
print(latest.nlargest(5, "total_assets_crore")[["bank","total_assets_crore","net_profit_crore","npl_ratio_pct"]])

print("\nProfitability leaders:")
print(latest.nlargest(5, "roa_pct")[["bank","roa_pct","roe_pct","cost_to_income_pct"]])

print("\nHighest-risk banks:")
print(latest.nlargest(5, "npl_ratio_pct")[["bank","npl_ratio_pct","capital_adequacy_pct","loan_to_deposit_pct"]])

trend = df.groupby("year", as_index=False).agg(
    total_assets_crore=("total_assets_crore","sum"),
    total_profit_crore=("net_profit_crore","sum"),
    avg_npl_pct=("npl_ratio_pct","mean")
)

plt.figure(figsize=(9,5))
for bank, g in df.groupby("bank"):
    plt.plot(g["year"], g["total_assets_crore"], marker="o", label=bank)
plt.title("Total Assets by Bank")
plt.xlabel("Year")
plt.ylabel("BDT Crore")
plt.legend(ncol=2, fontsize=8)
plt.tight_layout()
plt.savefig(OUT/"assets_by_bank.png", dpi=180)
plt.close()

plt.figure(figsize=(8,5))
plt.scatter(latest["npl_ratio_pct"], latest["roa_pct"], s=latest["total_assets_crore"]/200)
for _, r in latest.iterrows():
    plt.annotate(r["bank"].replace("Bank ",""), (r["npl_ratio_pct"], r["roa_pct"]), fontsize=8)
plt.title(f"Risk vs Profitability ({latest_year})")
plt.xlabel("NPL Ratio (%)")
plt.ylabel("ROA (%)")
plt.tight_layout()
plt.savefig(OUT/"risk_profitability_matrix.png", dpi=180)
plt.close()

plt.figure(figsize=(8,5))
plt.bar(latest.sort_values("performance_score")["bank"],
        latest.sort_values("performance_score")["performance_score"])
plt.title(f"Composite Performance Score ({latest_year})")
plt.ylabel("Score / 100")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig(OUT/"performance_score.png", dpi=180)
plt.close()

print(f"\nCharts saved to: {OUT}")
