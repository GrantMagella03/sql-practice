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
ORDER BY invoicecount desc
--
select gl.accountdescription, Count(*) as "lineitemcount"
from glaccounts g
--
--
/*
select vendorid,invoicedate,invoicetotal
    sum(invoicetotal) over (partition by vendorId) AS 'vendortotal',
    Count(invoicetotal) over (partition by vendorid) AS 'vendorcount'
    avg(invoicetotal) over (PARTITION BY vendorid) AS 'test'
from invoices;
--^this somehow works for prof but not for me, idk why
*/