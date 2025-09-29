## Jobs Analysis
First project and introduction to Data Analysis utilizing SQL. The project focuses on utilizing SQL and its functionalities to explore details about the job market, including top-paying jobs and in-demand skills for data analytic roles. 

Check out the SQL queries utilized here: [project_jobs_sql folder](/project_sql/)

Please note that the first five queries were completed by following a tutorial to learn the basics of SQL and data exploration. The remaining queries were created independently to analyze and explore the job market on my own. Credits to: [project_tutorial](/https://www.youtube.com/watch?v=7mz73uXD9DA&t=12631s/)

# Background 
This project serves as my entry point for exploring data analytics and the languages/tools associated with it. As my first project, I decided to follow a tutorial and to explore the information regarding the job market. 

Data hails from [SQL Course](https://lukebarousse.com/sql). The data includes information regarding job titles and its associated roles, salaries and locations. 

### The questions that I wanted to answer:
 1. What are the top-paying data analyst jobs (anywhere)?
 2. What skills are employers looking for in their employees for these top-paying jobs?
 3. What skills are most in-demand for data analysts? 
 4. Which skills are associated with higher salaries (which skills should one focus on developing to land jobs)
 5. What are the optimal skills a person should spend the most time in developing
 6. What are the top-paying jobs in New York City specifically?
 7. What are the most in-demand skills that jobs are looking for in New York City?
 8. Which months had the most job-postings and which months had the least job-postings?
 9. What is the most demanded skill in each month? 

# Tools/Technologies Used
 - **SQL** 
 - **Postgres**

 # The Analysis
 ### 1. Top Paying Data Analysis Jobs 
 Enter description 
 ```
 SELECT
    job_id,
    job_title, 
    job_location, 
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
 ```
Here's the results of the top data analyst jobs in 2023:
 - 
 - 

![Top Paying Jobs](/Users/rness123/Desktop/Projects - Beginner/data-analysis/data-analysis-jobs/assets_results/1_top_paying_jobs)

** Consider using tables to show findings

# Conclusions 
### Learnings


### Analysis Results
1. 
2. 
3. 
