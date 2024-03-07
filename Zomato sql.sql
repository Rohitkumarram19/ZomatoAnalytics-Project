create database Zomato_Analysis;
use zomato_analysis;
select * from Zomato;

# Country Map
CREATE TABLE CountryName(
CountryCode int, CountryName varchar(30) ) ;

insert into CountryName 
values (1, 'India'),
(14, 'Australia'),
(30, 'Brazil'),
(37, 'Canada'),
(94, 'Indonesia'),
(148, 'New Zealand'),
(162, 'Philippines'),
(166, 'Qatar'),
(184, 'South-east Asia'),
(189, 'South Africa'),
(191, 'Srilanka'),
(208, 'Turkey'),
(214, 'UAE'),
(215, 'United Kingdom'),
(216, 'United States');

select * from CountryName;

#2. Calender 
select year(Dateopening) years,
month(Dateopening)  months,
day(Dateopening) day ,
monthname(Dateopening) monthname,Quarter(Dateopening)as quarter,
concat(year(Dateopening),'-',monthname(Dateopening)) yearmonth, 
weekday(Dateopening) weekday,
dayname(Dateopening)dayname, 

case when monthname(Dateopening) in ('January' ,'February' ,'March' )then 'Q1'
when monthname(Dateopening) in ('April' ,'May' ,'June' )then 'Q2'
when monthname(Dateopening) in ('July' ,'August' ,'September' )then 'Q3'
else  'Q4' end as quarters,

case when monthname(Dateopening)='January' then 'FM10' 
when monthname(Dateopening)='January' then 'FM11'
when monthname(Dateopening)='February' then 'FM12'
when monthname(Dateopening)='March' then 'FM1'
when monthname(Dateopening)='April'then'FM2'
when monthname(Dateopening)='May' then 'FM3'
when monthname(Dateopening)='June' then 'FM4'
when monthname(Dateopening)='July' then 'FM5'
when monthname(Dateopening)='August' then 'FM6'
when monthname(Dateopening)='September' then 'FM7'
when monthname(Dateopening)='October' then 'FM8'
when monthname(Dateopening)='November' then 'FM9'
when monthname(Dateopening)='December'then 'FM10'
end Financial_months,
case when monthname(Dateopening) in ('January' ,'February' ,'March' )then 'Q4'
when monthname(Dateopening) in ('April' ,'May' ,'June' )then 'Q1'
when monthname(Dateopening) in ('July' ,'August' ,'September' )then 'Q2'
else  'Q3' end as financial_quarters

from zomato;

#3.Numbers of Resturants opening based on Year , Quarter , Month.
select year(Dateopening)year,quarter(Dateopening)quarter,monthname(Dateopening)monthname,count(restaurantid)as no_of_restaurants 
from Zomato group by year(Dateopening),quarter(Dateopening),monthname(Dateopening) 
order by year(Dateopening),quarter(Dateopening),monthname(Dateopening) ;
select * from zomato;

#4. Count of Resturants based on Average Ratings.
select case when rating <=2 then "0-2" when rating <=3 then "2-3" when rating <=4 then "3-4" when Rating<=5 then "4-5" end rating_range,count(restaurantid) 
from zomato
group by rating_range 
order by rating_range;

#5.Percentage of Resturants based on "Has_Table_booking"
select has_online_delivery,concat(round(count(Has_Online_delivery)/100,1),"%") percentage 
from zomato
group by has_online_delivery;

#6.Percentage of Resturants based on "Has_Online_delivery"
select has_table_booking,concat(round(count(has_table_booking)/100,1),"%")
 percentage from zomato group by has_table_booking;

#7 Number of Restaurants
select count(distinct RestaurantId) from Zomato;
select * from Zomato;

#8 Number of cities
select count(distinct City) from Zomato;

#9 Number of Cuisines
select count(distinct Cuisine) from Zomato;

#10 Number of Countries
select count(distinct CountryName) from Zomato;

#11 Find number of restaurants base on city
select city , count(distinct restaurantid) from zomato
group by city;

#12 Find number of restaurants base on country
select countryname , count(distinct restaurantid) from zomato
group by countryname;