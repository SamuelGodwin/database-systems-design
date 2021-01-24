-- Part 2.5 delete.sql
--
-- Submitted by: Coursework Solution
-- 
-- add your DELETE statements here

-- Top Selling Customer is George Clooney,
-- need to Clean up DB from "clooney@hollywood.com":

-- Contains_Drink
DELETE FROM Contains_Drink
WHERE Contains_Drink.order_no IN (
	-- Orders for "clooney@hollywood.com"
	SELECT order_no 
	FROM FoodTruckOrder
	WHERE FoodTruckOrder.burrito_club_no = (SELECT burrito_club_no 
	                   	                    FROM Customer 
	                   	                    WHERE email="clooney@hollywood.com")
);

-- Contains_Topping
DELETE FROM Contains_Topping
WHERE Contains_Topping.order_no IN (
	-- Orders for "clooney@hollywood.com"
	SELECT order_no 
	FROM FoodTruckOrder
	WHERE FoodTruckOrder.burrito_club_no = (SELECT burrito_club_no 
	                   	                    FROM Customer 
	                   	                    WHERE email="clooney@hollywood.com")
);

-- Contains_Burrito
DELETE FROM Contains_Burrito
WHERE Contains_Burrito.order_no IN (
	-- Orders for "clooney@hollywood.com"
	SELECT order_no 
	FROM FoodTruckOrder
	WHERE FoodTruckOrder.burrito_club_no = (SELECT burrito_club_no 
	                   	                    FROM Customer 
	                   	                    WHERE email="clooney@hollywood.com")
);


--   FoodTruckOrder
DELETE FROM FoodTruckOrder
WHERE FoodTruckOrder.burrito_club_no = (SELECT burrito_club_no 
	                   	                FROM Customer 
	                   	                WHERE email="clooney@hollywood.com");

--  Customer 
-- (If FOREIGN KEYs have ON DELETE CASCADE correctly
--  then only requires the statement below)
DELETE FROM Customer WHERE email="clooney@hollywood.com";

