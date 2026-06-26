# Global-layoffs-SQL-analysis
End-to-end SQL project involving data cleaning and exploratory analysis of global layoffs data to identify key trends, patterns, and business insights across industries 
📊 Global Layoffs Data Analysis (SQL Project)

## 🧾 Overview
#
This project performs a complete end-to-end **data cleaning and exploratory data analysis (EDA)** on a real-world dataset of global layoffs using SQL.

The objective is to transform raw, inconsistent data into a structured analytical dataset and extract meaningful business insights about layoffs across companies, industries, countries, and time periods.

This project demonstrates practical skills in:
- SQL data cleaning
- Data transformation
- Handling missing and duplicate data
- Exploratory data analysis
- Business insight generation

---

## 🛠 Tools Used

- MySQL Workbench
- SQL (Data Cleaning & Analysis)
- CSV dataset (raw layoffs data)

---

## 📥 Data Import Process

The dataset was initially provided in CSV format. During import, only **564 rows were being loaded instead of the full dataset (~2300+ rows)**.

To resolve this:
- A manual table structure was created in MySQL
- `LOAD DATA INFILE` was used for full ingestion
- This ensured complete and accurate data import

This highlights real-world issues in data pipelines and ingestion processes.

---

# 🧹 Data Cleaning Process

## Step 1: Staging Table Creation
A duplicate table (`layoffs_staging`) was created to preserve the original dataset.

---

## Step 2: Duplicate Removal
Duplicates were identified using `ROW_NUMBER()` with `PARTITION BY` and removed.

---

## Step 3: Data Standardization
- Trimmed company names
- Standardized industry names (Crypto, Finance, Consumer, Travel)
- Standardized country names (United States formatting)
- Filled missing industries using known mappings:
  - Airbnb → Travel
  - Carvana → Transportation
  - Juul → Consumer

---

## Step 4: Final Clean Dataset
Final dataset created:

`layoffs_clean`

---

## Step 5: Data Reduction
Removed:
- Rows missing both`total_laid_off` and `percentage_laid_off`
- Temporary helper columns (`row_num`)

---

# 📊 Exploratory Data Analysis (EDA)

The following business questions were explored using SQL:

---

## 1. Total employees laid off worldwide
👉 ~383,659 employees were laid off globally.

---

## 2. Maximum single layoff event
👉 Largest single event involved 12,000 employees in one company event.

---

## 3. Maximum percentage of workforce laid off
👉 Maximum recorded value: 100% workforce reduction.

---

## 4. Companies with the highest total layoffs
👉 Top companies include:
- Amazon 18,150 employees
- Google 12,000 employees
- Meta 11,000 employees
- Salesforce 10,090 employees
- Microsoft 10,000 employees

---

## 5. Industries most affected
👉 Most affected industries:
- Consumer 45,182 employees
- Retail 43,613 employees
- Other 36,289 employees
- Transportation 33,748 employees
- Finance 28,559 employees
- Healthcare 25,953 employees
- Food 22,855 employees
- Real Estate 17,565 employees

---

## 6. Countries with the highest layoffs
👉 Most impacted countries:
- United States 256,559 employees
- India 35,993 employees
- Netherlands 17,220 employees
- Sweden 11,264 employees
- Brazil 10,391 employees
- Germany 8,701 employees
- United Kingdom 6,398 employees
- Canada 6,319 employees
  
---

## 7. Funding stage most affected
👉 Most layoffs occurred in:
- Post-IPO companies 204,132
- Unknow 40,716
- Acquired companies 27,576
- Series C companies 20,017
- Series D companies 19,225

---

## 8. Average layoffs per company
👉 Average layoff per company: 
- Google 12,000 employees
- Meta 11,000 employees
- Microsoft 10,000 employees
- Ericsson 8,500 employees
- Dell 6,650 employees
- Amazon 6,050 employees

---

## 9. Total funding raised by companies that conducted layoffs

Companies that laid off employees collectively raised approximately 1.8Trillion in funding globally.

---

## 10. Total funding raised per company

- Netflix 487.6Billion
- Uber 23.5Billion
- WeWork 65.7Billion
- Twitter 38.7Billion
- Bytedance 35.6Billion
- Delivery Hero 26.5Billion
- Meta 26Billion

---

# 📈 Key Insights (Business Interpretation)

- A small number of large tech companies account for a disproportionate share of global layoffs.
- Layoffs peaked in specific economic periods, showing macroeconomic influence.
- Post-IPO and late-stage companies were most affected, suggesting restructuring and cost-cutting pressure.
- High funding does not prevent workforce reductions.
- The United States dominates global layoff activity.

---

# 📌 Skills Demonstrated

- SQL data cleaning and transformation
- Duplicate detection and removal
- Data standardization
- Aggregation and trend analysis
- Business insight generation

---

# 🚀 Project Outcome

This project demonstrates a full SQL workflow:

**Raw data → Cleaning → Structured dataset → Business insights**

---

# 📌 Status

✔ Data imported  
✔ Data cleaned  
✔ EDA completed  
✔ Insights generated  
✔ Portfolio-ready  
