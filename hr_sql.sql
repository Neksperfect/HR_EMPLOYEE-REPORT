CREATE DATABASE projects;

use projects;

select * from hr;

alter table hr
change column ï»¿id emp_id varchar(20) null;

describe hr;

set sql_safe_updates = 0;

update hr
set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;

alter table hr
modify column birthdate DATE;

update hr
set hire_date = case
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;

alter table hr
modify column hire_date DATE;

update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate is not null and termdate != ' ';

alter table hr
modify column termdate DATE;

Select termdate from hr;

alter table hr add column age int;

UPDATE hr
set age = timestampdiff(YEAR, birthdate, CURDATE());

select
	min(age) as youngest,
    max(age) as olders
from hr;

select count(*) from hr where age <18;

-- QUESTIONS

-- 1. What is the gender breakdown of employees in the company?
Select gender, count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by gender;

-- 2. what is the race/ethnicity breakdown of employees in the company?
select race, count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by race
order by count(*) desc;

-- 3. what is the age distribution of employees in the company?
select
	min(age) as youngest,
    max(age) as oldest
from hr
where age >= 18 and termdate = '0000-00-00';

select 
	case
		when age >= 18 and age <=23 then '18-23'
        when age >= 24 and age <=33 then '24-33'
        when age >= 35 and age <=43 then '35-43'
        when age >= 44 and age <=53 then '44-53'
        when age >= 54 and age <=63 then '54-63'
        else '64+'
	END AS age_group, gender,
    count(*) AS count
from hr
where age >= 18 and termdate = '0000-00-00'
group by age_group, gender
order by age_group, gender;

-- 4. how many employees work at the headquaters vs remote?
select location, count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by location
order by count(*) desc;

-- 5. what is the average rate of employment for employees who have been terminated?
select
	round(avg(datediff(termdate, hire_date))/365, 0) as avg_len_employment
from hr
where termdate <= curdate() and termdate != '0000-00-00' and age >= 18;

-- 6. how does the gender distribution vary acros departments and job title?
select department, gender, count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by department, gender
order by department;

-- 7. what is the distribution of job titles across the company?
select jobtitle, count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by jobtitle
order by jobtitle desc;

-- 8. which department has the highest turnover rate?
select department,
	total_count,
    terminated_count,
    terminated_count/total_count as termination_rate
from(
	select department,
    count(*) as total_count,
    sum(case when termdate <> '0000-00-00' and termdate <= curdate() then 1 else 0 end
    ) as terminated_count
    from hr
    where age >= 18
    group by department) as subquery
order by termination_rate desc;

-- 9. what is the distribution of employees across location by city and state?
select location_state, count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by location_state
order by count desc;

-- 10. How has the company's employee count changed over time based on hire and termination date?
select
	year,
    hires,
    terminations,
    hires - terminations as net_change,
    round((hires - terminations)/hires * 100, 2) as net_change_percent
from(
	select
		year(hire_date) as year,
        count(*) hires,
        sum(case when termdate != '0000-00-00' and termdate <= curdate() then 1 else 0 end) as terminations
        from hr
        where age >= 18
        group by year(hire_date)
        ) as subquery
order by year asc;

-- 11. Whate is the tenure distribution for each department?
select department, round(avg(datediff(termdate, hire_date)/365), 0) as avg_tenure
from hr
where termdate <= curdate() and termdate != '0000-00-00' and age >= 18
group by department;
