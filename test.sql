create table core_mems (
	id integer primary key,
	name varchar(40),
	job varchar(10),
	dept varchar(10),
	hostel varchar(10),
	ugorpg char(2)
);
create table family (
	id integer primary key,
	name varchar(40),
	relation varchar(20),
	foreign key (id)
	references core_mems(id)
	on update cascade
	on delete restrict
);
create table depts (
	dept varchar(10) primary key,
	head varchar(40),
	head_id integer,
	foreign key(head_id)
		references core_mems(id)
		on update cascade
		on delete restrict
);
create table advisors (
	student_id integer primary key,
	s_name varchar(40),
	advisor_id integer,
	a_name varchar(40),
	foreign key(advisor_id)
		references core_mems(id)
		on update cascade
                on delete restrict
);
.tables
SELECT * FROM SYSCAT.REFERENCES
