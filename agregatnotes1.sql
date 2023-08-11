select count(*) as 'customer count',
max(Sales) as 'Max Sales',
Min(Sales) as 'Min sales',
avg(Sales) as 'Average of Sales',
Sum(sales) as 'gross income'
from customers
;


select city, sum(sales) as 'total sales'
from customers
--where city!='cleveland' -- removes cleveland
group by city
having sum(sales) > 600000
order by sum(sales) asc