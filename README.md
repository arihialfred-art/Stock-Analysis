# Stock Analysis

# 📊 5-Year Multi-Company Stock Performance & Risk Analysis

## 📌 Project Overview

This project analyzes 5 years of daily stock market data across 50+ companies to evaluate long-term performance, volatility, and comparative risk-adjusted returns.

The objective was to transform raw financial data into an interactive analytical dashboard that supports performance comparison and trend evaluation.

---

## 🎯 Business Objective

To identify:

- Top and bottom performing companies over 5 years
- Growth consistency using CAGR
- Risk exposure using annualized volatility
- Monthly performance trends
- Return distribution across companies

---

## 🛠 Tools & Technologies

- Microsoft SQL Server (Data transformation & modeling)
- Power BI (Visualization & dashboard development)
- DAX (Advanced measures: CAGR, Volatility, Ranking)

---

## 🗂 Data Description

Dataset included:

- Date
- Open
- High
- Low
- Close
- Volume
- Dividends
- Stock Split
- Company

Daily data was transformed into monthly aggregated metrics for trend analysis.

---

## 🧹 Data Engineering Process (SQL)

- Calculated daily returns using LAG()
- Computed compounded monthly returns
- Built rolling moving averages
- Created company performance ranking
- Designed reusable SQL views for reporting

---

## 📊 Key Metrics Developed

- Total Return (%)
- CAGR (Compound Annual Growth Rate)
- Annualized Volatility
- Rolling 30-Day Average
- Company Performance Ranking

---

## 📈 Dashboard Structure

### 1️⃣ Executive Overview
- Total companies analyzed
- Best & worst performers
- 5-year cumulative return comparison
- Top 10 ranking bar chart

### 2️⃣ Risk & Performance Analysis
- Risk vs Return scatter plot
- Volatility comparison
- Performance distribution

### 3️⃣ Trend Analysis
- Monthly return heatmap
- Rolling average price trends

---

## 🔍 Key Insights

- 60%+ of companies generated positive 5-year returns
- Top 10 companies significantly outperformed the market average
- Higher return companies exhibited higher volatility
- Only a small segment maintained consistent monthly growth

---

## 💡 Business Interpretation

Investors seeking stable growth may prioritize companies with strong CAGR and moderate volatility rather than selecting purely high-return stocks.

The analysis highlights the importance of balancing return with risk exposure.



<img width="981" height="715" alt="Screenshot 2026-02-27 093107" src="https://github.com/user-attachments/assets/63dd72bd-c945-4f2c-a2bd-df092c29a8bd" />
<img width="1016" height="574" alt="Screenshot 2026-02-27 093142" src="https://github.com/user-attachments/assets/2e63dcc6-17ac-407f-bd41-840db2b07b00" />
<img width="1008" height="717" alt="Screenshot 2026-02-27 093307" src="https://github.com/user-attachments/assets/3d29701c-cb87-41e7-b360-1dc75d300bf2" />
<img width="991" height="685" alt="Screenshot 2026-02-27 093353" src="https://github.com/user-attachments/assets/196e6068-6e93-4b5e-8f71-d74f1f83c505" />
<img width="987" height="697" alt="Screenshot 2026-02-27 093425" src="https://github.com/user-attachments/assets/5f550a81-eca1-4074-9571-5fb39e177d06" />
<img width="955" height="324" alt="Screenshot 2026-02-27 093215" src="https://github.com/user-attachments/assets/ee0ca287-969a-444d-9917-76509b9798ce" />

