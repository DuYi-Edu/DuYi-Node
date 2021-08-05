SELECT AVG(salary) as `avg`, id
FROM employee;

-- 查询员工数量
SELECT COUNT(id)
FROM employee;

SELECT count(id) as 员工数量,
avg(salary) as 平均薪资,
sum(salary) as 总薪资,
min(salary) as 最小薪资
FROM employee;
