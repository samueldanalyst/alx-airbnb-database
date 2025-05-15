# Database Indexing for Performance Optimization

## 📌 Objective

This module focuses on identifying key columns in the database tables that are frequently used in queries and creating **indexes** on those columns to improve query performance.

---

## 🔍 Identifying High-Usage Columns

Indexes are most effective on columns that are commonly used in:

- `WHERE` clauses (filtering)
- `JOIN` conditions
- `ORDER BY` clauses
- Columns involved in `GROUP BY` or aggregate functions

### Key tables and columns to consider:

| Table     | Column(s)                | Usage Scenario                     |
|-----------|--------------------------|----------------------------------|
| `users`   | `email`                  | User lookup, authentication      |
| `profiles`| `user_id`                | Join with users, bookings        |
| `bookings`| `booked_by` (profile_id) | Join with profiles, filtering    |
|           | `property_id`            | Join with properties              |
|           | `start_date`, `end_date` | Date range queries, filtering    |
| `properties`| `location`              | Search/filter by location         |
|           | `posted_by` (profile_id) | Join with profiles                |

---

## 💾 SQL Index Creation Commands

Create indexes on the identified columns to optimize queries:

```sql
-- Index on users.email for fast lookup by email
CREATE INDEX idx_users_email ON users(email);

-- Index on profiles.user_id for joins with users and bookings
CREATE INDEX idx_profiles_user_id ON profiles(user_id);

-- Index on bookings.booked_by for joins and filtering by user profile
CREATE INDEX idx_bookings_booked_by ON bookings(booked_by);

-- Index on bookings.property_id for joins with properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Composite index on bookings dates to speed up date range queries
CREATE INDEX idx_bookings_start_end_date ON bookings(start_date, end_date);

-- Index on properties.location for location-based filtering
CREATE INDEX idx_properties_location ON properties(location);

-- Index on properties.posted_by for joins with profiles
CREATE INDEX idx_properties_posted_by ON properties(posted_by);
