SELECT id, title, location
FROM properties
WHERE id IN (
    SELECT properties.id
    FROM properties
    JOIN bookings ON properties.id = bookings.property_id
    JOIN reviews ON bookings.id = reviews.booking_id
    GROUP BY properties.id
    HAVING AVG(reviews.rating) > 4.0
);


SELECT u.user_id, u.email
FROM User_Table u
WHERE (
    SELECT COUNT(*)
    FROM booking b
    JOIN Profile_Table p ON b.booked_by = p.profile_id
    WHERE p.user_id = u.user_id
) > 3;
