# 📊 Analysis of California Hospital Performance Ratings

## 🏥 Project Overview
This project analyzes **hospital performance ratings in California** to evaluate healthcare service quality across various institutions. The study examines key performance metrics, including **adverse events, risk-adjusted rates, hospital ratings, and geographical distribution**, using data analytics techniques.

### 🎯 Objectives:
- Assess hospital performance variations across **counties and healthcare systems**.
- Analyze **adverse event occurrences** for different medical conditions.
- Investigate the **impact of geographical location** on hospital performance.
- Track **performance trends over time** to identify improvement areas.
- Provide **visual representations** of hospital data for better insights.

---

## 📂 Project Files
- **📄 Project Report:** `Rajmohan - Project Assignment 4.pdf`
- **📜 SQL Queries:** `Project Assignment 4 - Queries.sql`
- **📓 Jupyter Notebook (Data Cleaning & Analysis):** `Project Assignment 4 - Data Cleanup.ipynb`
- **📊 R Script (Data Visualization):** `Project Assignment 4 - Visualization.R`

---

## 🗃️ Dataset Information
- **Source:** [California Hospital Performance Ratings Dataset](https://catalog.data.gov/dataset/california-hospital-performance-ratings-91d9b)
- **Attributes:**
  - `Year`: Reporting period
  - `County`: Location of the hospital
  - `Hospital Name`: Name of the hospital
  - `System Affiliation`: Associated healthcare network
  - `Performance Measure`: Specific conditions evaluated (e.g., Stroke, Pneumonia, Heart Failure)
  - `Adverse Events`: Count of medical incidents
  - `Cases`: Number of recorded cases
  - `Risk-Adjusted Rate`: Adjusted metrics for fair performance comparison
  - `Latitude/Longitude`: Geographical coordinates for mapping

---

## 🔧 Project Workflow
### **1️⃣ Data Preprocessing & Cleaning (Python)**
- **Performed in**: `Project Assignment 4 - Data Cleanup.ipynb`
- **Key Steps:**
  - Load dataset using **Pandas**.
  - Identify & remove **duplicates and missing values**.
  - Standardize text columns (e.g., hospital names, counties).
  - Handle **outliers in adverse event rates**.
  - **Geocode missing hospital locations** using Google Maps API.
  - Export the **cleaned dataset** for further analysis.

### **2️⃣ SQL Queries for Data Exploration**
- **Performed in**: `Project Assignment 4 - Queries.sql`
- **Key Queries:**
  - Identify **hospitals with the highest/lowest adverse event rates**.
  - Compare hospital ratings across **different counties**.
  - Evaluate **hospital performance trends over time**.
  - Extract hospitals with **high case volumes but low risk rates**.

### **3️⃣ Data Visualization & Insights (R)**
- **Performed in**: `Project Assignment 4 - Visualization.R`
- **Tools Used**: `ggplot2`, `tidyr`, `dplyr`, `maps`
- **Key Visualizations:**
  - **Bar charts**: Hospital count per county.
  - **Scatter plots**: Hospital ratings mapped by **geographical location**.
  - **Stacked bar charts**: Trends in **adverse events and cases over time**.
  - **Box plots**: Risk-adjusted rates across different reports.
  - **Heatmaps**: Hospital performance distribution across California.

---

## 📈 Key Findings
### 🏥 Hospital Performance Insights:
- **Cedars-Sinai Medical Center** has the **highest number of cases** but maintains a **low risk-adjusted rate**.
- **Mercy San Juan Medical Center** reports the **highest number of adverse events**.
- **Heart Failure, Stroke, and Pneumonia** are the top three **most reported conditions**.

### 🌎 Geographic Distribution:
- **Los Angeles County** has the highest concentration of hospitals.
- **Hospitals in rural areas** tend to have **higher risk-adjusted rates**, indicating potential resource constraints.
- **Urban hospitals** generally perform better in quality metrics.

### 📉 Trends Over Time:
- **Hospital performance declined** from 2016 to 2019, followed by a slight recovery in 2020.
- **Adverse event rates increased during the COVID-19 pandemic**.
- **Improvement in performance measures** observed in **hospitals with more structured quality control programs**.

---

## 🚀 Future Enhancements
- **Machine Learning for Predictive Analysis:** Train models to **predict adverse event risks** based on historical data.
- **Deep Dive into Social Determinants of Health:** Evaluate hospital performance against **socioeconomic factors**.
- **Integration with Real-time Data:** Develop an API to **fetch live hospital performance data**.
- **Interactive Web Dashboards:** Deploy **Tableau/Power BI dashboards** for better stakeholder engagement.

---

## 📚 References
1. **California Hospital Performance Data:** [Data.gov](https://catalog.data.gov/dataset/california-hospital-performance-ratings-91d9b)
2. **Google Maps API for Geocoding:** [Google Maps Developers](https://developers.google.com/maps/documentation/geocoding/start)
3. **Python Libraries:** `pandas`, `numpy`, `geopy`
4. **R Libraries:** `ggplot2`, `tidyr`, `dplyr`, `maps`
5. **SQL Database Queries:** MySQL/PostgreSQL

---

## ⚙️ How to Run the Code
### **1️⃣ Prerequisites**
- **Python 3.x**
- **Jupyter Notebook**
- **R (with ggplot2, dplyr, tidyr)**
- **SQL Database (MySQL or PostgreSQL)**

### **2️⃣ Setup**
#### 🔹 Install Required Python Libraries:
```bash
pip install pandas numpy geopy matplotlib seaborn
install.packages("ggplot2")
install.packages("tidyr")
install.packages("dplyr")
install.packages("maps")
```
---


### ✅ Key Features:
- **Comprehensive documentation** covering **dataset, methodology, visualizations, findings, and future work**.
- **Clear execution steps** for Python, R, and SQL.
- **Real-world relevance** with **insights into healthcare quality and policy implications**.
- **Future directions** for **predictive modeling & interactive dashboards**.

Let me know if you need any modifications! 🚀

