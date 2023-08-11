/*select o.description, c.Name
from Orders o
right join customers c
    on C.id = O.customerID
ORDER BY c.name
*/
select 'A' ABC, *
from Customers
where sales >= 80000
Union 
    select 'B' ABC, *
    from Customers
    where sales >= 20000 AND sales < 80000
Union 
    select 'C' ABC, *
    from Customers
    where sales < 20000
;