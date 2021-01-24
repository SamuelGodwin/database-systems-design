-- Part 2.3 select.sql
--
-- Submitted by: Coursework Solution
-- 
-- add your SELECT statements here for each section

-- 1. Total Sales (for May 2017)

SELECT SUM(total_cost) AS total_sales
FROM FoodTruckOrder 
WHERE date_placed >= "2017-05-01" 
 AND date_placed < "2017-05-31";

-- Result should be returned as a SCALAR 
--  (single row and single column)
-- +-------------+
-- | total_sales |
-- +-------------+
-- |       38.45 |
-- +-------------+

-- 2. Burrito Report 

-- Using a LEFT JOIN to join ALL of the burrios and June 2017 orders
-- Grouping by Filling Type and Size (aggregating Bean Type)
-- Summing quantity.
SELECT filling, size, sum(quantity) as quantity
FROM ( SELECT filling, size, IF(quantity IS NULL, 0, quantity) as quantity
       FROM Burrito LEFT JOIN (
          SELECT burrito_id, COUNT(*) AS quantity  
          FROM FoodTruckOrder NATURAL JOIN Contains_Burrito 
          WHERE date_placed >= "2017-06-01" 
            AND date_placed <  "2017-07-01" 
          GROUP BY burrito_id
       ) AS B ON (Burrito.burrito_id = B.burrito_id) ) as A
GROUP BY filling, size;

-- +---------+---------+----------+
-- | filling | size    | quantity |
-- +---------+---------+----------+
-- | beef    | Grande  |        1 |
-- | beef    | Mini    |        1 |
-- | beef    | Regular |        0 |
-- | chicken | Grande  |        1 |
-- | chicken | Mini    |        2 |
-- | chicken | Regular |        1 |
-- | veggie  | Grande  |        1 |
-- | veggie  | Mini    |        2 |
-- | veggie  | Regular |        1 |
-- +---------+---------+----------+


-- 3. Top Customers

-- interpret "total purchases" a frequency of orders
SELECT name, email, COUNT(*) AS purchases
FROM Customer NATURAL JOIN FoodTruckOrder 
GROUP BY burrito_club_no
ORDER BY purchases DESC;

-- +----------------+-----------------------+-----------+
-- | name           | email                 | purchases |
-- +----------------+-----------------------+-----------+
-- | George Clooney | clooney@hollywood.com |         3 |
-- | Rihanna        | rhianna@facebook.com  |         3 |
-- | Drake          | bling@hotline.com     |         3 |
-- +----------------+-----------------------+-----------+

-- or, if interpret sorting by sum of purchases
SELECT name, email, SUM(total_cost) AS purchases
FROM Customer NATURAL JOIN FoodTruckOrder 
GROUP BY burrito_club_no
ORDER BY purchases DESC;

-- +----------------+-----------------------+-----------+
-- | name           | email                 | purchases |
-- +----------------+-----------------------+-----------+
-- | George Clooney | clooney@hollywood.com |     36.03 |
-- | Rihanna        | rhianna@facebook.com  |     32.51 |
-- | Drake          | bling@hotline.com     |     14.63 |
-- +----------------+-----------------------+-----------+


-- 4. Guacamole Receipt

-- Choose an order number that includes Gucamole (topping_id = 5) and a drink

SELECT * FROM (SELECT order_no FROM Contains_Topping where topping_id = 5) as T 
 NATURAL JOIN (SELECT order_no FROM Contains_Drink) as D;

-- Most of the Orders fit this criteria:
-- +----------+
-- | order_no |
-- +----------+
-- |        1 |
-- |        9 |
-- |        2 |
-- |        2 |
-- |        2 |
-- |        7 |
-- |       12 |
-- |        3 |
-- |        4 |
-- |        4 |
-- |       11 |
-- +----------+

-- using order_no: 1
(SELECT description, price
 FROM (
   ( 
      SELECT burrito_no, price, CONCAT("Burrito ", burrito_no, ": ", description, " with ", filling, " filling") as description
      FROM Burrito NATURAL JOIN Contains_Burrito 
      WHERE order_no = 1
   ) UNION (
      SELECT burrito_no, price, CONCAT("      with ", description, " topping") as description
      FROM Topping NATURAL JOIN Contains_Topping 
      WHERE order_no = 1
   ) 
 ) as B
 ORDER BY burrito_no, description DESC
) UNION (
    SELECT CONCAT("Drink: ", description, " (", size_ml, "ml) x ", quantity), (price * quantity) AS price 
    FROM Drink NATURAL JOIN Contains_Drink
    WHERE order_no = 1
);

-- +---------------------------------------------------------+-------+
-- | description                                             | price |
-- +---------------------------------------------------------+-------+
-- | Burrito 2: Grande Veggie (Red Bean) with veggie filling |  6.66 |
-- | Burrito 1: Regular Moo (Red Bean) with beef filling     |  3.33 |
-- | Burrito 3: Grande Moo (Red Bean) with beef filling      |  6.66 |
-- |       with Tomato topping                               |  0.00 |
-- |       with Mild Salsa topping                           |  0.00 |
-- |       with Hot Salsa topping                            |  0.00 |
-- |       with Guacamole topping                            |  0.75 |
-- | Drink: Cola (330ml) x 1                                 |  1.00 |
-- +---------------------------------------------------------+-------+

-- 5. Alchohol free!

-- Designate Whitecross Street Market ("EC1Y") as Alchohol free:



-- Note: MySQL does not support ASSERTIONS
-- CREATE ASSERTION CHECK ( ...
SELECT NOT EXISTS (
  SELECT * 
  FROM (FoodTruckOrder NATURAL JOIN 
        Contains_Drink) NATURAL JOIN Drink
  WHERE Drink.alcoholic = True 
   AND FoodTruckOrder.market_post_code = "EC1Y"
) AS Alchohol_free;

-- Should be True (1)
-- +---------------+
-- | Alchohol_free |
-- +---------------+
-- |             1 |
-- +---------------+

-- Place a Nutty Order - an anonymous person buys an American Beer

INSERT INTO FoodTruckOrder(order_no, burrito_club_no, food_truck_id, market_post_code, date_placed) 
VALUES (13, NULL, "FT123ABC", "EC1Y", "2017-05-29");
-- An American Beer
INSERT INTO Contains_Drink VALUES (13, 4, 1);


-- Test (same query as before)
-- SELECT NOT EXISTS (
SELECT NOT EXISTS (
  SELECT * 
  FROM (FoodTruckOrder NATURAL JOIN 
        Contains_Drink) NATURAL JOIN Drink
  WHERE Drink.alcoholic = True 
   AND FoodTruckOrder.market_post_code = "EC1Y"
) AS Alchohol_free;

-- Should be False (0)
-- +---------------+
-- | Alchohol_free |
-- +---------------+
-- |             0 |
-- +---------------+
