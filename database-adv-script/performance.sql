-- Original Complex Query
-- Retrieves all bookings with user, profile, property, and payment details

SELECT
    bookings.id AS booking_id,
    users.id AS user_id,
    users.email,
    profiles.full_name,
    properties.id AS property_id,
    properties.title,
    properties.location,
    bookings.start_date,
    bookings.end_date,
    bookings.status,
    payments.amount,
    payments.payment_method,
    payments.paid_at
FROM bookings
JOIN profiles ON bookings.booked_by = profiles.id
JOIN users ON profiles.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
LEFT JOIN payments ON payments.booking_id = bookings.id;
