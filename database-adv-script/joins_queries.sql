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
