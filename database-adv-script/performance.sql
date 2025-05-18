SELECT 
    b.booking_id,
    b.created_at AS booking_date,
    b.startdate,
    b.enddate,
    b.status,

    -- User details
    u.user_id,
    u.email,
    u.account_status,

    -- Profile details
    p.first_name,
    p.last_name,
    p.phone_number,

    -- Property details
    pl.property_id,
    pl.title AS property_title,
    pl.description,
    pl.rent,

    -- Payment details
    pay.payment_id,
    pay.payment_amount,
    pay.payment_status

FROM bookings b
JOIN profiles p ON b.profile_id = p.profile_id
JOIN users u ON p.user_id = u.user_id
JOIN properties pl ON b.property_id = pl.property_id
JOIN payment pay ON b.payment_id = pay.payment_id;


EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.created_at AS booking_date,
    b.startdate,
    b.enddate,
    b.status,

    -- User details
    u.user_id,
    u.email,
    u.account_status,

    -- Profile details
    p.first_name,
    p.last_name,
    p.phone_number,

    -- Property details
    pl.property_id,
    pl.title AS property_title,
    pl.description,
    pl.rent,

    -- Payment details
    pay.payment_id,
    pay.payment_amount,
    pay.payment_status

FROM booking b
JOIN profile_table p ON b.profile_id = p.profile_id
JOIN user_table u ON p.user_id = u.user_id
JOIN property_listing pl ON b.property_id = pl.property_id
JOIN payment pay ON b.payment_id = pay.payment_id;
