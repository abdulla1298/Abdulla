-- QUE :- (1)1
select *
from departments, employees;
-- QUE :- (1)2
select first_name, last_name, hire_date
from employees;
-- QUE :- (1)3
select concat(first_name," ",Last_name," , ",job_id) as Employee
from employees;
-- QUE :- (1)4
select concat(employees.first_name," " ,employees.last_name)as Employees_name, employees.hire_date, departments.department_id,departments.department_name
from departments join employees on departments.department_id=employees.department_id;
-- QUE :- (1)5
select concat(employees.employee_id," , ",employees.first_name ," , ", employees.last_name," , ", employees.email," , ", employees.phone_number," , ",employees.hire_date," , ",employees.job_id," , ", employees.commission_pct," , ",employees.manager_id," , ", employees.department_id)
from employees;
-- QUE :- (1)6
select first_name, salary
from employees
where salary>2000;
-- QUE :- (1)7
select concat(first_name," ",last_name)as NAME, hire_date as "Start Date"
from employees;
-- QUE :- (1)8
select concat(first_name," ",last_name)as NAME, hire_date as "Start Date"
from employees
order by hire_date;
-- QUE :- (1)9
select concat(first_name," ",last_name)as NAME, salary
from employees
order by salary desc;
-- QUE :- (1)10
select concat(first_name," ",last_name)as NAME, department_id,commission_pct, salary
from employees
where  commission_pct > 0
order by salary desc;
-- QUE :- (1)11
select employees.last_name, jobs.job_title, manager_id
from employees join jobs on employees.job_id=jobs.job_id
where employees.manager_id is null;
-- QUE :- (1)12
select job_id, last_name, salary
from employees
where job_id ="SA_REP" and "ST_CLERK" and salary <> 3500 and salary <> 2500 and salary <> 5000 ;
-- que :- (2)1
select min(salary), min(commission_pct),avg(salary), avg(commission_pct),max(salary), max(commission_pct)
from employees;
-- que :-(2)2
select department_id,sum(salary) as "Total Payout SALARY",sum(commission_pct) as "Total Payout COMMISSITION"
from employees
group by department_id;
-- que :-(2)3
select department_id, count(employee_id)
from employees
group by department_id;
-- que :-(2)4
select department_id, count(employee_id), sum(salary)
from employees
group by department_id;
-- que :- (2)5
select first_name as " ", commission_pct as " "
from employees
where commission_pct is null;
-- que :- (2)6
select first_name,department_id,commission_pct,
case 
when commission_pct is null then "NO COMMISSION"
end
from employees;
-- que :- (2)7
select first_name as "employee name",department_id,commission_pct,
case 
when commission_pct is null then "NO COMMISSION"
when commission_pct is not null then commission_pct*2
end  as "commission  multiplie"
from employees;
-- que :- (2)8
select first_name,department_id
from employees
group by department_id,first_name
having count(first_name) > 1;
-- que :- (2)9
select sum(e.salary),m.first_name as managers
from employees as e join employees as m
	on m.employee_id = e.manager_id
group by m.first_name;
-- que :- (2)10
select m.first_name, count(e.employee_id)as "employees",m.department_id
from employees as e join employees as m on e.manager_id=m.employee_id
group by m.first_name, m.department_id;
-- que :- (2)11
select e.last_name as "EMP Name",m.last_name as "MNG Name", e.salary, m.salary,e.department_id
from employees as e join employees as m on e.manager_id=m.employee_id
where e.last_name like "_a%" and m.last_name like "_a%";
-- que:-(2)12
select sum(salary)as "sum of salary", floor(avg(salary))as "Avg of Salary",department_id
from employees
group by department_id;
-- que :- (2)13
select max(salary),department_id
from employees
where department_id is not null
group by department_id;
-- que :-(2)14
select last_name,salary, commission_pct,
case
when commission_pct is null then "1"
when commission_pct is not null then salary*10/100
end as "salary 10%"
from employees;
-- que :- (3)1
select concat(UPPER(substring(last_name,2,1)),substring(last_name,3,3))as "2-5th Last Name"
from employees; 
-- que :- (3)2
select concat(first_name,"-",last_name)as "Full Name", monthname(hire_date)as "Month of Join"
from employees;
-- que :- (3)3
select last_name,salary,
case
when salary/2 > 10000 then round(salary + salary*10/100 + 1500,2)
when salary/2 < 10000 then round(salary + salary*11.5/100 + 1500,2)
end as "bonues"
from employees;
-- que :- (3)4 
select concat(substring(e.employee_id,1,2), "00" ,substring(e.employee_id,3),"E") as "New_EMP_id", e.department_id,e.salary,REPLACE(m.last_name,"Z","$")as "replace 'Z'",REPLACE(m.last_name,"z","$")as "replace 'z'"
from employees as e join employees as m on e.manager_id=m.employee_id;
-- que :- (3)5
select concat(upper(substring(last_name,1,1)),lower(substring(last_name,2)))as "Last name",length(last_name)
from employees
where (last_name like "A%") or (last_name like "J%") or (last_name like "M%")
order by last_name;
-- que :- (3)6
select last_name, lpad((Rpad(salary,16,"0")),17,"$")as "SALARY"
from employees;
-- que :- (3)7
select last_name
from employees
where last_name= reverse(lower(last_name));

select last_name,
case
when last_name = reverse(last_name) then "palidrom"
end as "Palidrom Name"
from employees;
-- que :- (3)8
SELECT CONCAT(UPPER(SUBSTRING(first_name, 1, 1)), LOWER(SUBSTRING(first_name, 2))) AS "NAME"
FROM employees;
-- que :- (3)9
select substring_index(substring_index(street_address, " ",2), " ",-1)
from locations;

-- que :- (3)10
select first_name,lower(concat(last_name, substring(first_name,1,1),"@systechusa.com")) as "Email Adreess"
from employees;
-- que :- (3)11
select employees.first_name, jobs.job_title, jobs.job_id
from employees join jobs on employees.job_id=jobs.job_id
where first_name like "trenna";
-- que :- (3)12
select employees.first_name,departments.department_name, locations.city
from employees join departments on employees.department_id=departments.department_id join locations on locations.location_id=departments.location_id
where city like "South San Francisco";
-- que :- (3)13
select first_name,salary
from employees
where salary = (select Min(salary) from employees);
-- que :- (3)14
select first_name,salary
from employees
where salary <> (select Min(salary) from employees);
-- que :- (4)1
select employees.last_name, departments.department_id ,departments.department_name
from employees join departments on employees.department_id=departments.department_id;
-- que :- (4)2
select distinct(job_id),department_id,location_id
from departments join locations using (location_id) join jobs
where department_id =40;
-- que :- (4)3
select last_name,department_name,location_id,city,commission_pct
from employees join departments using (department_id) join locations using (location_id)
where commission_pct is not null;

select employees.last_name, departments.department_name, locations.location_id,locations.city, employees.commission_pct
from employees join departments on employees.department_id=departments.department_id join locations on locations.location_id=departments.location_id
where employees.commission_pct is not null;
-- que :- (4)4
select employees.last_name, departments.department_name
from employees join departments on employees.department_id=departments.department_id
where employees.last_name like "%a%";
-- que :- (4)5
select employees.last_name,employees.department_id,employees.job_id,countries.country_name
from employees join departments on employees.department_id=departments.department_id join locations on departments.location_id=locations.location_id join countries on locations.country_id=countries.country_id
where country_name = "United States of America";
-- que :- (4)6
select e.last_name as "EMP NAME", e.employee_id, m.last_name as "MAG NAME", m.employee_id as "MAG ID"
from employees as e join employees as m on e.manager_id=m.employee_id;
-- que :- (4)7
select e.last_name as "EMP NAME", e.employee_id, m.last_name as "MAG NAME", m.employee_id as "MAG ID"
from employees as e left join employees as m on e.manager_id=m.employee_id;
-- que :- (4)8
select employees.last_name, employees.job_id, departments.department_name, departments.department_id, countries.country_name
from employees join departments on employees.department_id=departments.department_id join locations on locations.location_id=departments.location_id  join countries on locations.country_id=countries.country_id
where countries.country_name like "United States of America";
-- que :- (4)9
select employees.first_name,departments.department_name, employees.job_id, employees.salary,
case
when employees.salary >= 5000 then "A"
when employees.salary >= 3000 then "B"
when employees.salary < 3000 then "C"
end as " grade by Salary"
from employees join departments on employees.department_id=departments.department_id;
-- que :- (4)10
select e.first_name as "EMP_NAME", e.hire_date as "EMP_HIRE_DATE",m.first_name as "MGR_NAME",m.hire_date"MGR_HIRE_DATE"
from employees as e join employees as m on e.manager_id=m.employee_id
where e.hire_date < m.hire_date;
-- que :- (5)1
select last_name, hire_date
from employees
where job_id = "SA_MAN" and department_id = "SA_REP";
-- que :- (5)2
select last_name, employee_id, salary
from employees
where salary > (select avg(salary) from employees)
order by salary;
-- que :- (5)3
select last_name,department_id
from employees
where last_name like "%A%U%";
-- que :- (5)4
select employees.last_name,employees.department_id,employees.job_id,countries.country_name
from employees join departments on employees.department_id=departments.department_id join locations on departments.location_id=locations.location_id join countries on locations.country_id=countries.country_id
where country_name = "United States of America";
-- que :- (5)5
select concat(e.first_name," ",e.last_name) as "EMP NAME",e.salary, concat(m.first_name," ",m.last_name) as "manager_name"
from employees as e join employees as m on e.manager_id=m.employee_id
where m.first_name = "Steven";
-- que :- (5)6
select employees.last_name,employees.department_id,employees.job_id, department_name
from employees join departments on employees.department_id=departments.department_id
where department_name = "Operations";
-- que :- (5)7
select employee_id,last_name,salary, department_id
from employees
where salary > (select avg(salary)from employees) and last_name like "%U%";
-- que :- (5)8
select concat(employees.first_name," ",employees.last_name)as "EMP Name", jobs.job_title
from employees join jobs on employees.job_id=jobs.job_id
where department_id = 80;
-- que :- (5)9
select employee_id,salary, department_id,
case
when department_id = 10  then "5%"
when department_id = 30 then "5%"
when department_id = 20 then "10%"
when department_id = 40  then "15%"
when department_id = 50 then "15%"
when department_id = 60 then "0%"
when department_id <> 10 and 30 and 20 and 40 and 50 and 60 then "Other"
end as "raise_percentages"
from employees;
-- que :- (5)10
select first_name, salary ,dense_rank() over (order by salary desc)as RN from(
select first_name,salary, dense_rank() over (order by salary desc)as RN from employees) as a
where RN <= 3; -- also can use (limit 3;)
-- que :- (5)11
select concat(first_name," ",Last_name)as "Name", salary,commission_pct,
case
when commission_pct is null then "0"
when commission_pct is not null then commission_pct
end as"commission"
from employees;
-- que :- (5)12
select concat(m.first_name," ",m.last_name) as "MNG_NAME",m.salary ,dense_rank() over (order by salary desc)as RN
from employees as e join employees as m on e.manager_id=m.employee_id
group by m.employee_id
limit 3;
-- QUE :- (6)1
select *, floor(datediff(resignation_date,hire_date)) as "date_diff",
case
when Resignation_Date is not null then concat(floor(datediff(resignation_date,hire_date)/365)," ","Year"," ", floor(datediff(resignation_date,hire_date)%365/30)," ","Month"," ",floor(datediff(resignation_date,hire_date)%365%30)," ","Days")
when Resignation_Date is null then concat(floor(datediff(Now(),hire_date)/365)," ","Year"," ",floor(datediff(Now(),hire_date)%365/30)," ","Month"," ",floor(datediff(Now(),hire_date)%365%30)," ","Days")
end as Duration
from date_function;
-- QUE :- (6)2
select Hire_Date, date_format(hire_date,'%m/%d/%Y')as "Formated Hire_date",Resignation_Date,
case
when Resignation_Date is not null then date_format(resignation_date,'%M %D,%Y')
else "Dec, 01th 1900"
end as "Formated Resignation_Date"
from date_function;
-- Que :-(6)3
select *, floor(datediff(resignation_date,hire_date)),
case
when Resignation_Date is not null then concat(floor(datediff(resignation_date,hire_date)/365)," ","Year"," ", floor(datediff(resignation_date,hire_date)%365/30)," ","Month")
when Resignation_Date is null then concat(floor(datediff(Now(),hire_date)/365)," ","Year"," ",floor(datediff(Now(),hire_date)%365/30)," ","Month")
end as Experiance
from date_function;