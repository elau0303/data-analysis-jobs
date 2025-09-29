/*
Question: What are the most in-demand skills in New York City after August?
 - Identify the top 10 in-demand skills in NYC after August
 - Why? Retrieves the top 10 skills with the highest demand in job market after August, 
        provides insights into the most valuable skills for job seekers that live in NYC
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact 
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_location = 'New York' AND
    salary_year_avg IS NOT NULL AND 
    job_posted_date >= '2023-09-01'
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 10

