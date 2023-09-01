
create table Friends
(
Email text,
Name text,
BirthDate date,
NumberOfFriends int,
FB_Status text,
ProfileOpenDate date);

insert into Friends values
('itay@gmail.com', 'Itay', '1985-05-20', 268 ,'SinGle', '2007-02-02'),
('nadav@hotmail.com', 'Nadav', '1990-05-18', 321 ,'MaRRied', '2009-01-30'),
('Daniel@yahoo.com', 'Daniel', '1967-05-19', 157 ,'MarrIEd' ,'2010-06-09'),
('Jonathan@aol.com', 'Jonathan', '1992-05-20', 68 ,'SiNGle' ,'2009-05-16'),
('Eitan@ynet.co.il', 'Eitan', '1983-05-21', 618 ,'MARried' ,'2011-07-03'),
('Yuval@home.com', 'Yuval', '1988-05-22', 554 ,'SingLE' ,'2011-09-09'),
('Idan@google.com', 'Idan', '1978-05-20', 329 ,'SIngLe' ,'2012-01-04'),
('Amit@israel.co.il', 'Amit', '1969-05-18', 662, 'DiVORce', '2006-08-23');

create table Events
(Num int,
Name text,
Event_Date date,
Location text,
Event_Hour time,
EventManager text);
insert into Events values

(250, 'Passover Event' ,'2012-04-14', 'Tel-Aviv', '23:00',' Nadav'),
(251, 'Independent Day Event', '2012-05-25', 'Jaffa', '21:00', 'Amit'),
(252, 'WiParty Silent Party', '2012-04-11', 'Tel-Aviv', '18:00', 'Itay'),
(253, 'Daniel Birthday', '2012-05-20', 'Givatyim', '16:30', 'Daniel'),
(254, 'Jerusalem Day Event', '2012-05-20', 'Jerusalem', '10:30', 'Eitan'),
(255, 'Student Day', '2012-05-30', 'Eilat', '12:00', 'Jonathan'),
(256, 'Mimona Event', '2012-04-14', 'Netanya', '20:30', 'Yuval');

Create table sales
(Date date,
Product text,
Customer text,
salsePerson text,
Amount int);

Insert into sales values
('2021-01-01', 'Security Software', 'Top security Inc', 'David H', 15000),
('2021-01-01', 'CRM', 'Top security Inc', 'David H', 150000),
('2021-01-01', 'ERP', 'Top security Inc', 'Lizzy A', 250000),
('2021-01-01', 'Security Software ', 'Web Defender Inc', 'Lizzy A', 18000),
('2021-01-01', 'Security Software ', 'WorkUS Inc', 'Lizzy A', 19000),
('2021-01-01', 'ERP', 'Best HR LTD', 'Robert S', 215000),
('2021-01-02', 'ERP', 'Web Defender Inc', 'Robert S', 170000),
('2021-01-02', 'Security Software', 'Best HR LTD', 'Lizzy A', 20000),
('2021-01-02', 'CRM', 'Best HR LTD', 'Robert S', 170000);


#1#
select Lower(FB_Status), name
from friends;

#2#
select reverse(Email) as ReverseEmail
from Friends;

#3#
select name, NumberOfFriends, FB_Status
from Friends
where name like '%n';

#4#
select Email
from Friends
where Length(Email) = 14
order by Email Desc;

#5#
select Concat(Name, ' at ', Location)
from Events
where Month(Event_Date)=5 and Day(Event_Date)=20;

#6#
select distinct Year(Event_date)
from Events;

#7#
select distinct round(NumberOfFriends/3.5) as RealFriends
from Friends;

#8#
select distinct Name, BirthDate
from Friends
where NumberOfFriends Between 400 and 700
order by BirthDate Asc;

#9#
select SubStr(Email,6,5)
from Friends
where Name = 'Itay';

#10#
select Year(BirthDate) ,Year(ProfileOpenDate), Year(Event_Date)
from Friends as F, Events as E
where F.Name = E.eventManager;

#11#
select DateDiff(ProfileOpenDate,BirthDate)
from Friends
where Name like '%i%';

#12#
select STRCMP(Event_Date, BirthDate)
from Friends as F, Events as E
where (F.Name = E.eventManager) and (F.Name = 'Daniel');

#13#
select distinct FB_Status, count(FB_Status)
from Friends
group by FB_Status
order by FB_Status Asc;

#14#
select Location, count(distinct Num)
from Events
group by Location
order by Location Desc;

