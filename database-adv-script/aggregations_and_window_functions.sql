SELECT 
    users.id AS user_id,
    users.email,
    COUNT(bookings.id) AS total_bookings
FROM users
JOIN profiles ON users.id = profiles.user_id
LEFT JOIN bookings ON profiles.id = bookings.booked_by
GROUP BY users.id, users.email
ORDER BY total_bookings DESC;