-- Which city (excluding London) has the most estimated cases?

SELECT TOP (1) [NAME]
      ,FORMAT(ROUND(SUM(VALUE), 0), 'N0') AS estimated_cases
  FROM [AdventureWorks2017].[dbo].[pcdem-nhs-rate-feb-2023]
  WHERE [ORG_TYPE] = 'NHS_REGION'
  AND [MEASURE] LIKE '%ESTIMATE%'
  AND [NAME] != 'LONDON'
  GROUP BY NAME
  ORDER BY SUM(VALUE) DESC