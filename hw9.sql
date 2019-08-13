CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "dept_emt" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emt" ADD CONSTRAINT "fk_dept_emt_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emt" ADD CONSTRAINT "fk_dept_emt_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

select employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.gender,
	salaries.salary
	From employees
	inner join salaries on
	employees.emp_no = salaries.emp_no;
	
select *
	from employees
	where hire_date between '1986-01-01' and '1986-12-31'
;

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
	

select dept_emt.emp_no,
	departments.dept_name,
	employees.last_name,
	employees.first_name
	from dept_emt
	full join departments on 
	dept_emt.dept_no = departments.dept_no
	full join employees on
	dept_emt.emp_no = employees.emp_no;

select * 
	from employees 
	where first_name = 'Hercules' and last_name like 'B%'

