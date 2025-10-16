SELECT 
    company_name,
    COUNT(*) as total_postings,
    AVG(salary_usd) as avg_salary,
    AVG(benefits_score) as avg_benefits,
    AVG(years_experience) as avg_experience_required,
    AVG(remote_ratio) as avg_remote_work
FROM ai_job_dataset
GROUP BY company_name
HAVING COUNT(*) >= 3
ORDER BY avg_salary DESC, avg_benefits DESC;