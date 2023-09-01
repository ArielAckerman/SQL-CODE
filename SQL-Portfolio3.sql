
create table classes
(
ID int ,
Name text,
Coach_ID int,
LessonPrice int
);
insert into classes values

(1111, 'Spinning', 123, 80),
(2222, 'Yoga' ,234, 65),
(3333, 'Gym' ,345, 20),
(4444, 'Tennis' ,345 ,100),
(5555, 'Swimming', 234 ,75),
(6666, 'Kick_Boxing' ,234 ,80);

create table Schedule
(Member_id int, Class_id int, Week_Day text);
insert into Schedule values
(11, 2222 ,'Monday'),
(33, 2222 ,'Monday'),
(22, 1111 ,'Sunday'),
(11, 1111 ,'Tuesday'),
(55, 5555 ,'Wednesday'),
(55, 5555 ,'Friday'),
(88, 3333 ,'Sunday'),
(88, 3333 ,'Tuesday'),
(88, 3333 ,'Thursday'),
(11, 6666 ,'Wednesday');

create table Members
(ID int, Name text,Age int,City text, Membership text);
insert into members values
(11, 'Omer', 26, 'Ramat-Gan', 'Regular'),
(22, 'Gili', 19, 'Tel-Aviv', 'Gold'),
(33, 'Miki', 55, 'Jerusalem', 'Silver'),
(44, 'Eldad', 57, 'Givatyim', 'Regular'),
(55, 'Sigal', 28, Null ,'Silver'),
(66, 'David', 30, 'Jerusalem', 'Gold'),
(77, 'Yaniv', 29, 'Givatyim', 'Regular'),
(88, 'Aviv', 31, 'Herzelia', 'Silver'),
(123, 'Ofer', 36, 'Ramat-Gan', 'Gold'),
(234, 'Itzik', 41, 'Jerusalem', 'Gold'),
(345, 'Merav', 52, Null, 'Gold');



#1#
select Max(LessonPrice),Min(LessonPrice)
from Classes;

#2#
select Name
from Members
where id < 100
union
select Name
from Members
where id > 100;

#3#
select Name
from Members
where city is null
order by Name Desc;

#4#
update members
set city = 'Ramat-Gan'
where name = 'Merav';

update members
set city = 'Herzelia'
where name = 'Sigal';

#5#
select city,membership,AVG(Age)
from members
group by city;

#6#
delete from classes
where Name = 'Tennis';

#7#
select membership
from members as m join schedule as s
on m.id = s.member_id
where week_day = 'Monday';

#8#
select Name, week_day
from classes as c join schedule as s
on ID = class_id;

#9#
select sum(lessonPrice)*2
from Classes as c join Schedule as s
on ID = class_id;

#10#
select Name
from Members as m join Schedule as s
on ID = member_id
group by id
having count(class_id) > 1;

#11#
select count(distinct Week_Day)
from classes as c join schedule as s
on ID = class_id
group by c.name = 'spining';

#12#
select count(name)
from members
where (age > 30) and (name like '%a%');

#13#
select Name, count(Member_id) as Counter
from classes as c join schedule as s
on ID = class_id
group by name
order by name desc;

#14#
select Week_day, count(member_id) + (select count(ID) from members where id > 100)
from  Schedule
group by Week_day;
