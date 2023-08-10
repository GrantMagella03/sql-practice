--Write a SELECT statement that returns three columns from the Vendors table: VendorContactFName, VendorContactLName, and VendorName. Sort the result set by last name, then by first name.

select VendorContactFName, VendorContactLName, VendorName from vendors order by VendorContactLName, VendorContactFName;


--Write a SELECT statement that returns four columns from the Invoices table, named Number, Total, Credits, and Balance: Number Total
--Column alias for the InvoiceNumber column Column alias for the InvoiceTotal column
--Credits Balance
--Sum of the PaymentTotal and CreditTotal columns
--InvoiceTotal minus the sum of PaymentTotal and CreditTotal
--Use the AS keyword to assign column aliase

select InvoiceNumber as 'Number', 
InvoiceTotal as 'Total', 
PaymentTotal+CreditTotal as 'credits', 
InvoiceTotal-(PaymentTotal+CreditTotal) as 'Balance' 
from Invoices;


/*
Write a SELECT statement that returns one column from the Vendors table named Full Name. 
Create this column from the VendorContactFName and VendorContactLName columns. 
Format it as follows: last name, comma, first name (for example, “Doe, John”). 
Sort the result set by last name, then by first name
*/

select concat(VendorContactLName, ', ', VendorContactFName) from Vendors order by VendorContactLName, VendorContactFName;


/*
Write a SELECT statement that returns three columns: InvoiceTotal
From the Invoices table 10% Plus 10%
10% of the value of InvoiceTotal The value of InvoiceTotal plus 10%
(For example, if InvoiceTotal is 100, 10% is 10, and Plus 10% is 110.) 
Only return those rows with a balance due greater than 1000. 
Sort the result set by InvoiceTotal, with the largest invoice first.
*/

select InvoiceTotal, invoicetotal*0.1 as '10%', InvoiceTotal + (invoicetotal * 0.1) as 'plus 10%' from Invoices
WHERE invoicetotal > 1000 order by InvoiceTotal desc;


/*
Modify the solution to exercise 2 to filter for invoices with an InvoiceTotal that’s greater than or equal to $500 
but less than or equal to $10,000.
*/


select InvoiceNumber as 'Number', 
InvoiceTotal as 'Total', 
PaymentTotal+CreditTotal as 'credits', 
InvoiceTotal-(PaymentTotal+CreditTotal) as 'Balance' 
from Invoices WHERE InvoiceTotal >= 500 AND InvoiceTotal <=10000;

/*
Modify the solution to exercise 3 to filter for contacts whose last name begins with the letter A, B, C, or E (not D).
*/

select concat(VendorContactLName, ', ', VendorContactFName) 
from Vendors 
where VendorContactLName like'[a-c, e]%'
order by VendorContactLName, VendorContactFName


/*
Write a SELECT statement that determines whether the PaymentDate column of the Invoices table has any invalid values.
 To be valid, PaymentDate must be a null value if there’s a balance due and a non-null value if there’s no balance due. 
Code a compound condition in the WHERE clause that tests for these conditions.
*/

