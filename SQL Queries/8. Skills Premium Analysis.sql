SELECT 
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(required_skills, ',', n.n), ',', -1)) AS skill,
    ROUND(AVG(salary_usd), 2) AS avg_salary
FROM ai_job_dataset
JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL 
    SELECT 4 UNION ALL SELECT 5
) n
ON CHAR_LENGTH(required_skills) - CHAR_LENGTH(REPLACE(required_skills, ',', '')) >= n.n - 1
GROUP BY skill
ORDER BY avg_salary DESC
LIMIT 10;
