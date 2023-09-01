
create table studentss
(
SID int, FirstName text, LastName text, FullName text, BirthDate Date
);
insert into studentss values
(123, 'Dan', 'Cohen', 'Dan Cohen', '1980-01-01'),
(234, 'David', 'Gerbi', 'David Gerbi', '1979-06-13'),
(345, 'Bar', 'Refaeli', Null ,'1982-04-10'),
(456, 'Dikla', 'Pinto', 'Dikla Pinto' ,'1979-02-25'),
(567, 'Yaron', 'Abulafia', 'Yaron Abulafia', '1985-10-03'),
(678, 'Shiraz', 'Tal', 'Shiraz Tal' ,'1972-03-30'),
(789, 'Sigal', 'Segev', 'Sigal Segev' ,'1981-02-19'),
(901, 'Galit', 'Gutman', 'Galit Gutman', '1981-04-10'),
(012, 'Sagit', 'Edry', Null, '1982-10-04');

create table Courses
(
CID int, Cname text, CDay text, Building int, NumOfStudent int, SID int
);
insert into Courses values
(281, 'Database', 'Sunday', 504, 52, 234),
(321, 'Algorithms', 'Sunday', 306 ,37, 678),
(411, 'Communication', 'Friday', 409, 49, 598),
(222, 'Algebra', 'Tuesday', 107, 41, 150),
(667, 'Numbers Theory', 'Friday', 803, 25, 703),
(335, 'Internet', 'Wednesday', 901, 66, 901),
(367, 'Complexity', 'Wednesday', 760, 30, 400);

create table Lecturers
(
LID int, FirstName text, LastName text, FullName text ,Experience int, CID int
);
insert into Lecturers values
(444, 'Amir', 'Gold', 'Amir Gold', 6.5, 335),
(555, 'Dan', 'Silver', 'Dan Silver', 15, 281),
(666, 'Moshe', 'Kolman', Null, 32, 321),
(777, 'Haim', 'Ron', Null, 12.25, 222),
(888, 'Shalom', 'Levi', 'Shalom Levi', 24, 530),
(999, 'Yoav', 'Blaush', Null, 16.75, 367);


#1#
select count(LID)
from Lecturers
where experience > 10;

#2#
select DataBase() ,'Data Base Im working at the moment'
from Lecturers;

#3#
select Cday,sum(numOfStudent)
from Courses
group by CDay
order by CDay Desc;

#4#
select Fullname, Cname
from Studentss as s left outer join Courses as C
on S.SID = C.SID
where firstname like 'd%';

#5#
select fullname,Length(fullname)
from studentss
where fullname is not null;

#6#
select fullname
from studentss
where fullname is not null
union
select fullname
from lecturers
where fullname is not null;

#7#
select sum(numofstudent)
from courses as C join Lecturers as L
on C.CID = L.CID
where fullname is null;

#8#
select count(Birthdate)
from studentss
where year(birthdate) = 1982;

#9#
insert into lecturers (LID,firstname,Lastname,Fullname,Experience)
values (333,'Yehoshua','Segev','Yehoshua Segev',8);

#10#
insert into Studentss (SID,Firstname,Lastname,Fullname)
values
(654,(select FirstName from Lecturers where LID = 444),
(select Lastname from Lecturers where LID = 444),
(select Fullname from Lecturers where LID = 444));

#11#
select  SUBSTR(LastName,2,3)
from Studentss
where SID = 456;

#12#
select Experience
from Lecturers as L join Courses as C
on L.CID = C.CID
where SID = (select SID from Studentss where Fullname = 'Shiraz Tal');

#13#
select replace(cname,'a','x')
from courses;

#14#
select CName, FullName
from Courses as C left outer join Lecturers as L
on L.CID = C.CID
union
select CName, FullName
from Courses as C RIGHT outer join Lecturers as L
on L.CID = C.CID;

#15#
select STRCMP(
(select Firstname from studentss where SID =123),
(select Firstname from lecturers where LID = 555)
);

#16#
select Datediff(
(select Birthdate from studentss where firstname = 'Galit'),
(select Birthdate from studentss where firstname = 'Sigal'))
from studentss;

#17#
select CDay, count(CName)
from courses
group by CDay
having count(CDay)>1;

#18#
select Last_Day(Birthdate)
from Studentss
where SID = 789;

#19#
update studentss
set (FullName,BirthDate)=('Sagit Edry','1983-10-04')
where SID = 012;

#20#
delete from courses
delete from Studentss
delete from Lecturers
