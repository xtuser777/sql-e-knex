/*
SELECT 
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary,
sum(salary) as sum_salary,
count(salary) as count_salary
FROM users;

select 
u.first_name,
max(u.salary) as max_salary,
min(u.salary) as min_salary,
avg(u.salary) as avg_salary,
sum(u.salary) as sum_salary,
COUNT(u.id) as total
from users u
left join profiles as p
on p.user_id = u.id
GROUP BY u.first_name
ORDER BY total DESC;
*/
const knex = require('../../knex/config/database');
const select = knex('users as u')
  .select('u.first_name')
  .max('salary as max_salary')
  .min('salary as min_salary')
  .avg('salary as avg_salary')
  .sum('salary as sum_salary')
  .count('salary as total')
  .groupBy('u.first_name')
  .orderBy('total', 'desc');

console.log(select.toString());

select.then((data) => {
  console.log(data);
}).catch((e) => {
  console.log(e.message);
}).finally(() => {
  knex.destroy();
});