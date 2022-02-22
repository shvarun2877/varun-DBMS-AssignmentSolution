create database if not exists TravelOnTheGo_table ;
use TravelOnTheGo_table;
create table if not exists Passenger(Passenger_Name varchar(60),Category varchar(60),Gender varchar(60),
Boarding_City varchar(60),Destination_City varchar(60),Distance int,Bus_Type varchar(60));
create table if not exists PRICE(Bus_Type varchar(60),Distance int,Price int);
insert into Passenger values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into Passenger values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');


insert into Passenger values('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into Passenger values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into Passenger values('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into Passenger values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into Passenger values('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into Passenger values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into Passenger values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into Price values();
insert into Price values('Sleeper',350,770);
insert into Price values('Sleeper',500,1100);
insert into Price values('Sleeper',600,1320);
insert into Price values('Sleeper',700,1540);
insert into Price values('Sleeper',1000,2200);
insert into Price values('Sleeper',1200,2640);

insert into Price values('Sleeper',1500,2700);
insert into Price values('Sitting',500,620);
insert into Price values('Sitting',600,744);
insert into Price values('Sitting',700,868);
insert into Price values('Sitting',1000,1240);
insert into Price values('Sitting',1200,1488);
insert into Price values('Sitting',1500,1860);

#Query 3
select gender,count(gender) from Passenger  where Distance>=600 group by gender;
#Query 4
select Bus_type,min(Price) as Minimum_Price from Price where Bus_type='Sleeper';
#Query 5
select Passenger_name from Passenger where Passenger_name like 'S%';
#Query 6
select Passenger.Passenger_name,Passenger.Boarding_City,Passenger.Destination_City,Passenger.Bus_type,Passenger.Distance,Price.price from Passenger inner join Price on Passenger.Bus_type=Price.Bus_type and Passenger.Distance=Price.Distance;
#Query 7
select Passenger.Passenger_name,Price.price as ticketPrice from Passenger inner join Price on Passenger.Bus_type=Price.Bus_type where Passenger.Bus_type='Sitting' and Passenger.Distance=1000;
#Query 8
select Price.bus_type ,Price.price from Price where distance=700;
#Query 9
select Passenger.distance from Passenger group by Passenger.distance order by Passenger.distance desc;
#Query 10
select Passenger.Passenger_name ,(distance/(select sum(distance) from passenger)*100) as distance from passenger;
#Query 11

select Price.distance,Price.price,
case
when price.price>1000 then 'Expensive'
when 500<price.price<1000 then 'Average Cost'
else 'cheap' end as category from price ;
