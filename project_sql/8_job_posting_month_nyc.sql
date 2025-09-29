/*
Question: What are the number of jobs posted during each month during 2023?
 - Identify the number of jobs posted per month in New York
 - Why? Allows job seekers to understand which months had the most job postings
        May help prepare for applications in the next year
*/

SELECT 
    EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(job_id) AS num_jobs_posted
FROM job_postings_fact
WHERE 
    job_location = 'New York'
GROUP BY 
    month
ORDER BY 
    month;