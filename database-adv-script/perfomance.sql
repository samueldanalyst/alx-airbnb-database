SELECT 
    b.booking_id,
    b.startdate,
    b.enddate,
    b.status AS booking_status,

    -- Property details
    p.property_id,
    p.title AS property_title,
    p.description,
    p.location AS property_location,
    p.rent,

    -- User details of the person who booked
    u.user_id,
    u.email,
    u.account_status,

    -- Payment details
    pay.payment_id,
    pay.payment_amount,
    pay.payment_status

FROM booking b
JOIN property_listing p ON b.property_id = p.property_id
JOIN Profile_Table prof ON b.booked_by = prof.profile_id
JOIN User_Table u ON prof.user_id = u.user_id
LEFT JOIN payment pay ON b.payment_id = pay.payment_id;



Analyze the query’s performance using EXPLAIN and identify any inefficiencies



SELECT 
    b.booking_id,
    b.startdate,
    b.enddate,
    b.status AS booking_status,
    p.property_id,
    p.title AS property_title,
    p.description,
    p.location AS property_location,
    p.rent,
    u.user_id,
    u.email,
    u.account_status,
    pay.payment_id,
    pay.payment_amount,
    pay.payment_status
FROM booking b
JOIN property_listing p ON b.property_id = p.property_id
JOIN Profile_Table prof ON b.booked_by = prof.profile_id
JOIN User_Table u ON prof.user_id = u.user_id
LEFT JOIN payment pay ON b.payment_id = pay.payment_id;
