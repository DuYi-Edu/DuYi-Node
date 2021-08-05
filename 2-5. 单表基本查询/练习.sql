-- 查询user表，得到账号为admin，密码为123456的用户
-- 登录

SELECT * from `user`
WHERE loginid = 'admin' and loginpwd = '123123';

-- 查询员工表，按照员工的入职时间降序排序，并且使用分页查询
-- 查询第3页，每页5条数据
-- limit (page-1)*pagesize, pagesize

SELECT * FROM employee
ORDER BY employee.joinDate desc
LIMIT 10,5

-- 查询工资最高的女员工

SELECT * FROM employee
WHERE ismale = 0
ORDER BY salary desc
limit 0,1;