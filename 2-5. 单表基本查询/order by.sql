SELECT *, case ismale
when 1 then '男'
else '女'
end sex from employee
ORDER BY sex asc, salary desc;