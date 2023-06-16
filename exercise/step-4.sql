-- select the park name, campground name, open_from_mm, open_to_mm & daily_fee ordered by park name and then campground name
-- (expected: 7 rows, starting with "Blackwoods")
select park.name, campground.name, open_from_mm, open_to_mm, daily_fee
from campground
join park on campground.park_id = park.park_id
order BY park.name, campground.name;


-- select the park name and the total number of campgrounds for each park ordered by park name
-- (expected: 3 rows, starting with "Acadia")
select park.name, count(campground_id)
from park
join campground on park.park_id=campground.park_id
Group BY park.name
order by park.name



-- select the park name, campground name, site number, max occupancy, accessible, max rv length, utilities where the campground name is 'Blackwoods'
-- (expected: 12 rows)
select park.name, campground.name, site_number, max_occupancy, accessible, max_rv_length, utilities
from park
join campground on park.park_id=campground.park_id
join site on campground.campground_id = site.campground_id
where campground.name = 'Blackwoods'


-- select site number, reservation name, reservation from and to date ordered by reservation from date
-- (expected: 44 rows, starting with the earliest date)
select site_number, reservation.name, from_date, to_date
from site
join reservation on site.site_id = reservation.site_id
order BY reservation.from_date
