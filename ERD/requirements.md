# Airbnb Database Requirements

## Entities and Attributes

### 1. User_Table
- `user_id` (PK)
- `username`
- `email`
- `password_hash`
- `created_at`
- `updated_at`

### 2. Profile_Table
- `profile_id` (PK)
- `user_id` (FK) → User_Table.user_id
- `first_name`
- `last_name`
- `phone_number`
- `bio`
- `created_at`
- `updated_at`

### 3. property_listing
- `property_id` (PK)
- `title`
- `description`
- `location`
- `price`
- `posted_by` (FK) → Profile_Table.profile_id
- `created_at`
- `updated_at`

### 4. booking_table
- `booking_id` (PK)
- `property_id` (FK) → property_listing.property_id
- `booked_by` (FK) → Profile_Table.profile_id
- `start_date`
- `end_date`
- `status` (e.g., pending, confirmed, cancelled)
- `created_at`
- `updated_at`

### 5. review_table
- `review_id` (PK)
- `booking_id` (FK) → booking_table.booking_id
- `reviewer_id` (FK) → Profile_Table.profile_id
- `rating` (int)
- `comment`
- `created_at`

### 6. message_table
- `message_id` (PK)
- `sender_profile_id` (FK) → Profile_Table.profile_id
- `receiver_profile_id` (FK) → Profile_Table.profile_id
- `property_id` (FK) → property_listing.property_id
- `message` (text)
- `timestamp`
- `read_status` (boolean)

---

## Relationships

- A **User** has exactly one **Profile** (one-to-one).
- A **Profile** can post many **property listings** (one-to-many).
- A **property listing** belongs to exactly one **Profile** (many-to-one).
- A **Profile** can make many **bookings** (one-to-many).
- A **booking** is for exactly one **property listing** (many-to-one).
- A **booking** can have one **review** (one-to-one).
- A **review** is written by exactly one **Profile** (many-to-one).
- A **Profile** can send many **messages** (one-to-many as sender).
- A **Profile** can receive many **messages** (one-to-many as receiver).
- A **message** is tied to exactly one **property listing** (many-to-one).

---

## Notes

- `message_table` allows users to communicate regarding specific property listings.
- The `read_status` boolean in `message_table` tracks if the message has been read.
- The `status` in `booking_table` tracks booking lifecycle.
- Timestamps are recorded for audit and ordering.

---

## Summary

This schema supports:

- User registration and profile management.
- Property listings with ownership.
- Booking system with review capability.
- Messaging system tied to property listings for inquiries.

