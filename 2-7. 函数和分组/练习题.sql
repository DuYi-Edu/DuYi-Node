-- 1. 查询渡一每个部门的员工数量

SELECT d.`name`, COUNT(e.id) as number
FROM company as c INNER JOIN department as d on c.id = d.companyId
INNER JOIN employee as e on d.id = e.deptId
WHERE c.`name` like '%渡一%'
GROUP BY d.id, d.`name`;

-- 2. 查询每个公司的员工数量

SELECT c.`name`, COUNT(e.id) as number
FROM company as c INNER JOIN department as d on c.id = d.companyId
INNER JOIN employee as e on d.id = e.deptId
GROUP BY c.id, c.`name`

-- 3. 查询所有公司5年内入职的居住在万家湾的女员工数量

SELECT c.`name`, CASE WHEN r.number is NULL THEN 0 ELSE r.number END as number
FROM company c LEFT JOIN (SELECT c.id, c.`name`, COUNT(e.id) as number
FROM company as c INNER JOIN department as d on c.id = d.companyId
INNER JOIN employee as e on d.id = e.deptId
WHERE TIMESTAMPDIFF(YEAR,e.joinDate,CURDATE())<=5
AND e.location like '%万家湾%'
GROUP BY c.id, c.`name`) as r on c.id = r.id

-- 4. 查询渡一所有员工分布在哪些居住地，每个居住地的数量

SELECT e.location, count(e.id) as empnumber
FROM company as c INNER JOIN department as d on c.id = d.companyId
INNER JOIN employee as e on d.id = e.deptId
WHERE c.`name` LIKE '%渡一%'
GROUP BY e.location

-- 5. 查询员工人数大于200的公司信息

SELECT * FROM company
WHERE id in (
SELECT c.id
FROM company as c INNER JOIN department as d on c.id = d.companyId
INNER JOIN employee as e on d.id = e.deptId
GROUP BY c.id, c.`name`
HAVING count(e.id)>=200
)

-- 6. 查询渡一公司里比它平均工资高的员工

SELECT e.* 
FROM company as c INNER JOIN department as d on c.id = d.companyId
INNER JOIN employee as e on d.id = e.deptId
WHERE c.`name` LIKE '%渡一%' AND
e.salary>(
-- 查询渡一的平均薪资
SELECT avg(e.salary)
FROM company as c INNER JOIN department as d on c.id = d.companyId
INNER JOIN employee as e on d.id = e.deptId
WHERE c.`name` LIKE '%渡一%'
)

-- 7. 查询渡一所有名字为两个字和三个字的员工对应人数

SELECT CHAR_LENGTH(e.`name`) as 姓名长度, COUNT(E.ID) as 员工数量
FROM company as c INNER JOIN department as d on c.id = d.companyId
INNER JOIN employee as e on d.id = e.deptId
WHERE c.`name` LIKE '%渡一%'
GROUP BY CHAR_LENGTH(e.`name`)
HAVING 姓名长度 in (2,3)

-- 8. 查询每个公司每个月的总支出薪水，并按照从低到高排序

SELECT c.`name`, SUM(e.salary) as sumofsalary
FROM company as c INNER JOIN department as d on c.id = d.companyId
INNER JOIN employee as e on d.id = e.deptId
GROUP BY c.id, c.`name`
ORDER BY sumofsalary

