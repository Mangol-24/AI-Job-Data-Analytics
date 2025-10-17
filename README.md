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

## **Process and Methodology**
-  **Data Cleaning**: Removed duplicates, handled missing values, standardized date and location formats.
-  **Exploratory Analysis:** Identified Python as the most demanded skill (~30% higher than SQL) ,Discovered near-even split in remote work distribution,
       Confirmed strong correlation between experience level and salary progression
- **SQL Queries:** Used GROUP BY, HAVING, ORDER BY and CASE Function to extract key metrics.
- **Visualization:** Created Power BI dashboard to present insights clearly.
- **DAX Measures Developed:**
     - KPI Measures: Total Jobs, Average Salary, Highest Salary, Remote Ratio
     - Comparative Analysis: Experience-level salaries, industry benchmarks
     - Trend Analysis: Salary evolution over time, skill demand patterns
- **AI-Assisted Development**
- **Tools Utilized:**
    - ChatGPT/GPT-4: DAX formula optimization, SQL query refinement, methodological guidance
    - GitHub Copilot: Code suggestions and documentation assistance
    - Custom AI Assistants: Domain-specific insights for AI job market trends

- **AI Collaboration Areas:**
    - DAX measure debugging and optimization
    - Statistical interpretation of salary growth patterns
    - Visualization best practices and layout recommendations
    - Insight formulation and narrative development

## Dataset Used 
The analysis uses a comprehensive dataset containing:
- **15,000+ job postings** in AI and Data Science fields
- **Key columns include:**
  - `Job titles and IDs`
  - `Experience levels (Entry, Mid, Senior, Executive)`
  - `Employment types (Full-time, Part-time, Contract, Freelance)`
  - `Salary data (Average, Minimum, Maximum)`
  - `Remote work ratio (0%, 50%, 100%)`
  - `Company size and industry`
  - `Required skills and technologies`
  - `Education requirements`

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

## **Dashboard Preview**
 - **AI Data and Inteligence Dashboard** [File Link](https://drive.google.com/file/d/1eE8xUetQucp16O50dNcADlgA-748vmn8/view?usp=drive_link)

## **SQL Queries** (Sample)

-- **The Remote Work Salary Trade-off**   [File Link](https://drive.google.com/file/d/1c4F2WIS881lMI8hl4uFAcQ0Ura8wEASN/view?usp=drive_link)
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

-- **Most Common Job Titles by Experience Level** [File Link](https://drive.google.com/file/d/1HhsZuYshGeJock4EiXa62R41aAGGW3D1/view?usp=drive_link)
```
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
 ```

-- **Remote Work Adoption by Industry** [File Link](https://drive.google.com/file/d/17zL1eckUbyhgcl9ydfsyMKrS29KAHrCD/view?usp=drive_link)
```
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
 ```

--**Experience vs Education ROI**  [File link](https://drive.google.com/file/d/1zrqR7NKbeGB9e347DDOzRAQ6ro7xHaCk/view?usp=drive_link)
```
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
 ```

##**DAX Measures in Power BI**(Sample)

--**Average Salary by Exp & Size**
```
Avg Salary by Exp & Size = 
CALCULATE(
    AVERAGE(ai_job_dataset[salary_usd]),
    ALLEXCEPT(ai_job_dataset, ai_job_dataset[Experience_level], ai_job_dataset[company_size])
)
 ```

--**Average Salary by Location**
```
Location Avg Salary = 
CALCULATE(
    AVERAGE(ai_job_dataset[salary_usd]),
    ALLEXCEPT(ai_job_dataset, ai_job_dataset[company_location])
)
 ```

-- **Remote Salary Premium**
```
Remote Salary Premium = 
VAR RemoteAvg = CALCULATE(AVERAGE(ai_job_dataset[salary_usd]), ai_job_dataset[Remote_ratio] = 100)
VAR OfficeAvg = CALCULATE(AVERAGE(ai_job_dataset[salary_usd]), ai_job_dataset[Remote_ratio] = 0)
RETURN DIVIDE(RemoteAvg - OfficeAvg, OfficeAvg)
 ```

--**Top 10 Skills Table**
```
Top 10 Skills Table = 
VAR SkillsList =
    DATATABLE(
        "Skill", STRING,
        {
            {"Python"},
            {"TensorFlow"},
            {"PyTorch"},
            {"AWS"},
            {"Azure"},
            {"GCP"},
            {"Docker"},
            {"Kubernetes"},
            {"SQL"},
            {"MLOps"},
            {"Java"},
            {"Spark"},
            {"Hadoop"},
            {"Git"},
            {"Mathematics"},
            {"Statistics"},
            {"NLP"},
            {"Computer Vision"},
            {"Data Visualization"},
            {"Tableau"}
        }
    )
VAR SkillsWithFrequency =
    ADDCOLUMNS(
        SkillsList,
        "Frequency",
            VAR CurrentSkill = [Skill]
            RETURN
                CALCULATE(
                    COUNTROWS(ai_job_dataset),
                    FILTER(
                        ai_job_dataset,
                        CONTAINSSTRING(ai_job_dataset[required_skills], CurrentSkill)
                    )
                )
    )
VAR FilteredSkills =
    FILTER(SkillsWithFrequency, [Frequency] > 0)
RETURN
    TOPN(
        10,
        FilteredSkills,
        [Frequency],
        DESC
    )

 ```

























  
