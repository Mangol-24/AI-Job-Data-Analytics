SELECT experience_level,job_title,
	COUNT(*) AS title_count
FROM ai_job_dataset
GROUP BY experience_level, job_title
HAVING COUNT(*) = (
	SELECT MAX(COUNT)
	FROM (
		SELECT experience_level,job_title, COUNT(*) AS count
		FROM ai_job_dataset
		GROUP BY experience_level, job_title
	) AS subq
	WHERE subq.experience_level = ai_job_dataset.experience_level
)
ORDER BY 
	case experience_level
		when 'EN' then 1
		when 'MI' then 2
		when 'SI' then 3
		when 'EX' then 4
	END;