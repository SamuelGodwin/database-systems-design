-- add your INSERT statements here

-- create 3 Markets
INSERT INTO Market VALUES 
  ("EC1R 4QL", "Exmouth Market", "Clerkenwell", "RF");
INSERT INTO Market VALUES 
  ("EC1Y", "Whitecross Street", "Shoreditch", "MTWRF");
INSERT INTO Market VALUES 
  ("E8 2NP", "Ridley Road", "Dalston", "MTWRFS");

-- create 2 Food Trucks
INSERT INTO FoodTruck VALUES ("FT123ABC", "2017-01-01");
INSERT INTO FoodTruck VALUES ("FT456DEF", "2017-02-01");

-- Schedule Food Trucks to Appear at Markets
-- "2017-05-29" -- Monday
INSERT INTO Appears VALUES ("FT123ABC", "EC1Y", "2017-05-29");
INSERT INTO Appears VALUES ("FT456DEF", "E8 2NP", "2017-05-29");
-- "2017-05-30" -- Tuesday
INSERT INTO Appears VALUES ("FT123ABC", "EC1Y", "2017-05-30");
INSERT INTO Appears VALUES ("FT456DEF", "E8 2NP", "2017-05-30");
-- "2017-05-31" -- Wednesday
INSERT INTO Appears VALUES ("FT123ABC", "EC1Y", "2017-05-31");
INSERT INTO Appears VALUES ("FT456DEF", "E8 2NP", "2017-05-31");
-- "2017-06-01" -- Thursday
INSERT INTO Appears VALUES ("FT123ABC", "EC1Y", "2017-06-01");
INSERT INTO Appears VALUES ("FT456DEF", "EC1R 4QL", "2017-06-01");
-- "2017-06-02" -- Friday
INSERT INTO Appears VALUES ("FT123ABC", "EC1Y", "2017-06-02");
INSERT INTO Appears VALUES ("FT456DEF", "EC1R 4QL", "2017-06-02");
-- "2017-06-03" -- Saturday
INSERT INTO Appears VALUES ("FT456DEF", "EC1R 4QL", "2017-06-03");

-- create some Customers
INSERT INTO Customer VALUES ("clooney@hollywood.com", "George Clooney", "1961-05-06", "8817 Lookout Mountain Ave., Los Angelos CA", 1);
INSERT INTO Customer VALUES ("rhianna@facebook.com", "Rihanna", "1988-02-20", "932 Rivas Canyon Road, Pacific Palisades CA", 2);
INSERT INTO Customer VALUES ("bling@hotline.com", "Drake", "1986-10-24", "5841 Round Meadow Rd, Hidden Hills, CA", 3);

-- create some Burritos
INSERT INTO Burrito VALUES (1, 2.22, "Mini Veggie (Red Bean)", "Mini", "red", "veggie");
INSERT INTO Burrito VALUES (2, 2.22, "Mini Veggie (Black Bean)", "Mini", "black", "veggie");
INSERT INTO Burrito VALUES (3, 3.33, "Regular Veggie (Red Bean)", "Regular", "red", "veggie");
INSERT INTO Burrito VALUES (4, 3.33, "Regular Veggie (Black Bean)", "Regular", "black", "veggie");
INSERT INTO Burrito VALUES (5, 6.66, "Grande Veggie (Red Bean)", "Grande", "red", "veggie");
INSERT INTO Burrito VALUES (6, 6.66, "Grande Veggie (Black Bean)", "Grande", "black", "veggie");

INSERT INTO Burrito VALUES (7, 2.22, "Mini Clucky (Red Bean)", "Mini", "red", "chicken");
INSERT INTO Burrito VALUES (8, 2.22, "Mini Clucky (Black Bean)", "Mini", "black", "chicken");
INSERT INTO Burrito VALUES (9, 3.33, "Regular Clucky (Red Bean)", "Regular", "red", "chicken");
INSERT INTO Burrito VALUES (10, 3.33, "Regular Clucky (Black Bean)", "Regular", "black", "chicken");
INSERT INTO Burrito VALUES (11, 6.66, "Grande Clucky (Red Bean)", "Grande", "red", "chicken");
INSERT INTO Burrito VALUES (12, 6.66, "Grande Clucky (Black Bean)", "Grande", "black", "chicken");

INSERT INTO Burrito VALUES (13, 2.22, "Mini Moo (Red Bean)", "Mini", "red", "beef");
INSERT INTO Burrito VALUES (14, 2.22, "Mini Moo (Black Bean)", "Mini", "black", "beef");
INSERT INTO Burrito VALUES (15, 3.33, "Regular Moo (Red Bean)", "Regular", "red", "beef");
INSERT INTO Burrito VALUES (16, 3.33, "Regular Moo (Black Bean)", "Regular", "black", "beef");
INSERT INTO Burrito VALUES (17, 6.66, "Grande Moo (Red Bean)", "Grande", "red", "beef");
INSERT INTO Burrito VALUES (18, 6.66, "Grande Moo (Black Bean)", "Grande", "black", "beef");

-- create Toppings
INSERT INTO Topping VALUES (1, 0.00, "Lettuce");
INSERT INTO Topping VALUES (2, 0.00, "Tomato");
INSERT INTO Topping VALUES (3, 0.00, "Mild Salsa");
INSERT INTO Topping VALUES (4, 0.00, "Hot Salsa");
INSERT INTO Topping VALUES (5, 0.75, "Guacamole");

-- create some Drinks
INSERT INTO Drink VALUES (1, 1.00, "Cola", 330, False);
INSERT INTO Drink VALUES (2, 2.50, "Lemonade", 500, False);
INSERT INTO Drink VALUES (3, 3.00, "Pint of Bitter", 568, True);
INSERT INTO Drink VALUES (4, 5.00, "American Beer", 473, True);

--
-- Order some Burritos
--

-- 3 orders for Customer 1 (Clooney)
INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (1, 1, "FT123ABC", "EC1Y", "2017-05-29");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (1, 1, 15);
INSERT INTO Contains_Topping VALUES (1, 1, 5);
-- Burrito 2
INSERT INTO Contains_Burrito VALUES (1, 2, 5);
INSERT INTO Contains_Topping VALUES (1, 2, 4);
-- Burrito 3
INSERT INTO Contains_Burrito VALUES (1, 3, 17);
INSERT INTO Contains_Topping VALUES (1, 3, 2);
INSERT INTO Contains_Topping VALUES (1, 3, 3);
-- Drink
INSERT INTO Contains_Drink VALUES (1, 1, 1);


INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (2, 1, "FT123ABC", "EC1Y", "2017-05-31");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (2, 1, 2);
INSERT INTO Contains_Topping VALUES (2, 1, 5);
-- Burrito 2 
INSERT INTO Contains_Burrito VALUES (2, 2, 3);
INSERT INTO Contains_Topping VALUES (2, 2, 2);
INSERT INTO Contains_Topping VALUES (2, 2, 3);
INSERT INTO Contains_Topping VALUES (2, 2, 4);
INSERT INTO Contains_Topping VALUES (2, 2, 5);
-- Burrito 3
INSERT INTO Contains_Burrito VALUES (2, 3, 4);
INSERT INTO Contains_Topping VALUES (2, 3, 3);
INSERT INTO Contains_Topping VALUES (2, 3, 4);
-- Burrito 4
INSERT INTO Contains_Burrito VALUES (2, 4, 15);
INSERT INTO Contains_Topping VALUES (2, 4, 1);
INSERT INTO Contains_Topping VALUES (2, 4, 2);
INSERT INTO Contains_Topping VALUES (2, 4, 3);
-- Burrito 5 
INSERT INTO Contains_Burrito VALUES (2, 5, 2);
INSERT INTO Contains_Topping VALUES (2, 5, 1);
INSERT INTO Contains_Topping VALUES (2, 5, 2);
INSERT INTO Contains_Topping VALUES (2, 5, 3);
INSERT INTO Contains_Topping VALUES (2, 5, 4);
INSERT INTO Contains_Topping VALUES (2, 5, 5);
-- Drink
INSERT INTO Contains_Drink VALUES (2, 2, 2);


INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (3, 1, "FT456DEF", "EC1R 4QL", "2017-06-03");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (3, 1, 6);
INSERT INTO Contains_Topping VALUES (3, 1, 4);
-- Burrito 2
INSERT INTO Contains_Burrito VALUES (3, 2, 3);
INSERT INTO Contains_Topping VALUES (3, 2, 2);
INSERT INTO Contains_Topping VALUES (3, 2, 3);
-- Burrito 3 (11th Burrito - should be *FREE*)
INSERT INTO Contains_Burrito VALUES (3, 3, 13);
INSERT INTO Contains_Topping VALUES (3, 3, 3);
INSERT INTO Contains_Topping VALUES (3, 3, 4);
INSERT INTO Contains_Topping VALUES (3, 3, 5);
-- Drink
INSERT INTO Contains_Drink VALUES (3, 3, 1);


-- 3 orders for Customer 2 (Rihanna)
INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (4, 2, "FT456DEF", "E8 2NP", "2017-05-29");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (4, 1, 14);
INSERT INTO Contains_Topping VALUES (4, 1, 1);
INSERT INTO Contains_Topping VALUES (4, 1, 5);
-- Burrito 2
INSERT INTO Contains_Burrito VALUES (4, 2, 12);
INSERT INTO Contains_Topping VALUES (4, 2, 1);
INSERT INTO Contains_Topping VALUES (4, 2, 2);
INSERT INTO Contains_Topping VALUES (4, 2, 3);
INSERT INTO Contains_Topping VALUES (4, 2, 4);
-- Drink
INSERT INTO Contains_Drink VALUES (4, 4, 2);
INSERT INTO Contains_Drink VALUES (4, 3, 1);


INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (5, 2, "FT456DEF", "EC1R 4QL", "2017-06-01");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (5, 1, 11);
INSERT INTO Contains_Topping VALUES (5, 1, 1);
INSERT INTO Contains_Topping VALUES (5, 1, 2);
INSERT INTO Contains_Topping VALUES (5, 1, 3);


INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (6, 2, "FT456DEF", "EC1R 4QL", "2017-06-02");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (6, 1, 7);
-- Burrito 2
INSERT INTO Contains_Burrito VALUES (6, 2, 1);
INSERT INTO Contains_Topping VALUES (6, 2, 3);
-- Drink
INSERT INTO Contains_Drink VALUES (6, 1, 1);

-- 3 orders for Customer 3 (Drake)
INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (7, 3, "FT123ABC", "EC1Y", "2017-05-31");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (7, 1, 9);
INSERT INTO Contains_Topping VALUES (7, 1, 2);
INSERT INTO Contains_Topping VALUES (7, 1, 5);
-- Drink
INSERT INTO Contains_Drink VALUES (7, 2, 1);


INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (8, 3, "FT123ABC", "EC1Y", "2017-06-02");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (8, 1, 10);
INSERT INTO Contains_Topping VALUES (8, 1, 1);
INSERT INTO Contains_Topping VALUES (8, 1, 2);
INSERT INTO Contains_Topping VALUES (8, 1, 3);
INSERT INTO Contains_Topping VALUES (8, 1, 4);
INSERT INTO Contains_Topping VALUES (8, 1, 5);


INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (9, 3, "FT456DEF", "EC1R 4QL", "2017-06-03");
-- Burrito 1VALUES 
INSERT INTO Contains_Burrito VALUES (9, 1, 8);
INSERT INTO Contains_Topping VALUES (9, 1, 2);
INSERT INTO Contains_Topping VALUES (9, 1, 3);
INSERT INTO Contains_Topping VALUES (9, 1, 5);
-- Drink
INSERT INTO Contains_Drink VALUES (9, 1, 1);


-- 3 anonymous Customers
INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (10, NULL, "FT123ABC", "EC1Y", "2017-05-29");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (10, 1, 16);
INSERT INTO Contains_Topping VALUES (10, 1, 4);
INSERT INTO Contains_Topping VALUES (10, 1, 5);


INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (11, NULL, "FT456DEF", "E8 2NP", "2017-05-31");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (11, 1, 17);
INSERT INTO Contains_Topping VALUES (11, 1, 1);
INSERT INTO Contains_Topping VALUES (11, 1, 3);
INSERT INTO Contains_Topping VALUES (11, 1, 4);
INSERT INTO Contains_Topping VALUES (11, 1, 5);
-- Drink
INSERT INTO Contains_Drink VALUES (11, 4, 1);


INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (12, NULL, "FT456DEF", "EC1R 4QL", "2017-06-02");
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (12, 1, 18);
INSERT INTO Contains_Topping VALUES (12, 1, 1);
INSERT INTO Contains_Topping VALUES (12, 1, 2);
-- Burrito 1
INSERT INTO Contains_Burrito VALUES (12, 2, 1);
INSERT INTO Contains_Topping VALUES (12, 2, 1);
INSERT INTO Contains_Topping VALUES (12, 2, 3);
INSERT INTO Contains_Topping VALUES (12, 2, 5);
-- Drink
INSERT INTO Contains_Drink VALUES (12, 2, 2);

-- Calculate the total cost for each Order
UPDATE FoodTruckOrder, 
(SELECT order_no, SUM(price) as total_cost
 FROM ( (SELECT order_no, price
         FROM Contains_Burrito NATURAL JOIN Burrito
         WHERE NOT(order_no = 3 AND burrito_no = 3)) -- omits the 1 FREE BURRITO
        UNION
        (SELECT order_no, price
         FROM Contains_Topping NATURAL JOIN Topping 
         WHERE NOT(order_no = 3 AND burrito_no = 3)) -- omits the 1 FREE BURRITO
        UNION
        (SELECT order_no, (price * quantity) as price
         FROM Contains_Drink NATURAL JOIN Drink) ) as A
 GROUP BY order_no) as T
SET FoodTruckOrder.total_cost = T.total_cost
WHERE FoodTruckOrder.order_no = T.order_no;
