
create table Teamss
(
Num int ,
Team text,
City text,
Established int,
Coach text,
Wins int
);
insert into Teamss values

(1, 'Maccabi', 'Tel-Aviv', 1960 ,'Gershon', 12),
(2, 'Hapoel', 'Jerusalem', 1965 ,'Druker', 9),
(3, 'Maccabi', 'Haifa', 1978 ,'Ashkenazi', 6),
(4, 'Hapoel', 'Tel-Aviv', 1957 ,'Ha-alion', 8),
(5, 'Hapoel', 'Galil-Elion', 1969, 'Katash', 11);

create table Budget
(Num int, Budget int);
insert into budget values
(2,1700),
(3,2000),
(4,1000),
(5,2400),
(6,3100),
(7,800);

create table houses
(Num int, house text);
insert into houses values
(1,'B'),
(2,'A'),
(3,'A'),
(4,'B'),
(5,'A'),
(6,'B');

create table players
(player text, name text, Num int, Age int);
insert into players values
(1, 'Gur Shelef' ,5 ,32),
(2, 'Lior Eliyahu' ,1 ,23),
(3, 'Doron Shefer' ,5 ,36),
(4, 'Nadav Henefeld' ,1 ,40),
(5, 'Sharon Sason' ,2 ,28),
(6, 'Ido Kozikaro' ,2 ,35),
(7, 'Meir Tapiro' ,2 ,38),
(8, 'Adi Gordon' ,3 ,33),
(9, 'Tomer Stainahour' ,3 ,34),
(10, 'Shimon Amsalem' ,4 ,31); (6,'B');


#1#
select distinct House
from houses;

#2#
select Count(Name)
from players
where Name like '%on%';

#3#
select Count(team) as Counter
from Teamss;

#4#
select AVG(Age)
from Players;

#5#
Select sum(Wins)
from Teamss
where Team = 'Hapoel';

#6#
select sum(Budget)
from Budget as B,Teamss as T
where B.Num = T.Num;

#7#
select Concat(Team," ", City), Wins, Budget
from Budget as B,Teamss as T
where B.Num = T.Num;

#8#
select distinct House ,Concat(Team," ", City) as TeamName
from Houses as H,Teamss as T
where H.Num = T.Num
order by House;

#10#
select count(Name)
from players as P, Teamss as T
where P.Num = T.Num
group by Team;

#11#
select distinct 'Hapoel Jerusalem that was established in 1965 has 10 wins'
from Teamss
where (team = 'hapoel') and (city ='Jerusalem') ;

#12#
select sum(distinct wins)
from Teamss
group by Team;

#13#
select team, count(team)
from Teamss
group by team;

#14#
select house, count(house) as amount
from Teamss as T, Houses as H
where T.num = H.num
group by house;

#15#
select sum(budget)
from Budget as B, Houses as H
where (B.num = H.num) and (House = 'A');