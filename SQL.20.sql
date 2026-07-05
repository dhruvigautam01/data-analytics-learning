-- USE company
-- CREATE TABLE company(
-- id INT PRIMARY KEY,
-- name VARCHAR(100) NOT NULL,
-- dept_id int,
-- salary int,
-- hire_date DATE
-- );
-- INSERT INTO company(id,name,dept_id,salary,hire_date) values
-- (1,'Alice',1,55000,'2021-03-15'),
-- (2,'Bob',2,72000,'2023-06-01'),
-- (3,'Carol',1,61000,'2020-11-20'),
-- (4,'David',2,85000,'2019-07-10'),
-- (5,'Eva',3,48000,'2022-01-30'),
-- (6,'Frank',3,52000,'2021-09-05'),
-- (7,'Grace',2,91000,'2018-04-22');


-- CREATE TABLE departmentss(
-- dept_id INT PRIMARY KEY,
-- dept_name VARCHAR(100) NOT NULL,
-- Budget int
-- );

-- INSERT INTO departmentss values
-- (1,'Sales',200000),
-- (2,'Engineering',500000),
-- (3,'Marketing',150000)


-- CREATE TABLE performance(
-- emp_id int,
-- year INT,
-- rating DECIMAL(2,1),
-- bonus INT 
-- );


-- INSERT INTO performance values
-- (1,2024,4.2,5000),
-- (2,2024,3.8,4000),
-- (3,2024,4.7,6000),
-- (4,2024,2.5,2000),
-- (5,2024,4.0,3500),
-- (6,2024,2.8,2500),
-- (7,2024,4.9,8000);















-- SELECT d.dept_name, AVG(c.salary) AS avg_salary
-- FROM company c
-- JOIN departmentss d ON c.dept_id = d.dept_id
-- GROUP BY d.dept_name
-- ORDER BY avg_salary DESC;

-- SELECT name , salary 
-- FROM company
-- ORDER BY salary desc
-- LIMIT 3;

-- SELECT c.name, c.hire_date, p.rating
-- FROM company c
-- JOIN performance p ON c.id = p.emp_id
-- WHERE c.hire_date < DATE_SUB(CURDATE(),INTERVAL 2 YEAR) AND p.rating > 4;

-- SELECT d.dept_name , SUM(p.bonus) AS total_bonus
-- FROM company c
-- JOIN performance p ON c.id = p.emp_id
-- JOIN departmentss d ON c.dept_id = d.dept_id
-- WHERE p.year = 2024
-- GROUP BY d.dept_name


-- SELECT c.name , d.dept_name , p.rating
-- FROM company c
-- JOIN departmentss d ON d.dept_id = c.dept_id
-- JOIN performance p ON p.emp_id = c.id
-- ORDER BY p.rating DESC  


-- SELECT c.name , d.dept_name , p.rating , RANK() OVER (PARTITION BY d.dept_name ORDER BY p.rating DESC) AS dept_rank
-- FROM company c
-- JOIN departmentss d ON d.dept_id = c.dept_id
-- JOIN performance p ON p.emp_id = c.id
-- ORDER BY d.dept_name , dept_rank;

SELECT c.name , c.salary,p.rating , 
CASE  WHEN c.salary > 70000 AND p.rating < 3 THEN 'At risk'
ELSE 'Good'
END AS status
FROM company c
JOIN performance p ON c.id = p.emp_id;



