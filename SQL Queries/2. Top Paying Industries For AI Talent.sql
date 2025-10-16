SELECT industry,
	COUNT(job_id) AS total_jobs,
	ROUND(AVG(salary_usd), 2) AS avg_salary
FROM ai_job_dataset
GROUP BY industry
HAVING COUNT(job_id) > 100
ORDER BY avg_salary DESC
LIMIT 10;