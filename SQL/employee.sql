create table emp (id int, name varchar(30), salary int, dept_id int);

insert into emp values(1, 'sriram1', 10000, 1);
insert into emp values(2, 'sriram2', 9000, 2);
insert into emp values(3, 'sriram3', 5000, 3);
insert into emp values(4, 'sriram4', 3000, 1);
insert into emp values(5, 'sriram5', 5000, 1);
insert into emp values(6, 'sriram6', 6000, 2);
insert into emp values(7, 'sriram7', 7000, 3);
insert into emp values(8, 'sriram8', 2000, 3);
insert into emp values(9, 'sriram9', 4000, 2);
insert into emp values(10, 'sriram10', 11000, 2);

#Fetching top 3 salaried employee from each departments:-
select name, dept_id, salary 
from emp where (
	select count(*) from emp as e where e.dept_id=emp.dept_id and emp.salary <= e.salary order by e.salary desc
) <= 3 order by dept_id;

