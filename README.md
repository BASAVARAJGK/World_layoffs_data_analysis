# World_layoffs_data_analysis

# 🌍 World Layoffs Data Analysis (SQL Project)

This project focuses on cleaning and analyzing a dataset of global layoffs using SQL. The goal is to prepare clean and structured data for deeper business insights.

---

## 🛠️ Tools Used
- MySQL (standard SQL)
- Window Functions (`ROW_NUMBER`)
- CTEs and Subqueries

---

## 📊 Key Steps Performed

1. **Data Staging**  
   Created a staging table to preserve raw data.

2. **Duplicate Removal**  
   Used `ROW_NUMBER()` with partitioning to identify and delete duplicate records.

3. **Null & Blank Handling**  
   - Replaced NULL values
   - Removed extra spaces
   - Standardized inconsistent text entries

4. **Data Filtering & Standardization**  
   - Removed irrelevant entries
   - Corrected inconsistencies in `industry`, `country`, and `date` fields

5. **Preparation for Analysis**  
   Cleaned dataset is ready for further queries, dashboards, and visualizations.

---

## 📈 Next Steps (Optional Enhancements)
- Add queries for trends by year, country, or industry.
- Create visualizations using Power BI, Tableau, or Python (e.g., Seaborn).
- Perform sentiment analysis on company names or regions (advanced).

---

## 📁 File
- `World_layoffs_data_analysis.sql`: Contains all SQL queries from data cleaning to transformation.

---

## 🙌 Acknowledgments
Inspired by real-world tech layoffs data and structured using best SQL practices.

---

## 📬 Contact
If you have questions or suggestions, feel free to connect!

