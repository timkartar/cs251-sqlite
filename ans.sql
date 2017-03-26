/*number of married student*/
.print '(a)number of married students:'
select count(*) from family where id < 51 and relation = 'marrage partner';

/*number of students in married hostel*/
.print '(b)number of students in married hostel:'
select count(*) from core_mems where hostel = 'married';
.print '(a) and (b) are same'

/*number of student */
.print 'number of students'
select count(*) from core_mems where job = 'student' ;

/*number of faculty */
.print 'number of faculty'
select count(*) from core_mems where job = 'faculty' ;

/*number of staff */
.print 'number of staff'
select count(*) from core_mems where job = 'staff' ;

/*number of family members total*/
.print 'total family members'
select count(*) from family;

/* family members separately*/
.header on
.print 'family members separately'
select id, count(*) as familyMemCount from family
group by id having familyMemCount >= 0
order by familyMemCount asc;

/*average family members for faculty members*/
.print 'average number of family members per faculty member excluding himself'
select avg(familyMemCount) from (select id, count(*) as familyMemCount from family
group by id having familyMemCount >= 0
order by familyMemCount desc) where id > 50 and id < 101;

/*if any faculty or staff is head of more than one dept*/
.print 'if any faculty or staff is head of more than one dept: 0 if no such case'
.header off
select count(*) from(select head_id, count(*) as Count from depts
group by head_id having Count > 1
order by Count asc);

/*percentage of ug guys having advisor*/
.print 'number of ug guys with advisor'
select(select count(*) from advisors , core_mems where ugorpg = 'ug' and id = student_id)/
((select count(*) from core_mems where ugorpg = 'ug')/100.0);

/*number of advisors who is advising students from other departments*/
.print 'number of advisors who is advising students from other departments:'
.header off
select count(*) from (select *, count(*) as Count from advisors where a2_dep != s_dep
group by advisor2_id having Count >= 0
order by Count asc);



