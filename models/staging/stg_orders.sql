select 
--from orders 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
--from customer
c.customerid,
c.customername,
c.segment,
c.country,
--from product
p.productid,
p.category,
p.productname,
p.subcategory 
from {{ ref('raw_orders') }} as o 
left join {{ ref('raw_customer') }} as c 
on o.customerid = c.customerid 
left join {{ ref('raw_product') }} as p 
on o.productid = p.productid
