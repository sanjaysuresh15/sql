
--question 1
select employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.gender,
	salaries.salary
	From employees
	inner join salaries on
	employees.emp_no = salaries.emp_no;
	
--question 2
select *
	from employees
	where hire_date between '1986-01-01' and '1986-12-31'
;

--question 3
select dept_manager.dept_no,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date,
	departments.dept_name,
	employees.first_name,
	employees.last_name
	from dept_manager
	join departments on 
	dept_manager.dept_no = departments.dept_no
	join employees on
	dept_manager.emp_no = employees.emp_no;
	
--question 4
select dept_emt.emp_no,
	departments.dept_name,
	employees.last_name,
	employees.first_name
	from dept_emt
	full join departments on 
	dept_emt.dept_no = departments.dept_no
	full join employees on
	dept_emt.emp_no = employees.emp_no;

--question 5
select * 
	from employees 
	where first_name = 'Hercules' and last_name like 'B%';

--question 6
select dept_emt.emp_no,
	departments.dept_name,
	employees.last_name,
	employees.first_name
	from dept_emt
	full join departments on 
	dept_emt.dept_no = departments.dept_no
	full join employees on
	dept_emt.emp_no = employees.emp_no
	where dept_name = 'Sales';

--question 7
select dept_emt.emp_no,
	departments.dept_name,
	employees.last_name,
	employees.first_name
	from dept_emt
	full join departments on 
	dept_emt.dept_no = departments.dept_no
	full join employees on
	dept_emt.emp_no = employees.emp_no
	where dept_name = 'Sales' or dept_name = 'Development';

-- question 8
select last_name, count(last_name) as "name count"
	from employees
	group by last_name
	order by "name count" Desc;
	