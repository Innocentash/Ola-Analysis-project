Create database Ola;
use ola;
select * from bookings;

Select count(*) from bookings;

 -- 1. Retrieve all successful bookings:
 Select * from bookings where booking_status = "success";
 
--  2. Find the average ride distance for each vehicle type:

Select vehicle_type,Avg(ride_distance) as Avg_ride_distance from bookings
group by vehicle_type;

--  3. Get the total number of cancelled rides by customers:
Select Count(*) as total_cancelled_rides_by_customer from bookings
where Booking_status = "canceled by customer";

--  4. List the top 5 customers who booked the highest number of rides:

select Customer_iD,count(*) as Total_rides
from bookings 
group by Customer_id
order By Total_rides desc limit 5;

--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Select Count(*) as rides_cancelled_by_driver
from bookings
where canceled_rides_by_driver = "personal & car related issue";

--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

select max(driver_ratings) as maximum_rating,min(driver_ratings) as minimum_rating
from bookings 
where vehicle_type = "Prime sedan";

--  7. Retrieve all rides where payment was made using UPI:

select *
from bookings 
where payment_method = "Upi";

--  8. Find the average customer rating per vehicle type:

select Vehicle_type,Round(Avg(customer_rating),2) as average_rating
from bookings
group by vehicle_type;

--  9. Calculate the total booking value of rides completed successfully:

Select Sum(booking_value) as total_success_booking_value
from bookings
where booking_status = "success";

--  10. List all incomplete rides along with the reason

Select Booking_id,Incomplete_rides_reason
from bookings
where incomplete_rides = "yes";
