select *
from vendors
where vendorid in
(select distinct vendorid
from invoices
where InvoiceTotal >=100)