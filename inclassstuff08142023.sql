select c.name, sum(ol.Quantity*ol.Price) as 'total price' from Customers c 
join orders o on c.id=o.customerid
join orderlines ol on o.id=ol.ordersid
--where c.id = 39
group by c.name;


/*
insert customers (name,city,state)values('Grant Magella','Cincinnati','OH')
insert orders (CustomerID, description) values (39, 'Grant''s first order');
insert orderlines (ordersid, product, description, quantity, price)
Values (29,'Echo','Amazon echo', 1, 100),
        (29,'EchoDot','Amazon Echo Dot', 1, 50),
        (29,'Echo Show','Amazon Echo Show', 1, 200)
*/
select * from customers c
join orders o on c.id=o.customerid
join orderlines ol on o.id = ol.ordersid
ORDER BY c.id desc;