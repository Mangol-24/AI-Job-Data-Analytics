SELECT 
    education_required,
    experience_level,
    AVG(salary_usd) as avg_salary,
    AVG(years_experience) as avg_years_exp,
    COUNT(*) as job_count
FROM ai_job_dataset
GROUP BY education_required, experience_level
HAVING COUNT(*) >= 5
ORDER BY education_required, avg_salary DESC;