-- Supply Chain Dataset
Create database Supply_chain;
use Supply_chain;

SHOW TABLES;
SELECT 
    *
FROM
    customer_master
WHERE
    customer_id IS NOT NULL;
DESCRIBE customer_master;
DESCRIBE product_master;
DESCRIBE sales_orders;
DESCRIBE supplier_master;
DESCRIBE procurement_orders;
SELECT 
    *
FROM
    customer_master
LIMIT 10;
SELECT 
    *
FROM
    product_master
LIMIT 10;
SELECT 
    *
FROM
    sales_orders
LIMIT 10;
SELECT 
    *
FROM
    supplier_master
LIMIT 10;
SELECT 
    *
FROM
    procurement_orders
LIMIT 10;
SELECT 
    Order_ID, COUNT(*)
FROM
    sales_orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;

SELECT *
FROM sales_orders
WHERE Customer_ID IS NULL;
SELECT *
FROM sales_orders
WHERE Profit_Per_Order < 0;

select c.Customer_Name, s.Order_Total from sales_orders s
inner join customer_master c on s.Customer_ID = c.Customer_ID;
select p.Product_Name,s.Order_Total, s.Profit_Per_Order 
from sales_orders s inner join product_master p 
on s.Product_ID=p.Product_ID;

select p.Category, Sum(s.Order_Total) Revenue from sales_orders s join product_master p on s.Product_ID=p.Product_ID 
group by p.Category order by Revenue Desc;
