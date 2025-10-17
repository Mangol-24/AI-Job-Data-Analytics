# AI and Data Talent Intligence Dashboard 

## Project Overview
This repository contains the **AI & Data Talent Intelligence Dashboard**, a comprehensive analytical project built to decode the global AI and Data Science job market.
The dashboard is constructed from an analysis of **over 15,000 real-world job postings**, transforming raw hiring data into actionable business intelligence.

This repository contains the **AI & Data Talent Intelligence Dashboard**, a comprehensive analytical project built to decode the global AI and Data Science job market. 
The dashboard is constructed from an analysis of **over 15,000 real-world job postings**, transforming raw hiring data into actionable business intelligence.

## Objectives 
The dashboard is Designed to 
- **Identify** high-demand and high-paying technical skills.
- **Benchmark** salaries by experience level, industry, and company size.
- **Assess** the adoption and impact of remote work.
- **Evaluate** the Return on Investment (ROI) of education and experience.
- **Track** evolving trends in the AI labor market.

## Tools and Technologies Used 
- Excel → Basic Cleaning and preparation
- SQL → Query practice for trend and route analysis
- Power BI (DAX) → Dashboard design and calculation

## Dataset Used 
The analysis uses a comprehensive dataset containing:
- **15,000+ job postings** in AI and Data Science fields
- **Key columns include:**
  - Job titles and IDs
  - Experience levels (Entry, Mid, Senior, Executive)
  - Employment types (Full-time, Part-time, Contract, Freelance)
  - Salary data (Average, Minimum, Maximum)
  - Remote work ratio (0%, 50%, 100%)
  - Company size and industry
  - Required skills and technologies
  - Education requirements

## Key Feature and Insights

### Executive Summary
- **Headline KPIs:** Total Jobs, Average Salary, Highest Salary, and Remote Work Ratio.
- **Experience vs. Salary:** A clear, steep pay curve confirming experience as the primary salary driver.
- **Remote Work Distribution:** A near-even split between on-site, hybrid, and fully remote roles, reflecting a mature, post-pandemic work landscape.

### Core Visualizations
1.  **Salary by Experience & Employment Type:** Reveals that experience level is a stronger pay determinant than contract type.
2.  **Total Jobs by Industry & Company Size:** Highlights that Retail, Media, and Consulting are AI hiring leaders, driven primarily by large and medium enterprises.
3.  **Top Skills Demand:** Python dominates, followed by SQL, TensorFlow, Kubernetes, and PyTorch, underscoring the need for end-to-end data workflow expertise.
4.  **Salary Trends Over Time:** Tracks the stability and evolution of median AI salaries.
5.  **Company & Education Analysis:** Compares average salaries across companies and benefits scores by education level.

### Notable Findings
- **Python is the undisputed top skill,** with ~30% more demand than the next skill (SQL).
- Executive roles command significantly higher salaries, but the growth rate diminishes at higher seniority levels.
- Cloud platform (GCP) and version control (Git) skills are in the top 10, emphasizing the need for scalable, collaborative development environments.

## SQL Queries
- **The Remote Work Salary Trade-off** [File Link](https://drive.google.com/file/d/1c4F2WIS881lMI8hl4uFAcQ0Ura8wEASN/view?usp=drive_link)
  ```
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
  ```















  
