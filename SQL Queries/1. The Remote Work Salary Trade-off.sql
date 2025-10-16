SELECT remote_ratio,
	case
		when remote_ratio = 0 then 'On Site'
		when remote_ratio = 50 then 'Hybrid'
		when remote_ratio = 100 then 'Fully Remote'
	END AS work_model,
	case 
		when experience_level = 'EN' then 'Entry'
		when experience_level = 'MI' then 'Mid Senior'
		when experience_level = 'SE' then 'Senior'
		when experience_level = 'EX' then 'Executive'
	END AS experience_name,
	COUNT(job_id) AS number_of_jobs,
	ROUND(AVG(salary_usd), 2) AS avg_salary
	
FROM ai_job_dataset
GROUP BY remote_ratio, experience_level
ORDER BY remote_ratio, experience_level;