--still cant copy paste so this is exercise 1 on page 156
select vendorid, sum(paymenttotal) as 'PaymentSum'
from invoices
group by VendorID
--
select top 10 v.VendorName, sum(paymenttotal) as 'PaymentSum'
from invoices i
join vendors v
on i.vendorid=v.vendorid
group by v.Vendorname
ORDER BY sum(PaymentTotal) desc
--
select v.vendorname, count(*) as 'invoiceCount', sum(i.invoicetotal) as 'invoiceSum'
from invoices i
join vendors v
on i.vendorid=v.vendorid
group by v.vendorname
ORDER BY count(*) desc
--
select 
from invoicelineitems il
join GLAccounts g
on