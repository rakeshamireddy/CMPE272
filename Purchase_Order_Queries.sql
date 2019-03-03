-- Purchase Order information on a particular Day

SELECT p.order_id,
       i.name product_name,
       p.quantity,
       p.order_date,
       p.total_amount,
       c.name customer_name,
       c.address,
       c.phoneno,
       s.name supplier_name,
       s.address,
       s.phoneno
 FROM purchaseorder p,
      customer c,
      supplier s,
      items i
 WHERE 1=1
   AND c.custid = p.cust_id
   AND s.supplierid = p.supplier_id
   AND i.product_id = p.productid 
   AND TRUNC(p.order_date) = TRUNC(sysdate)  
 
 -- Purchase Order Information for a specific Customer
 SELECT p.order_id,
       i.name product_name,
       p.quantity,
       p.order_date,
       p.total_amount,
       c.name customer_name,
       c.address,
       c.phoneno,
       s.name supplier_name,
       s.address,
       s.phoneno
 FROM purchaseorder p,
      customer c,
      supplier s,
      items i
 WHERE 1=1
   AND c.custid = p.cust_id
   AND s.supplierid = p.supplier_id
   AND i.product_id = p.productid 
   AND c.name = 'Customer Name'
   
  
 -- Purchase Order Information for a specific Supplier
 SELECT p.order_id,
       i.name product_name,
       p.quantity,
       p.order_date,
       p.total_amount,
       c.name customer_name,
       c.address,
       c.phoneno,
       s.name supplier_name,
       s.address,
       s.phoneno
 FROM purchaseorder p,
      customer c,
      supplier s,
      items i
 WHERE 1=1
   AND c.custid = p.cust_id
   AND s.supplierid = p.supplier_id
   AND i.product_id = p.productid 
   AND s.name = 'Supplier Name'  
   
   
    -- Purchase Order Information for a specific Item
 SELECT p.order_id,
       i.name product_name,
       p.quantity,
       p.order_date,
       p.total_amount,
       c.name customer_name,
       c.address,
       c.phoneno,
       s.name supplier_name,
       s.address,
       s.phoneno
 FROM purchaseorder p,
      customer c,
      supplier s,
      items i
 WHERE 1=1
   AND c.custid = p.cust_id
   AND s.supplierid = p.supplier_id
   AND i.product_id = p.productid 
   AND i.name = 'Item Name'
   
   
 -- Check ON DELETE Cascade. It should delete all the Purchase Orders related to this customer in PurchaseOrder table as well.
 
 DELETE FROM  customer c WHERE c.name = 'Customer Name'
 
    
 -- Check ON DELETE Cascade. It should delete all the Purchase Orders related to this  supplier in PurchaseOrder table as well.
 
 DELETE FROM  supplier s WHERE s.name = 'Supplier Name'
 
 
    
-- Check ON DELETE Cascade. It should delete all the Purchase Orders related to this items in PurchaseOrder table as well.
 
 DELETE FROM  items  i WHERE i.name = 'Item  Name'
 
 
 -- ORDER BY purchase orders with recent date on top
 
 SELECT * FROM purchaseorder ORDER BY orderdate DESC
 
 -- GROUP BY Purchase Orders for each supplier and Grand total for Supplier
 
SELECT p.order_id,
       p.quantity,
       p.order_date,
       s.name supplier_name
       SUM (p.total_amount) Order_Total_Supplier
 FROM purchaseorder p,
      supplier s
 WHERE 1=1
   AND s.supplierid = p.supplier_id
 GROUP BY s.name 
 
