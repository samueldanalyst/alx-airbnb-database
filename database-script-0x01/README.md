# Airbnb Clone: Database Schema (SQL)

## Overview

This directory contains the SQL schema for the Airbnb-style listing platform.

## Files

- `schema.sql`: Contains `CREATE TABLE` statements with proper normalization, primary and foreign keys, and indexes.
- `README.md`: This documentation.

## Schema Highlights

- Users are stored in `users` table; profile data is separated into `profiles`.
- Listings are stored in `properties`, with each post linked to a user profile.
- `bookings` track reservations tied to properties and users.
- `reviews` are linked one-to-one with a booking.
- `messages` enable chat between users regarding listings.

## Instructions to Run

1. Make sure PostgreSQL is installed.
2. Run the script:

```bash
psql -U your_username -d your_database -f schema.sql
