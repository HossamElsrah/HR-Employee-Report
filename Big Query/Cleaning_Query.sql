--Cleaning--
--Idtenifying null vales in Employee
SELECT * 
FROM `hr-employee-analysis-455313.Data.EmployeeView`
WHERE 
    EmployeeID IS NULL OR 
    FullName IS NULL OR 
    Gender IS NULL OR 
    BusinessTravel IS NULL OR 
    Department IS NULL OR 
    `DistanceFromHome KM` IS NULL OR 
    Ethnicity IS NULL OR 
    Education IS NULL OR 
    EducationField IS NULL OR 
    JobRole IS NULL OR 
    MaritalStatus IS NULL OR 
    StockOptionLevel IS NULL OR 
    OverTime IS NULL OR 
    HireDate IS NULL OR 
    Attrition IS NULL OR 
    YearsAtCompany IS NULL OR 
    YearsInMostRecentRole IS NULL OR 
    YearsSinceLastPromotion IS NULL OR 
    YearsWithCurrManager IS NULL OR 
    Age IS NULL OR 
    State_Full_Name IS NULL OR 
    Salary IS NULL;
----No Nulls----

--Idtenifying Dublicated vales in Employee
select 
EmployeeID , 
count(*) as cnt
from `hr-employee-analysis-455313.Data.EmployeeView`
group by EmployeeID
having cnt >1
----No Dublicateds----


--Idtenifying null vales in Performance
SELECT *
FROM `hr-employee-analysis-455313.Data.PerformanceView`
WHERE 
    PerformanceID IS NULL OR 
    EmployeeID IS NULL OR 
    ReviewDate IS NULL OR 
    EnvironmentSatisfaction IS NULL OR 
    JobSatisfaction IS NULL OR 
    RelationshipSatisfaction IS NULL OR 
    TrainingOpportunitiesWithinYear IS NULL OR 
    TrainingOpportunitiesTaken IS NULL OR 
    WorkLifeBalance IS NULL OR 
    SelfRating IS NULL OR 
    ManagerRating IS NULL;
----No Nulls----

--Idtenifying Dublicated vales in Performance
select 
PerformanceID , 
count(*) as cnt
from `hr-employee-analysis-455313.Data.PerformanceView`
group by PerformanceID
having cnt >1
----No Dublicateds----