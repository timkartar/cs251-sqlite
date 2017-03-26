create database comm.db;
create table core_mems (
	id integer primary key,
	name varchar(40),
	job varchar(10),
	dept varchar(10),
	hostel varchar(10),
	ugorpg char(2)
);
create table family (
	id integer,
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
	s_dep varchar(40),
	advisor1_id integer,
	a1_dep varchar(40),
	advisor2_id integer,
	a2_dep varchar(40),
	check (s_dep = a1_dep and advisor1_id is not null)

);
.tables
.separator ','
.import core_mems.csv core_mems
.import family.csv family
.import depts.csv depts
.import adv.csv advisors
