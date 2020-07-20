-- 1. Get all customers and their addresses
SELECT "first_name", "last_name", "street", "city", "state", "zip" 
	FROM "customers" 
		JOIN "addresses" 
		ON "customers"."id" = "addresses"."customer_id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT "order_id", "quantity", "description" 
	FROM "orders" 
		JOIN "line_items" 
		ON "line_items"."order_id" = "orders"."id" 
			JOIN "products" 
			ON "line_items"."product_id" = "products"."id";
				 

-- 3. Which warehouses have cheetos?
SELECT "warehouse"."warehouse" 
	FROM "warehouse" 
		JOIN "warehouse_product" 
			ON "warehouse"."id" = "warehouse_product"."warehouse_id" JOIN "products" ON "warehouse_product"."product_id" = "products"."id" WHERE "description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse" 
	FROM "warehouse" 
		JOIN "warehouse_product" 
		ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
			JOIN "products" 
			ON "warehouse_product"."product_id" = "products"."id" 
				WHERE "description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name", "last_name", count("orders") AS "number_of_orders" 
	FROM "customers" 
		JOIN "orders" 
		ON "customers"."id" = "orders"."address_id" 
			GROUP BY "customers"."id";

-- 6. How many customers do we have?
SELECT COUNT(*) FROM "customers";
