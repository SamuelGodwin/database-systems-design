-- Part 2.4 update.sql
--
-- Submitted by: Coursework Solution
-- 
-- add your INSERT/UPDATE statements here


-- Identify who placed the most recent order according to date_placed
-- and order no ...
SELECT burrito_club_no 
FROM FoodTruckOrder 
WHERE burrito_club_no IS NOT NULL 
ORDER BY date_placed DESC, order_no DESC;

-- +-----------------+
-- | burrito_club_no |
-- +-----------------+
-- |               3 |
-- |               1 |
-- |               3 |
-- |               2 |
-- |               2 |
-- |               3 |
-- |               1 |
-- |               2 |
-- |               1 |
-- +-----------------+


-- Using burrito_club_no = 3 as customer

SELECT burrito_club_no, COUNT(*) AS Number_of_Burritos
FROM Contains_Burrito NATURAL JOIN FoodTruckOrder 
WHERE burrito_club_no = 3;

-- +-----------------+--------------------+
-- | burrito_club_no | Number_of_Burritos |
-- +-----------------+--------------------+
-- |               3 |                  3 |
-- +-----------------+--------------------+

-- Part 1. Add enough burritos to go over 10 burritos:
-- (Create an Order Number 14 for 8 burritos (7 paid, and 1 free))
INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (14, 3, "FT456DEF", "EC1R 4QL", "2017-06-03");
-- Burrito 1 
INSERT INTO Contains_Burrito VALUES (14, 1, 1);
INSERT INTO Contains_Topping VALUES (14, 1, 1);
INSERT INTO Contains_Topping VALUES (14, 1, 2);
INSERT INTO Contains_Topping VALUES (14, 1, 3);
-- Burrito 2
INSERT INTO Contains_Burrito VALUES (14, 2, 2);
-- Burrito 3 
INSERT INTO Contains_Burrito VALUES (14, 3, 3);
INSERT INTO Contains_Topping VALUES (14, 3, 2);
-- Burrito 4 
INSERT INTO Contains_Burrito VALUES (14, 4, 4);
INSERT INTO Contains_Topping VALUES (14, 4, 5);
-- Burrito 5 
INSERT INTO Contains_Burrito VALUES (14, 5, 5);
INSERT INTO Contains_Topping VALUES (14, 5, 1);
INSERT INTO Contains_Topping VALUES (14, 5, 5);
-- Burrito 6 
INSERT INTO Contains_Burrito VALUES (14, 6, 6);
INSERT INTO Contains_Topping VALUES (14, 6, 2);
-- Burrito 7 
INSERT INTO Contains_Burrito VALUES (14, 7, 7);
INSERT INTO Contains_Topping VALUES (14, 7, 3);
-- Burrito 8 (FREE) 
INSERT INTO Contains_Burrito VALUES (14, 8, 14);
INSERT INTO Contains_Topping VALUES (14, 8, 1);
INSERT INTO Contains_Topping VALUES (14, 8, 2);
INSERT INTO Contains_Topping VALUES (14, 8, 3);
INSERT INTO Contains_Topping VALUES (14, 8, 4);
INSERT INTO Contains_Topping VALUES (14, 8, 5);


-- Part 2. Update the Number of Burritos

-- This is unnecessary, because it is a derived attribute
-- and the Number of Burritos is retrieval via the "BurritoClub" VIEW

SELECT * FROM BurritoClub WHERE burrito_club_no = 3;

-- +-----------------+------------------+
-- | burrito_club_no | NumberOfBurritos |
-- +-----------------+------------------+
-- |               3 |               11 |
-- +-----------------+------------------+


-- Part 3. Calculate the final order price for Order 14
-- (Taking into account the free burrito)

SELECT order_no, SUM(price) as total_cost
FROM ( (SELECT order_no, price
         FROM Contains_Burrito NATURAL JOIN Burrito
         WHERE order_no = 14 AND burrito_no != 8) -- omits the 1 FREE BURRITO
        UNION
        (SELECT order_no, price
         FROM Contains_Topping NATURAL JOIN Topping 
         WHERE order_no = 14 AND burrito_no != 8) -- omits the 1 FREE BURRITO
        UNION
        (SELECT order_no, (price * quantity) as price
         FROM Contains_Drink NATURAL JOIN Drink) ) as A;

-- +----------+------------+
-- | order_no | total_cost |
-- +----------+------------+
-- |       14 |      54.46 |
-- +----------+------------+

-- Part 4. Update Order 14 with the final total_cost

UPDATE FoodTruckOrder
SET FoodTruckOrder.total_cost = (SELECT SUM(price) as total_cost
                                 FROM ( (SELECT order_no, price
                                         FROM Contains_Burrito NATURAL JOIN Burrito
                                         WHERE order_no = 14 AND burrito_no != 8) -- omits the 1 FREE BURRITO
                                        UNION
                                        (SELECT order_no, price
                                         FROM Contains_Topping NATURAL JOIN Topping 
                                         WHERE order_no = 14 AND burrito_no != 8) -- omits the 1 FREE BURRITO
                                        UNION
                                        (SELECT order_no, (price * quantity) as price
                                         FROM Contains_Drink NATURAL JOIN Drink) ) as A)
WHERE FoodTruckOrder.order_no = 14;


-- Updated FoodTruckOrder
-- +----------+-------------+-----------------+---------------+------------------+------------+
-- | order_no | date_placed | burrito_club_no | food_truck_id | market_post_code | total_cost |
-- +----------+-------------+-----------------+---------------+------------------+------------+
-- |       14 | 2017-06-03  |               3 | FT456DEF      | EC1R 4QL         |      54.46 |
-- +----------+-------------+-----------------+---------------+------------------+------------+
