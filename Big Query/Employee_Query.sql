--Employee Data--
--compining First And Last Naame As Full Name Of Employee
select 
FirstName,
LastName,
concat(FirstName , " " , LastName) as FullName
from `hr-employee-analysis-455313.Data.Employee`

--Age Bins(18-51)
SELECT 
Age,
    CASE 
        WHEN Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Age BETWEEN 25 AND 31 THEN '25-31'
        WHEN Age BETWEEN 32 AND 38 THEN '32-38'
        WHEN Age BETWEEN 39 AND 45 THEN '39-45'
        WHEN Age BETWEEN 46 AND 51 THEN '46-51'
        ELSE 'Other'
    END AS Age_Group
FROM `hr-employee-analysis-455313.Data.Employee`;

--State Full Name 
SELECT 
EmployeeID,
State,
    CASE 
        WHEN State = 'CA' THEN 'California'
        WHEN state = 'IL' THEN 'Illinois'
        WHEN state = 'NY' THEN 'New York'
        ELSE 'Unknown'
    END AS State_Full_Name
FROM `hr-employee-analysis-455313.Data.Employee`;

--Salary Bins (20387-547204)
SELECT 
    Salary,
    CASE 
        WHEN Salary BETWEEN 20387 AND 50000 THEN '20K-50K'
        WHEN Salary BETWEEN 50001 AND 150000 THEN '50K-150K'
        WHEN Salary BETWEEN 150001 AND 300000 THEN '150K-300K'
        WHEN Salary BETWEEN 300001 AND 500000 THEN '300K-500K'
        WHEN Salary > 500000 THEN 'Above 500K'
        ELSE 'Other'
    END AS Salary_Bin
FROM `hr-employee-analysis-455313.Data.Employee`;


--Full Query (View 1)--
CREATE VIEW `hr-employee-analysis-455313.Data.EmployeeView` AS
SELECT 
    em.EmployeeID,
    CONCAT(em.FirstName, ' ', em.LastName) AS FullName,
    em.Gender, 
    em.BusinessTravel, 
    em.Department, 
    em.`DistanceFromHome KM`,
    em.Ethnicity, 
    ed.EducationLevel AS Education,
    em.EducationField, 
    em.JobRole, 
    em.MaritalStatus, 
    em.StockOptionLevel, 
    em.OverTime, 
    em.HireDate, 
    em.Attrition, 
    em.YearsAtCompany, 
    em.YearsInMostRecentRole, 
    em.YearsSinceLastPromotion, 
    em.YearsWithCurrManager,
    em.Age,
    CASE 
        WHEN em.Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN em.Age BETWEEN 25 AND 31 THEN '25-31'
        WHEN em.Age BETWEEN 32 AND 38 THEN '32-38'
        WHEN em.Age BETWEEN 39 AND 45 THEN '39-45'
        WHEN em.Age BETWEEN 46 AND 51 THEN '46-51'
        ELSE 'Other'
    END AS Age_Group,
    CASE 
        WHEN em.State = 'CA' THEN 'California'
        WHEN em.State = 'IL' THEN 'Illinois'
        WHEN em.State = 'NY' THEN 'New York'
        ELSE 'Unknown'
    END AS State_Full_Name,
    em.Salary,
    CASE 
        WHEN em.Salary BETWEEN 20387 AND 50000 THEN '20K-50K'
        WHEN em.Salary BETWEEN 50001 AND 150000 THEN '50K-150K'
        WHEN em.Salary BETWEEN 150001 AND 300000 THEN '150K-300K'
        WHEN em.Salary BETWEEN 300001 AND 500000 THEN '300K-500K'
        WHEN em.Salary > 500000 THEN 'Above 500K'
        ELSE 'Other'
    END AS Salary_Bin
FROM `hr-employee-analysis-455313.Data.Employee` em
JOIN `hr-employee-analysis-455313.Data.EducationLevel` ed 
    ON em.Education = ed.EducationLevelID;
--Joining Employee Table and EducationLevel Taable Based On Primary Kay (EducationLevelID)