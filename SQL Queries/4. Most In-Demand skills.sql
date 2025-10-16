SELECT 
    skill,
    COUNT(*) AS demand_count
FROM (
    SELECT 
        SUBSTRING_INDEX(SUBSTRING_INDEX(required_skills, ',', n.n), ',', -1) AS skill
    FROM 
        ai_job_dataset
    JOIN (
        SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 
        UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
    ) AS n
    ON CHAR_LENGTH(required_skills) - CHAR_LENGTH(REPLACE(required_skills, ',', '')) >= n.n - 1
) AS skill_list
GROUP BY skill
ORDER BY demand_count DESC
LIMIT 10;




