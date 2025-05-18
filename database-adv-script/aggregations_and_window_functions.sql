SELECT 
    users.id AS user_id,
    users.email,
    COUNT(bookings.id) AS total_bookings
FROM users
JOIN profiles ON users.id = profiles.user_id
LEFT JOIN bookings ON profiles.id = bookings.booked_by
GROUP BY users.id, users.email
ORDER BY total_bookings DESC;


SELECT 
    p.id AS property_id,
    p.title,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.title;
