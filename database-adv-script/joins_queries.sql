SELECT * FROM property_rental.profiles;

/*Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.*/

select profiles.user_id, 
	profiles.full_name,
    profiles.gender,
    bookings.start_date,
    bookings.end_date,
    properties.location
from bookings
join profiles on bookings.booked_by = profiles.id
join properties on bookings.property_id = properties.id;


/*Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.*/

select *
from properties
left join reviews on properties.id = reviews.property_id;

/*Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.*/

SELECT * 
FROM profiles
LEFT JOIN bookings ON profiles.user_id = bookings.posted_by

UNION

SELECT * 
FROM profiles
RIGHT JOIN bookings ON profiles.user_id = bookings.posted_by


