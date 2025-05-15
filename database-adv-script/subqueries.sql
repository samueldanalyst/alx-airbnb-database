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