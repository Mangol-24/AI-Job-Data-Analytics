SELECT 
    experience_level,
    job_title,
    company_location,
    company_size,
    AVG(salary_usd) as avg_salary,
    COUNT(*) as job_count,
    AVG(benefits_score) as avg_benefits
FROM ai_job_dataset
GROUP BY experience_level, job_title, company_location, company_size
HAVING COUNT(*) >= 3
ORDER BY avg_salary DESC;