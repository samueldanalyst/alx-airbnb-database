-- Index to speed up joins between users and profiles
CREATE INDEX idx_profiles_user_id ON profiles(user_id);

-- Index to speed up lookups on bookings by user
CREATE INDEX idx_bookings_booked_by ON bookings(booked_by);

-- Index to optimize property lookups by poster
CREATE INDEX idx_properties_posted_by ON properties(posted_by);

-- Index to optimize property joins with bookings
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index to optimize review lookups by booking
CREATE INDEX idx_reviews_booking_id ON reviews(booking_id);

-- Optional: Indexes on IDs (though usually already indexed as primary keys)
-- CREATE INDEX idx_users_id ON users(id);
-- CREATE INDEX idx_properties_id ON properties(id);
-- CREATE INDEX idx_bookings_id ON bookings(id);
