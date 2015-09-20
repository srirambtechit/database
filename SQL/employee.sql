create table emp (id int, name varchar(30), salary int, dept_id int);

insert into emp values(1, 'sriram', 10000, 1);
insert into emp values(2, 'ashok', 9000, 2);
insert into emp values(3, 'praveen', 5000, 3);
insert into emp values(4, 'prabhakar', 3000, 1);
insert into emp values(5, 'kamal', 5000, 1);
insert into emp values(6, 'siva', 6000, 2);
insert into emp values(7, 'surya', 7000, 3);
insert into emp values(8, 'gokul', 2000, 3);
insert into emp values(9, 'sundar', 4000, 2);
insert into emp values(10, 'ramesh', 11000, 2);

#PROBLEM:- fetching top 3 salaried employee from each departments
select name, dept_id, salary 
from emp where (
	select count(*) from emp as e where e.dept_id=emp.dept_id and emp.salary <= e.salary order by e.salary desc
) <= 3 order by dept_id;


#SAMPLE OUTPUT:-
mysql> select * from emp order by dept_id;
+------+----------+--------+---------+
| id   | name     | salary | dept_id |
+------+----------+--------+---------+
|    1 | sriram1  |  10000 |       1 |
|    4 | sriram4  |   3000 |       1 |
|    5 | sriram5  |   5000 |       1 |
|    9 | sriram9  |   4000 |       2 |
|    6 | sriram6  |   6000 |       2 |
|    2 | sriram2  |   9000 |       2 |
|   10 | sriram10 |  11000 |       2 |
|    3 | sriram3  |   5000 |       3 |
|    7 | sriram7  |   7000 |       3 |
|    8 | sriram8  |   2000 |       3 |
+------+----------+--------+---------+
10 rows in set (0.00 sec)

mysql> select name, dept_id, salary from emp where ( select count(*) from emp as e where e.dept_id=emp.dept_id and emp.salary <= e.salary order by e.salary desc ) <= 3 order by dept_id;
+----------+---------+--------+
| name     | dept_id | salary |
+----------+---------+--------+
| sriram1  |       1 |  10000 |
| sriram4  |       1 |   3000 |
| sriram5  |       1 |   5000 |
| sriram2  |       2 |   9000 |
| sriram6  |       2 |   6000 |
| sriram10 |       2 |  11000 |
| sriram3  |       3 |   5000 |
| sriram7  |       3 |   7000 |
| sriram8  |       3 |   2000 |
+----------+---------+--------+
9 rows in set (0.00 sec)

