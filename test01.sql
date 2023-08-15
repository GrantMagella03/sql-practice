select r.id,r.[Description],r.total,rl.quantity,p.price, (rl.quantity * p.price) Linetotal
from requests r
join requestline rl on r.id=rl.requestid
join products p on p.id=rl.productid