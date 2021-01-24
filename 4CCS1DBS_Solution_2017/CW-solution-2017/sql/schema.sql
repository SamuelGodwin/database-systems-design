-- Part 2.1 schema.sql
--
-- Submitted by: Coursework Solution
-- 
-- edit your schema here ---------------

CREATE TABLE Customer (
    email VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    burrito_club_no INT UNIQUE AUTO_INCREMENT
);

CREATE TABLE FoodTruck (
    vehicle_id VARCHAR(64) PRIMARY KEY,
    date_in_service DATE NOT NULL 
);


CREATE TABLE Market (
    post_code VARCHAR(16) PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255),
    days_active VARCHAR(10)
    -- Days of the Week String: 
    -- (M)onday, (T)uesday, (W)ednesday, Thu(R)sday, (F)riday, (S)aturday, S(U)nday
    -- i.e. weekdays "MTWRF"
);


CREATE TABLE Appears (
    foodtruck_id VARCHAR(64) NOT NULL, 
    market_post_code VARCHAR(16) NOT NULL,
    date_scheduled DATE NOT NULL,
    
    PRIMARY KEY(foodtruck_id, market_post_code, date_scheduled),
    FOREIGN KEY (foodtruck_id) REFERENCES FoodTruck(vehicle_id)
                ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (market_post_code) REFERENCES Market(post_code)
                ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE FoodTruckOrder (
    order_no INT PRIMARY KEY AUTO_INCREMENT,
    date_placed DATE NOT NULL,
    burrito_club_no INT, -- NOTE: CAN be NULL for anonymous orders
    food_truck_id VARCHAR(64) NOT NULL,
    market_post_code VARCHAR(16) NOT NULL,
    total_cost DECIMAL(6,2),

    FOREIGN KEY (burrito_club_no) REFERENCES Customer(burrito_club_no)
                ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (food_truck_id) REFERENCES FoodTruck(vehicle_id)
                ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (market_post_code) REFERENCES Market(post_code)
                ON DELETE RESTRICT ON UPDATE CASCADE
);
-- NOTE: "Quantity" of items can be derived from the FoodTruckItems.
-- Total for the Order could be derived, but for efficiency sake,
-- will store it as a real attribute to take into account Free Burritos.


CREATE TABLE Burrito (
    burrito_id INT PRIMARY KEY,
    price DECIMAL(6,2) NOT NULL,
    description VARCHAR(25), -- Describe the Burrito
    size VARCHAR(10), -- "Mini", "Regular", "Grande"
    bean_type VARCHAR(25), -- CHECK DOMAIN "black", "red"
    filling VARCHAR(25)
);


CREATE TABLE Topping (
    topping_id INT PRIMARY KEY,
    price DECIMAL(6,2) NOT NULL,
    description VARCHAR(25) -- Describe the Topping
);


CREATE TABLE Drink (
    drink_id INT PRIMARY KEY,
    price DECIMAL(6,2) NOT NULL,
    description VARCHAR(25),
    size_ml INT,
    alcoholic BOOLEAN
);


CREATE TABLE Contains_Burrito (
    order_no INT NOT NULL,
    burrito_no INT UNSIGNED DEFAULT 1,
    burrito_id INT NOT NULL,

    PRIMARY KEY(order_no, burrito_id, burrito_no),
    FOREIGN KEY (order_no) REFERENCES FoodTruckOrder(order_no)
                ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (burrito_id) REFERENCES Burrito(burrito_id)
                ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Contains_Topping (
    order_no INT NOT NULL,
    burrito_no INT UNSIGNED DEFAULT 1,
    topping_id INT NOT NULL,

    PRIMARY KEY(order_no, burrito_no, topping_id),
    FOREIGN KEY (order_no) REFERENCES FoodTruckOrder(order_no)
                ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (topping_id) REFERENCES Topping(topping_id)
                ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Contains_Drink (
    order_no INT NOT NULL,
    drink_id INT NOT NULL,
    quantity INT UNSIGNED DEFAULT 1,
    PRIMARY KEY(order_no, drink_id),

    FOREIGN KEY (order_no) REFERENCES FoodTruckOrder(order_no)
                ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (drink_id) REFERENCES Drink(drink_id)
                ON DELETE CASCADE ON UPDATE CASCADE
);

-- "Number Of Burritos" is a dervied attribute 
-- that can be calculated from the Database.
CREATE VIEW BurritoClub AS
SELECT burrito_club_no, COUNT(*) as NumberOfBurritos 
FROM FoodTruckOrder NATURAL JOIN Contains_Burrito 
GROUP BY burrito_club_no 
HAVING burrito_club_no IS NOT NULL;


