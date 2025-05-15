# SQL Query: Retrieve Bookings and Their Users

## 📌 Objective

The purpose of this SQL query is to retrieve detailed booking information along with the corresponding user data for each booking in the database. It demonstrates the use of **INNER JOINs** to combine data from multiple related tables.

## 🧩 Tables Involved

- `bookings`: Contains information about each booking (start/end date, property, status, etc.).
- `profiles`: Stores user profile details and links to the main `users` table.
- `users`: Stores user account information such as email and user ID.

## 🔗 Join Logic

This query performs the following joins:

1. `bookings.booked_by = profiles.id`: Links each booking to the profile that made it.
2. `profiles.user_id = users.id`: Retrieves the user associated with each profile.

Since `INNER JOIN` is used, only bookings **with valid associated user accounts** will appear in the result.

## 🧾 Query

```sql
SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.email,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.status
FROM bookings
INNER JOIN profiles ON bookings.booked_by = profiles.id
INNER JOIN users ON profiles.user_id = users.id;


# Advanced SQL: Subqueries

## 📌 Objective

This module demonstrates the use of **subqueries** in SQL — both **correlated** and **non-correlated** — to perform more complex queries in a relational database.

The focus is on two common use cases:

1. Finding properties with an average rating greater than 4.0 using a non-correlated subquery.
2. Finding users who have made more than 3 bookings using a correlated subquery.

## 📁 Files

- `subqueries.sql` — Contains the SQL queries for both subquery types.
- `README.md` — Explains the purpose, logic, and expected output of the queries.

---

## 🧪 Query 1: Properties with Average Rating > 4.0

### ✅ Description

This query identifies properties where the average rating from reviews exceeds 4.0. A **non-correlated subquery** is used in the `WHERE` clause to filter those properties.


# SQL Aggregations and Window Functions

## 📌 Objective

This module demonstrates how to use **SQL aggregation functions** and **window functions** to analyze and rank data in a relational database.

The tasks include:

1. Counting the total number of bookings made by each user.
2. Ranking properties based on the total number of bookings they have received using a window function.

---

## 🧪 Query 1: Total Number of Bookings Per User

### ✅ Description

This query calculates how many bookings each user has made by aggregating bookings grouped by the user's ID.