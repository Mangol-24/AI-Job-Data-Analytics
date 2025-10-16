SELECT 
	experience_level,
	case
		when experience_level = 'EN' then 'Entry'
		when experience_level = 'MI' then 'Mid Senior'
		when experience_level = 'SE' then 'Senior'
		when experience_level = 'Ex' then ' Executive'
	END AS experience_full_name,
	COUNT(job_id) AS total_jobs,
	ROUND(AVG(salary_usd), 2) AS avg_salary
FROM ai_job_dataset
GROUP BY experience_level
ORDER BY avg_salary DESC;