--Write a SELECT statement that returns all columns from the Vendors table inner-joined with the Invoices table

select *
from vendors v
JOIN invoices i
ON v.VendorId = i.vendorid;

/*
Write a SELECT statement that returns four columns: VendorName InvoiceNumber InvoiceDate Balance
From the Vendors table From the Invoices table From the Invoices table
InvoiceTotal minus the sum of PaymentTotal and CreditTotal
*/

select v.VendorName, i.InvoiceNumber, i.InvoiceDate, (i.InvoiceTotal-(i.PaymentTotal+i.CreditTotal)) as Balance
from vendors v
JOIN invoices i
ON v.VendorId = i.vendorid
WHERE (i.InvoiceTotal-(i.PaymentTotal+i.CreditTotal))>0
Order By v.VendorName asc

/*
Write a SELECT statement that returns three columns: VendorName
DefaultAccountNo AccountDescription
From the Vendors table From the Vendors table
From the GLAccounts table
The result set should have one row for each vendor, 
with the account number and account description for that vendor’s default account number.
*/

Select V.VendorName, V.DefaultAccountNo, G.AccountDescription
from Vendors v
join GLAccounts g
on DefaultAccountNo = AccountNo


--same thing but implicit

Select V.VendorName, V.DefaultAccountNo, G.AccountDescription
from Vendors v, GLAccounts g
where DefaultAccountNo = AccountNo


/*
i can no longer copy and paste to this is question 5 on page 133 
*/
select v.vendorname as 'Vendor', 
i.invoicedate as 'Date', 
i.InvoiceNumber as 'Number',
il.invoicesequence as '#',
il.InvoiceLineItemAmount as 'LineItem'
from Vendors v
join Invoices i on v.vendorid=i.vendorid
join InvoiceLineItems il on il.Invoiceid=i.invoiceid
order by v.VendorName, i.InvoiceDate, i.InvoiceNumber, il.InvoiceSequence

--

select v1.vendorid, v1.vendorname, v2.vendorname as 'name'
from vendors v1
join vendors v2 on v1.vendorcontactfname = v2.vendorcontactfname
    and v1.vendorid != v2.vendorid

--

select g.accountNo,g.AccountDescription
from GLAccounts g
left join invoicelineitems il on il.accountNo =g.accountNo
where il.AccountNo Is null
order by accountNo

--

select vendorname, vendorstate
from vendors
where vendorstate ='CA'
union
    select vendorname, 'NOT CA'
    from vendors
    where vendorstate != 'CA'
order by vendorname

---

Select vendorname, IIF(Vendorstate = 'ca','CA','NOT CA')
from vendors
order by vendorname

--