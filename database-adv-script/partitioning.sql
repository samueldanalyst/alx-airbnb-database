-- partitioning.sql

-- Drop existing table if needed (be careful in production)
DROP TABLE IF EXISTS Booking;

-- Create the partitioned Booking table
CREATE TABLE Booking (
    booking_id INT NOT NULL,
    customer_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    details VARCHAR(255),
    PRIMARY KEY (booking_id, start_date) -- Partitioning requires PRIMARY KEY or UNIQUE index to include partition key
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION pFuture VALUES LESS THAN MAXVALUE
);


-- Query 1: Fetch bookings in a specific year (partition pruning expected)
EXPLAIN SELECT * FROM Booking
WHERE start_date >= '2022-01-01' AND start_date < '2023-01-01';

-- Query 2: Fetch bookings over multiple years
EXPLAIN SELECT * FROM Booking
WHERE start_date >= '2021-06-01' AND start_date < '2023-06-01';

-- Query 3: Fetch bookings with no date filter (scans all partitions)
EXPLAIN SELECT * FROM Booking;
