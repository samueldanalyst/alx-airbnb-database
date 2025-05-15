# Database Normalization: Airbnb Clone

## Objective

Ensure that the database schema follows the principles of Third Normal Form (3NF) by eliminating redundancy, ensuring data integrity, and reducing anomalies during data operations.

---

## Normalization Overview

### First Normal Form (1NF)
- All attributes contain only **atomic values** (no repeating groups or arrays).
- Each record is **uniquely identifiable** using a primary key.

✅ **Our schema meets 1NF**:
- All columns hold single values (e.g., `phone_number`, `email`, `price`).
- Every table has a defined **primary key**.

---

### Second Normal Form (2NF)
- Must be in 1NF.
- No **partial dependencies** of non-key attributes on a composite key.

✅ **Our schema meets 2NF**:
- All non-key attributes depend on the **entire primary key** in each table.
- No table uses a composite key unnecessarily.

---

### Third Normal Form (3NF)
- Must be in 2NF.
- **No transitive dependencies**: Non-key attributes depend only on the primary key, not on other non-key attributes.

✅ **Our schema is in 3NF**:
We reviewed the following potential issues and resolved them:

#### ✅ `Profile_Table`
- `user_id` is a foreign key; all other data (name, phone, bio) directly depends on `profile_id`.
- No transitive dependencies.

#### ✅ `property_listing`
- Attributes like `location`, `price`, and `posted_by` all directly relate to `property_id`.

#### ✅ `booking_table`
- `booked_by` refers to `Profile_Table`.
- `start_date`, `end_date`, and `status` are dependent on `booking_id` alone.

#### ✅ `review_table`
- `reviewer_id` and `booking_id` are FKs, and `rating` + `comment` are attributes tied directly to `review_id`.

#### ✅ `message_table`
- Includes `sender_profile_id`, `receiver_profile_id`, `property_id` — all are FKs.
- `message` content and `timestamp` relate directly to the `message_id`.

---

## Summary of Adjustments Made

- Separated user authentication (`User_Table`) from user profile data (`Profile_Table`) to avoid repeating contact details and allow authentication logic to be isolated.
- Tied all foreign keys properly to avoid denormalized fields like `poster_email`, `poster_name`, etc.
- Messages and bookings are associated with both profiles and listings using FKs rather than duplicating listing or user data.

---

## Conclusion

The current schema has been designed and reviewed according to normalization principles. All tables are now in **Third Normal Form (3NF)**:

- Redundant data is eliminated.
- Each field depends only on the **primary key** of its table.
- Data integrity and scalability are ensured.

