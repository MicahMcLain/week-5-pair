-- CAMPGROUND TABLE
-----------------------------------------------

-- select name and daily fee of all campgrounds (expected: 7 rows)
select name, daily_fee
from campground;
-- select name and daily fee of all campgrounds ordered by campground name (expected: 7 rows, starting with "Blackwoods")
select name, daily_fee
from campground
order by name;
-- select name, open from month, open to month, and daily fee of the campgrounds where daily fee is less than $100 (expected: 5 rows)
select name, open_from_mm, open_to_mm, daily_fee
from campground
where daily_fee < '$100';
-- select name and daily fee of the campgrounds where the campground is open all year long (expected: 4 rows)
select name, daily_fee
from campground
where open_from_mm = 1 and open_to_mm = 12;

-- PARK TABLE
-----------------------------------------------

-- select name and description of all parks order by established date in descending order (expected: 3 rows, startng with "Cuyahoga Valley")
select name, description
from park
order by establish_date desc;

-- select name and description of all parks in Ohio (expected: 1 row)
select name, description
from park
where location = 'Ohio';
-- select name and description of all parks NOT in Ohio (expected: 2 rows)
select name, description
from park
where location != 'Ohio';
-- select the total number of visitors for all parks (expected: around 6 million)
select sum(visitors)
from park;
-- select the average number of visitors for all parks (expected: around 2 million)
select avg(visitors)
from park;

-- SITE TABLE
-----------------------------------------------

-- select all columns from site where utilities is true and order by max RV length with the largest coming first
-- (expected: 26 rows, starting with 35-foot max_rv_length)
select *
from site
where utilities = true
order BY max_rv_length desc;

-- select total number of sites that have utilities hook up (expected: around 25)
select count(site_id) as num_of_sites
from site
where utilities = true;

-- RESERVATION TABLE
-----------------------------------------------

-- select reservation id, site id, name, from date, to date of the reservations where the checkin date 
--	is between the first and last day of the current month (hard coded month is ok) 
-- (expected row count may vary, should be no more than 44)
select reservation_id, site_id, name, from_date, to_date
from reservation
where create_date BETWEEN ('06/01/2023') AND ('06/30/2023');

-- select all columns from reservation where name includes 'Reservation' (expected: 23 rows)
select *
from reservation
where name like '%Reservation%';
-- select the total number of reservations in the reservation table (expected: around 40)
select count(reservation_id)
from reservation;
-- select reservation id, site id, name of the reservations where site id is in the list 9, 20, 24, 45, 46 (expected: 16 rows)
select reservation_id, site_id, name
from reservation
where site_id is (9, 20, 24, 45, 46);
-- select the date and number of reservations for each date ordered by from_date in ascending order (expected: 24 rows, starting from the earliest date)
select from_date, count(reservation_id) as num_of_reservations
from reservation
Group BY from_date
order BY from_date;
