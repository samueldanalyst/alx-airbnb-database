# Airbnb Clone: Sample Data Seeding

## Overview

This directory includes SQL statements to populate the database with realistic sample data for development and testing purposes.

## Files

- `seed.sql`: Populates the database with test data including users, profiles, properties, bookings, reviews, and messages.
- `README.md`: This file.

## Data Summary

- 3 users with associated profiles
- 3 properties listed in different locations
- 3 bookings across users and listings
- 2 reviews
- 3 property-based messages

## Instructions to Run

Make sure you’ve already created the schema using `schema.sql` (from `database-script-0x01`).

Then run:

```bash
psql -U your_username -d your_database -f seed.sql
