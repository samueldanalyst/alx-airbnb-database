-- seed.sql: Sample Data for Airbnb Clone

-- Users
INSERT INTO users (email, password_hash) VALUES
('alice@example.com', 'hashed_pw_1'),
('bob@example.com', 'hashed_pw_2'),
('carol@example.com', 'hashed_pw_3');

-- Profiles
INSERT INTO profiles (user_id, full_name, phone_number, bio) VALUES
(1, 'Alice Smith', '1234567890', 'Loves hosting guests in the city.'),
(2, 'Bob Johnson', '2345678901', 'Frequent traveler and remote worker.'),
(3, 'Carol Williams', '3456789012', 'Sharing my family home when we’re away.');

-- Properties
INSERT INTO properties (title, description, location, price, posted_by) VALUES
('Cozy Apartment in Nairobi', '1-bedroom with WiFi and balcony', 'Nairobi, Kenya', 50.00, 1),
('Lakeside Cottage', 'Great for retreats and writers', 'Naivasha, Kenya', 120.00, 3),
('Modern Loft', 'Open-plan living in the city', 'Nairobi, Kenya', 80.00, 1);

-- Bookings
INSERT INTO bookings (property_id, booked_by, start_date, end_date, status) VALUES
(1, 2, '2025-06-01', '2025-06-05', 'confirmed'),
(2, 1, '2025-07-10', '2025-07-15', 'pending'),
(3, 3, '2025-08-20', '2025-08-22', 'confirmed');

-- Reviews
INSERT INTO reviews (booking_id, reviewer_id, rating, comment) VALUES
(1, 2, 5, 'Great host and clean apartment.'),
(3, 3, 4, 'Nice location and stylish space.');

-- Messages
INSERT INTO messages (sender_profile_id, receiver_profile_id, property_id, message) VALUES
(2, 1, 1, 'Hi Alice, is the apartment available in July?'),
(3, 1, 3, 'Is the loft child-friendly?'),
(1, 3, 2, 'Hi Carol, what’s the best way to get to your cottage?');
