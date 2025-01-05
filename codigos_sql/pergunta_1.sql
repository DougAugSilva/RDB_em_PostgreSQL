-- Quais os empregos na área de dados possuem os maiores salários?
SELECT	
    job_id,
	job_title,
	job_location, 
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
