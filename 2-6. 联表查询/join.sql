SELECT * 
from department as d left join employee as e
on d.id = e.deptId;

SELECT * 
from employee as e right join department as d 
on d.id = e.deptId;

SELECT e.`name` as empname, d.`name` as dptname, c.`name` as companyname
from employee as e 
inner join department as d on d.id = e.deptId 
inner join company c on d.companyId = c.id;