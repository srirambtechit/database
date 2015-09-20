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
+------+-----------+--------+---------+
| id   | name      | salary | dept_id |
+------+-----------+--------+---------+
|    1 | sriram    |  10000 |       1 |
|    4 | prabhakar |   3000 |       1 |
|    5 | kamal     |   5000 |       1 |
|    9 | sundar    |   4000 |       2 |
|    6 | siva      |   6000 |       2 |
|    2 | ashok     |   9000 |       2 |
|   10 | ramesh    |  11000 |       2 |
|    3 | praveen   |   5000 |       3 |
|    7 | surya     |   7000 |       3 |
|    8 | gokul     |   2000 |       3 |
+------+-----------+--------+---------+
10 rows in set (0.00 sec)

mysql> select name, dept_id, salary from emp where ( select count(*) from emp as e where e.dept_id=emp.dept_id and emp.salary <= e.salary order by e.salary desc ) <= 3 order by dept_id;
+-----------+---------+--------+
| name      | dept_id | salary |
+-----------+---------+--------+
| sriram    |       1 |  10000 |
| prabhakar |       1 |   3000 |
| kamal     |       1 |   5000 |
| ashok     |       2 |   9000 |
| siva      |       2 |   6000 |
| ramesh    |       2 |  11000 |
| praveen   |       3 |   5000 |
| surya     |       3 |   7000 |
| gokul     |       3 |   2000 |
+-----------+---------+--------+
9 rows in set (0.00 sec)

