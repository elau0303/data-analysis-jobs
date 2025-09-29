/*
Question: What are the top-paying jobs in nyc?
 - Identify the top 20 highest-paying jobs that are available in New York City 
 - Why? Highlight the top-paying opportunities located in New York City
*/

SELECT
    job_title, 
    ROUND(salary_year_avg, 0) AS salary_annual,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_location = 'New York' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 20