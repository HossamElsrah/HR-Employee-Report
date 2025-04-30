# HR Analytics: Employee Performance & Attrition Analysis 📊

A data analysis project leveraging **Google BigQuery** for scalable data processing and **Looker Studio** for interactive dashboards to uncover insights about:
- Employee attrition patterns
- Salary distribution across roles/departments
- Correlations between education, experience, and performance

![HR Dashboard](https://github.com/HossamElsrah/HR-Employee-Report/blob/main/Dashboard%20Sample.png)

---
## 🛠️ Tech Stack & Why We Chose Them
- **Google BigQuery**: Handled large datasets efficiently with serverless architecture
- **Looker Studio**: Created real-time, shareable dashboards with minimal latency
- **SQL**: Performed complex transformations while maintaining readability

---
## 📁 Dataset Overview
Optimized in BigQuery:
1. `employee dataset.csv`  
   - 1.5K employees | 29 fields (demographics, salary, tenure, etc.)
2. Supporting tables:  
   `EducationLevel.csv`, `PerformanceRating.csv`, `RatingLevel.csv`, `SatisfiedLevel.csv`

---
## 🔍 Key Analysis
### 1. Data Quality Assurance
   - [Cleaning Script](https://github.com/HossamElsrah/HR-Employee-Report/blob/main/Big%20Query/Cleaning_Query.sql) verified:
     - Zero NULL values in critical fields
     - No duplicate employee records
     ```sql
     SELECT EmployeeID, COUNT(*) FROM EmployeeView 
     GROUP BY EmployeeID HAVING COUNT(*) > 1;  -- Clean
     ```

### 2. Transformations
   - **Salary Segmentation**: 
     ```sql
     CASE 
         WHEN Salary > 500000 THEN 'Executive'
         WHEN Salary BETWEEN 150001 AND 300000 THEN 'Mid-Career'
         ...
     END AS Salary_Tier
     ```
   - **Time-in-Role Analysis**: Calculated promotion impact on retention

### 3. Performance Insights
   - Joined 5 tables to create a unified performance view:
   ```sql
   CREATE VIEW PerformanceView AS
   SELECT p.*, s.SatisfactionLevel AS EnvSatisfaction 
   FROM PerformanceRating p
   JOIN SatisfiedLevel s ON p.EnvironmentSatisfaction = s.SatisfactionID
   ...
   ```

---
## 📊 Dashboard Highlights
1. **Attrition Risk Factors**  
   - Sales roles with low tenure = 2.3x higher attrition
2. **Education ROI**  
   - Technical degrees yield 42% higher starting salaries
3. **Manager Impact**  
   - Employees with 3+ years under same manager = 68% higher satisfaction

---
## 🚀 How to Replicate
1. **Upload to BigQuery**:
   ```bash
   bq load --source_format=CSV dataset.Employee ./employee_dataset.csv
   ```
2. **Run Analysis**:
   ```bash
   bq query --use_legacy_sql=false < Cleaning_Query.sql
   ```
3. **Visualize**: Connect Looker Studio to your BigQuery tables

---
## 👨‍💻 Connect  
[Hossam Taha on LinkedIn](https://linkedin.com/in/hossam-taha-41b724288)
