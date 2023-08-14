select distinct vendorname
from vendors v
where vendorid in
(select vendorid
from invoices i
where v.vendorid=i.vendorid)
ORDER BY VendorName
--
/*select distinct vendorname
from vendors v
join invoices i
on v.vendorid=i.vendorid
order by vendorname*/
--
select invoiceNumber, InvoiceTotal
from invoices
where PaymentTotal>(select avg(PaymentTotal) from invoices 
where invoicetotal-paymenttotal-credittotal <=0)
--
select invoicenumber
from invoices
where paymenttotal>ALL
(select top 50 percent paymenttotal
from invoices
where paymenttotal <>0
order by paymenttotal);