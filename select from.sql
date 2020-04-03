SELECT id, loginid, loginpwd, 'abc' as '额外的一列' from `user`;

SELECT ismale '性别' from `employee`;

SELECT *, 'abc' as 'extra' from `employee`;

SELECT id, `name`, 
case ismale
when 1 then '男'
else '女'
end sex, 
salary 
FROM employee;

SELECT id, `name`, 
case
when ismale = 1 then '男'
else '女'
end sex, 
case
when salary>=10000 then '高'
when salary>=5000 then '中'
else '低'
end `level`,
salary
FROM employee;