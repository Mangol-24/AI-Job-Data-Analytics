SELECT 
    industry,
    AVG(remote_ratio) as avg_remote_ratio,
    COUNT(*) as total_jobs,
    SUM(CASE WHEN remote_ratio >= 50 THEN 1 ELSE 0 END) as hybrid_remote_jobs,
    SUM(CASE WHEN remote_ratio = 100 THEN 1 ELSE 0 END) as fully_remote_jobs,
    ROUND((SUM(CASE WHEN remote_ratio = 100 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as fully_remote_percentage
FROM ai_job_dataset
GROUP BY industry
HAVING COUNT(*) >= 5
ORDER BY avg_remote_ratio DESC;