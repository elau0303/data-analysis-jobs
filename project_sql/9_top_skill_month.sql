/*
Question: What is the top-demanded skill for each month in NYC?
 - Identify the highest number of jobs posted per month that all required the same skill
 - Why? Allows job seekers to understand which months had the most job postings
        and what skills these jobs required most
*/

WITH jobs_per_month AS (
    SELECT 
        EXTRACT(MONTH FROM job_posted_date) AS month,
        COUNT(job_id) AS num_jobs_posted
    FROM job_postings_fact
    WHERE 
        job_location = 'New York'
    GROUP BY 
        month
    ORDER BY 
        month
), skills_per_month AS (
    SELECT
        EXTRACT(MONTH FROM job_posted_date) AS month,
        skills,
        COUNT(job_postings_fact.job_id) AS skill_demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE 
        job_location = 'New York' 
    GROUP BY month, skills_dim.skills
), top_skill_per_month AS (
    SELECT DISTINCT ON (month)
        month, 
        skills,
        skill_demand_count
    FROM skills_per_month
    ORDER BY
        month, skill_demand_count DESC
)

SELECT 
    jobs_per_month.month,
    num_jobs_posted,
    top_skill_per_month.skills AS top_skill,
    skill_demand_count
FROM jobs_per_month
LEFT JOIN top_skill_per_month ON jobs_per_month.month = top_skill_per_month.month
ORDER BY
    top_skill_per_month.month