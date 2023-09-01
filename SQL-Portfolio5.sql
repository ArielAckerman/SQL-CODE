#1#
select year,count(*)
from Students1
group by Year
order by year;

#2#
select City
from Students1
group by City
having AVG(age) > 25;

#3#
select Name
from students1
where age = (select Max(age) from students1);

#4#
INSERT INTO shows
VALUES (70,
 (SELECT school_id FROM students1 WHERE student_ID = 11),
Null,
Null,
 (SELECT name FROM students1 WHERE age = (SELECT max(age)
FROM students1))
);


DELETE FROM students1
WHERE Name = 'Rite';

#5#
select Name
from schools
where numofstudents < (select AVG(Numofstudents) from schools);

#6#
SELECT DISTINCT STRCMP(
 (SELECT ROUND(age,0) FROM students WHERE student_id = 5),
(SELECT CEIL(age) FROM students WHERE student_id = 5)
)
FROM students1;

#7#
SELECT singer
FROM (SELECT singer, name
FROM schools LEFT OUTER JOIN shows
USING (school_id)
UNION
SELECT singer, name
FROM schools RIGHT OUTER JOIN shows
USING (school_id)
 ) As X
ORDER BY Name DESC;

#8#
select distinct age
from students1
where city in ('Ramat-Gan','Givatyim','Jerusalem');

#9#
select name, Start_Hour, End_Hour
from students1 st left outer join shows sh
on st.school_id = sh.school_id
where city = 'Tel-Aviv';

#10#
SELECT distinct name
FROM schools
WHERE school_id = SOME
 ((SELECT school_id
 FROM agudamembers JOIN students1
 USING (student_id)
 WHERE car_permit = 'V'));

#11#
SELECT Count(name)
FROM students1
WHERE City =
(SELECT city
FROM schools
WHERE numofstudents = 
(SELECT min(numofstudents) FROM schools));

#12#
SELECT name
FROM students1
where City = (SELECT city FROM students1 WHERE name='dotan')
and name != 'dotan';

#13#
SELECT avg(age)
FROM Students1 as s
WHERE EXISTS(SELECT * FROM agudamembers AS a
WHERE s.student_id = a.student_id);