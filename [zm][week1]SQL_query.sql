5 easy

Question 175:https://leetcode.com/problems/combine-two-tables/
My Answer:
select 
    firstName, lastName, city, state
from 
    Person left join Address
on
     Person.personId=Address.personId
     ;
     
Question 183:https://leetcode.com/problems/customers-who-never-order/
My Answer:
select 
    name as Customers
from 
    Customers
where
    id not in (select customerId from orders)
    ;
    
Question 584:https://leetcode.com/problems/find-customer-referee/
My Answer:
select 
    name
from 
    Customer
where 
    referee_id!=2 or referee_id is null
    ;
   
Question 595:https://leetcode.com/problems/big-countries/
My Answer:
select
    name, population, area
from
    World 
where
    population>=25000000 or area>=3000000
;

3 medium
Question 176: https://leetcode.com/problems/second-highest-salary/
My Answer:
select
    ifnull(
    (select distinct salary
    from Employee
    order by salary desc
    limit 1 offset 1),
    null) as SecondHighestSalary
    ;
    
Question 177: https://leetcode.com/problems/nth-highest-salary/
My Answer:
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
set N=N-1;
  RETURN (
      select distinct salary
      from Employee
      order by salary DESC
      limit 1 offset N
  );
END

Question 178: https://leetcode.com/problems/rank-scores/
My Answer:
select 
    Score,
    (select count(distinct Score) from Scores where Score>=s.Score) 'rank' 
    from Scores S
    order by Score desc
    ;
   
2 hard:
Question 185: https://leetcode.com/problems/rank-scores/
My Answer:
select d.name as 'Department', e.name as 'Employee', e.salary as 'Salary'
from Employee e 
join Department d 
on e.DepartmentId=d.id 
WHERE 3 > (select count(distinct(e1.Salary)) 
                  from Employee e1
                  where e1.Salary > e.Salary 
                  and e.DepartmentId = e1.DepartmentId
);

Question 262: https://leetcode.com/problems/trips-and-users/
My Answer:
select
    request_at as Day,
    round((sum(case when status != 'completed' then 1 else 0 end)/count(distinct id)),2) as 'Cancellation Rate'
from Trips
where request_at between '2013-10-01'
and '2013-10-03'
and client_id not in (
    select
        users_id
    from Users
    where banned = 'Yes'
)
and driver_id not in (
    select
        users_id
    from Users
    where banned = 'Yes'
)
group by request_at






    
 
