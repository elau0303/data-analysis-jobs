/*
Question: What skills are required for the top-paying data analyst jobs?
 - Use the top 10 highest-paying Data Analyst jobs from first query 
 - Add specific skills required to achieve these roles
 - Why? Provides a detailed look at what high-paying jobs require skills for
        This allows people to understand what skills to tackle and develop 
*/

-- CTE: this table has the top 10 paying jobs for data analyst
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title, 
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_work_from_home =  TRUE AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

-- Use inner joins because we don't care about jobs that exist
-- but have no skills associated with them
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

