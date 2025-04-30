# HR Analytics: Employee Performance & Attrition Analysis 📊

A data analysis project using **Google BigQuery** and **SQL** to explore:
- Employee attrition trends
- Salary distribution by job role
- Performance vs. satisfaction metrics
- Education/role correlations

![HR Dashboard Preview](https://via.placeholder.com/800x400?text=HR+Analytics+Visualization) 

---
## 📁 Dataset Overview
Uploaded to **Google BigQuery** for optimization and scalability:
1. `employee dataset.csv`  
   - Core employee data (demographics, salary, job roles, etc.)
2. `EducationLevel.csv`  
   - Education tier mappings (e.g., "Bachelor’s", "Master’s")
3. `PerformanceRating.csv`  
   - Performance reviews and satisfaction scores
4. `RatingLevel.csv` & `SatisfiedLevel.csv`  
   - Rating scales (e.g., "Low", "High") and satisfaction levels

---
## 🔍 Key Analysis Highlights
### 1. **Data Cleaning & Validation**
   - Checked for NULLs/duplicates across all tables ([cleaning.sql](Big20%Query/cleaning.sql)):
     ```sql
     SELECT * FROM EmployeeView WHERE EmployeeID IS NULL;  -- No NULLs found
     ```
### 2. **Employee Insights**
   - **Salary Distribution**: Binned into ranges (20K-50K, 50K-150K, etc.)  
   - **Age Groups**: Segmented into 18-24, 25-31, etc.  
   - **State Mapping**: Converted abbreviations (CA → California)  
   ```sql
   CASE 
       WHEN Salary BETWEEN 20387 AND 50000 THEN '20K-50K'
       ...
   END AS Salary_Bin
   ```

### 3. **Performance Metrics**
   - Joined tables to map ratings to descriptive labels (e.g., "High Performance"):  
   ```sql
   JOIN `SatisfiedLevel` s ON p.EnvironmentSatisfaction = s.SatisfactionID
   ```

---
## 📊 Sample Visualizations *(From your screenshots)*
1. **Attrition by Department**  
   ![Department Attrition]({DCF3B1E7-611A-48FD-A99E-2FE8E087FFEB}.png)  
   - Sales and HR show higher attrition rates.

2. **Salary vs. Education Field**  
   ![Education vs. Salary]({8CC02A4E-B346-4DBE-ABEE-4ADF8F3114D8}.png)  
   - Technical fields (IT, Engineering) command higher salaries.

3. **Employee Demographics**  
   ![Demographics]({1E860C76-BCB4-48D2-8E08-DBE4EAE16CA6}.png)  
   - Median age: 29 | Avg salary: $113K.

---
## 🛠️ Technical Implementation
### SQL Queries
- **Views Created**:  
  - `EmployeeView`: Consolidated employee data + derived fields (e.g., `Salary_Bin`).  
  - `PerformanceView`: Joined ratings with descriptive labels.  
- **Optimization**: Leveraged BigQuery’s scalability for large datasets.

### Tools Used
- **Google BigQuery**: Data storage/processing  
- **SQL**: Transformations and analysis  
- **Visualization**: Looker Studio (or similar) for dashboards *(mention your tool)*  

---
## 🚀 How to Reproduce
1. **Upload datasets** to BigQuery (or run locally with sample data).
2. **Execute queries**:  
   ```bash
   bq query --use_legacy_sql=false < queries/cleaning.sql
   ```
3. **Visualize**: Connect to Looker Studio/Tableau.

---
