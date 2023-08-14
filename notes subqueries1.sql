select *
from vendors
where vendorid in
(select vendorid
from vendors
where defaultaccountno between 400 and 499)