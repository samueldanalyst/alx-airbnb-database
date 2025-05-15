# 🔧 Optimization Report: Booking Retrieval Query

## 📌 Objective

To retrieve comprehensive booking data including user, profile, property, and payment information — and optimize the SQL query for better performance.

---

## 🧪 Original Query (See `perfomance.sql`)

The query joins 5 tables:

- `bookings`
- `profiles`
- `users`
- `properties`
- `payments` (optional)

---

## 🔍 Performance Analysis Using EXPLAIN

### Example EXPLAIN output:
```sql
EXPLAIN ANALYZE
SELECT ...
FROM bookings
JOIN profiles ...
JOIN users ...
...


