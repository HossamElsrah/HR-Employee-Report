--Performance Table--
Create view `hr-employee-analysis-455313.Data.PerformanceView` as
SELECT 
PerformanceID, 
EmployeeID, 
ReviewDate, 
s.SatisfactionLevel as EnvironmentSatisfaction, 
s2.SatisfactionLevel as JobSatisfaction, 
s3.SatisfactionLevel as RelationshipSatisfaction, 
TrainingOpportunitiesWithinYear, 
TrainingOpportunitiesTaken, 
WorkLifeBalance, 
r.RatingLevel as SelfRating, 
r2.RatingLevel as ManagerRating 
FROM `hr-employee-analysis-455313.Data.PerformanceRating` p

JOIN `hr-employee-analysis-455313.Data.RatingLevel` r 
  on p.SelfRating = r.RatingID

JOIN `hr-employee-analysis-455313.Data.RatingLevel` r2
  on p.ManagerRating = r2.RatingID

JOIN `hr-employee-analysis-455313.Data.SatisfiedLevel` s 
  on p.EnvironmentSatisfaction = s.SatisfactionID

JOIN `hr-employee-analysis-455313.Data.SatisfiedLevel` s2 
  on p.JobSatisfaction = s2.SatisfactionID

JOIN `hr-employee-analysis-455313.Data.SatisfiedLevel` s3 
  on p.RelationshipSatisfaction = s3.SatisfactionID;