--task1  (lesson8)
-- oracle: https://leetcode.com/problems/department-top-three-salaries/

select Department.Name as Department, a.Name as Employee, a.Salary as Salary
from (
select e.*, dense_rank() over (partition by DepartmentId order by Salary desc) as Aaa 
from Employee e
) a 
join Department
on a.DepartmentId = Department.Id 
where Aaa <=3


--task2  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/17
select
    member_name, status, SUM(amount * unit_price) as costs
from
    Payments
    JOIN FamilyMembers ON Payments.family_member = FamilyMembers.member_id
WHERE
    YEAR(date) = 2005
GROUP BY
    member_name, status

--task3  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/13

SELECT name 
FROM Passenger 
GROUP BY name 
HAVING COUNT(*) > 1

--task4  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38

select count(first_name) as count
from Student c where first_name='Anna'

--task5  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/35


SELECT DISTINCT COUNT(classroom) AS count
FROM Schedule
WHERE date LIKE '2019-09-02%'

--task6  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38
select count(first_name) as count
from Student c where first_name='Anna'


--task7  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/32

SELECT FLOOR(AVG(year(current_date)-year(birthday))) AS age
FROM FamilyMembers

--task8  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/27

SELECT good_type_name, sum(amount*unit_price) as costs 
FROM GoodTypes 
JOIN Goods 
ON good_type_id = type 
JOIN Payments ON good = good_id 
AND YEAR(date) = 2005 
GROUP BY good_type_name

--task9  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/37
SELECT FLOOR(MIN(DATEDIFF(NOW(), birthday)/365)) AS year FROM Student



--task10  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/44

 SELECT FLOOR(MAX((DATEDIFF(NOW(), birthday)/365))) AS max_year 
 FROM Student 
 JOIN Student_in_class 
 ON Student.id=Student_in_class.student 
 JOIN Class 
 ON Class.id=Student_in_class.class 
 WHERE Class.name LIKE '10%'
 
--task11 (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/20
 SELECT status, member_name, SUM(unit_price*amount) AS costs 
FROM FamilyMembers AS fm 
JOIN Payments AS p 
ON fm.member_id = p.family_member J
OIN Goods AS g 
ON p.good = g.good_id 
JOIN GoodTypes as gp 
ON g.type = gp.good_type_id 
WHERE good_type_name = 'entertainment' GROUP BY family_member

--task12  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/55

delete from Company
where Company.id in 
(
select company from trip
group by company
having count(id) = (select min(count) from (select count(id) as count from trip
group by company) as min_count)
)

--task13  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/45

select classroom
from Schedule
group by classroom
having count(classroom) = 
(select count(classroom)
from Schedule
group by classroom
order by count(classroom) desc 
limit 1)

--task14  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/43

SELECT last_name 
FROM Teacher 
JOIN Schedule 
ON Teacher.id=Schedule.teacher 
JOIN Subject 
ON Subject.id=Schedule.subject 
WHERE Subject.name='Physical Culture' 
ORDER BY last_name ASC

--task15  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/63

SELECT CONCAT(last_name, '.', LEFT(first_name, 1), '.', LEFT(middle_name, 1), '.') AS name 
FROM Student 
ORDER BY last_name, first_name
