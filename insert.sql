-- Market
INSERT INTO MARKET VALUES 
('Borough Market','SE1 1TL');
('Spitalfields Market','E1 6EA');
('Camden Market','NW1 8AL');

-- Food Truck
INSERT INTO FOOD_TRUCK VALUES 
('AB12ABC',0,01/02/2015,'SE1 1TL');
('BC34XYZ',0,06/06/2016,'NW1 8A1');

-- Customer
INSERT INTO CUSTOMER VALUES 
('Albert','Einstein',14/03/1978,1,'Science Street','SE1 4QY''Albi33@mail.co.uk','No',0);
('Martin','Chapman',03/04/86,2,'Great Dover Street','SE1 4XA','Martin@mail.co.uk','No',0);
('Brian','Cox',05/06/1968,3,'Physics Street','E1 4QB','Br1an6@mail.co.uk','Yes',0);

-- Market_Days_Active
INSERT INTO MARKET_DAYS_ACTIVE VALUES 
('SE1 1TL',28/05/2017),
('SE1 1TL',29/05/2017),
('SE1 1TL',30/05/2017),
('SE1 1TL',31/05/2017),
('SE1 1TL',01/06/2017),
('SE1 1TL',02/06/2017),
('SE1 1TL',03/06/2017),
('E1 6EA',28/05/2017),
('E1 6EA',29/05/2017),
('E1 6EA',30/05/2017),
('E1 6EA',31/05/2017),
('E1 6EA',01/06/2017),
('E1 6EA',02/06/2017),
('E1 6EA',03/06/2017),
('NW1 8AL',28/05/2017),
('NW1 8AL',29/05/2017),
('NW1 8AL',30/05/2017),
('NW1 8AL',31/05/2017),
('NW1 8AL',01/06/2017),
('NW1 8AL',02/06/2017),
('NW1 8AL',03/06/2017);

-- Menu
-- The whole menu is implemented into the burrito table for selection to orders***
INSERT INTO BURRITO (FILLING, BEAN, BUR_SIZE, DESCRIPTION, BUR_PRICE) VALUES 
('Mini', 'Red', 'Grilled chicken', 'Mini red bean & chicken burrito', 1.25),
('Mini', 'Black', 'Grilled chicken', 'Mini black bean & chicken burrito', 1.25),
('Mini', 'Red', 'Pulled pork', 'Mini red bean & pork burrito', 1.25),
('Mini', 'Black', 'Pulled pork', 'Mini black bean & pork burrito', 1.25),
('Mini', 'Red', 'Spicy beef', 'Mini red bean & beef burrito', 1.50),
('Mini', 'Black', 'Spicy beef', 'Mini black bean & beef burrito', 1.50),
('Mini', 'Red', 'Vegetarian', 'Mini red bean & veggie burrito', 1.25),
('Mini', 'Black', 'Vegetarian', 'Mini black bean & veggie burrito', 1.25),

('Regular', 'Red', 'Grilled chicken', 'Regular red bean & chicken burrito', 1.50),
('Regular', 'Black', 'Grilled chicken', 'Regular black bean & chicken burrito', 1.50),
('Regular', 'Red', 'Pulled pork', 'Regular red bean & pork burrito', 2.00),
('Regular', 'Black', 'Pulled pork', 'Regular black bean & pork burrito', 1.50),
('Regular', 'Red', 'Spicy beef', 'Regular red bean & beef burrito', 2.50),
('Regular', 'Black', 'Spicy beef', 'Regular black bean & beef burrito', 2.00),
('Regular', 'Red', 'Vegetarian', 'Regular red bean & veggie burrito', 1.50),
('Regular', 'Black', 'Vegetarian', 'Regular black bean & veggie burrito', 1.50),

('Grande', 'Red', 'Grilled chicken', 'Grande red bean & chicken burrito', 1.75),
('Grande', 'Black', 'Grilled chicken', 'Grande black bean & chicken burrito', 1.75),
('Grande', 'Red', 'Pulled pork', 'Grande red bean & pork burrito', 1.75),
('Grande', 'Black', 'Pulled pork', 'Grande black bean & pork burrito', 1.75),
('Grande', 'Red', 'Spicy beef', 'Grande red bean & beef burrito', 2.50),
('Grande', 'Black', 'Spicy beef', 'Grande black bean & beef burrito', 3.00),
('Grande', 'Red', 'Vegetarian', 'Grande red bean & veggie burrito', 1.75),
('Grande', 'Black', 'Vegetarian', 'Grande black bean & veggie burrito', 1.75);
	
-- Beverages
-- The whole beverage menu is implemented into beverages table for selection to orders
INSERT INTO BEVERAGE VALUES
(200, 'Beer', 250, 'yes', 'Small beer, alcoholic', 3.40),
(201, 'Beer', 400, 'yes', 'Small beer, alcoholic', 3.60),
(202, 'Beer', 500, 'yes', 'Small beer, alcoholic', 3.80),
(203, 'Water', 250, 'no', 'Small water, non-alcoholic', 0.80),
(204, 'Water', 400, 'no', 'Small water, non-alcoholic', 1.00),
(205, 'Water', 500, 'no', 'Small water, non-alcoholic', 1.20),
(206, 'Cider', 250, 'yes', 'Small cider, alcoholic', 1.60),
(207, 'Cider', 400, 'yes', 'Small cider, alcoholic', 1.80),
(208, 'Cider', 500, 'yes', 'Small cider, alcoholic', 2.00),
(209, 'Wine', 250, 'yes', 'Small wine, alcoholic', 3.60),
(210, 'Wine', 400, 'yes', 'Small wine, alcoholic', 3.80),
(211, 'Wine', 500, 'yes', 'Small wine, alcoholic', 4.00),
(212, 'Lemonade', 250, 'no', 'Small lemonade, non-alcoholic', 1.60),
(213, 'Lemonade', 400, 'no', 'Small lemonade, non-alcoholic', 1.80),
(214, 'Lemonade', 500, 'no', 'Small lemonade, non-alcoholic', 2.00);

-- Toppings
INSERT INTO BURRITO_TOPPING VALUES
(2, 'Lettuce', 0.00),
(11, 'Guacamole', 0.50),
(22, 'Tomato', 0.00),
(5, 'Mild salsa', 0.00),
(16, 'Hot salsa', 0.00),
(4, 'Lettuce', 0.00),
(13, 'Guacamole', 0.50),
(18, 'Hot salsa', 0.00),
(2, 'Mild salsa', 0.00),
(11, 'Lettuce', 0.00),
(22, 'Guacamole', 0.50),
(5, 'Lettuce', 0.00),
(16, 'Tomato', 0.00);

-- Order contains burrito
INSERT INTO ORDER_CONTAINS_BUR VALUES 
(1, 2),
(2, 11),
(3,22),
(4,5),
(4,11),
(4,16),
(5,11),
(5,16),
(6,17),
(6,5),
(6,5),
(7,4),
(7,11),
(7,11),
(7,16),
(8,13),
(9,18),
(9,16),
(9,12),
(10,2);

-- Order contains beverage
INSERT INTO ORDER_CONTAINS_BEV VALUES
(1, 200),
(2, 204),
(3,207),
(5,209),
(7,205),
(8,214),
(8, 214);

-- Customer buys order
INSERT INTO CUSTOMER_BUYS_ORDER VALUES
(1,'Albi33@mail.co.uk'),
(2,'Martin@mail.co.uk'),
(3,'Br1an6@mail.co.uk'),
(4,'Albi33@mail.co.uk'),
(5,'Martin@mail.co.uk'),
(6,'Br1an6@mail.co.uk'),
(7,'Albi33@mail.co.uk'),
(8,'Martin@mail.co.uk'),
(9,'Br1an6@mail.co.uk');

-- Meal_order
INSERT INTO MEAL_ORDER (ORDER_NO, ORDER_DATE, MARKET, FOOD_TRUCK_VRN) VALUES
(1,28/05/17, 'NW1 8AL', 'BC34XYZ'),
(2,29/05/17, 'SE1 1TL', 'AB12ABC'),
(3,30/05/17, 'NW1 8AL', 'BC34XYZ'),
(4,31/05/17, 'NW1 8AL', 'BC34XYZ'),
(5,01/06/17, 'SE1 1TL', 'AB12ABC'),
(6,02/06/17, 'NW1 8AL', 'BC34XYZ'),
(7,03/06/17, 'NW1 8AL', 'BC34XYZ'),
(8,04/06/17, 'SE1 1TL', 'AB12ABC'),
(9,05/06/17, 'NW1 8AL', 'BC34XYZ'),


-- Customer buys from food truck
INSERT INTO CUSTOMER_BUYS_FROM_FOOD_TRUCK VALUES
(@mail, vrn);