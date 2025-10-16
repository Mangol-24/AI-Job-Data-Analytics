SELECT company_size, experience_level,
	ROUND(AVG(salary_usd), 2) AS avg_salary,
	COUNT(job_id) AS total_jobs
FROM ai_job_dataset
GROUP BY company_size, experience_level
HAVING COUNT(job_id) > 5
ORDER BY company_size, avg_salary DESC;