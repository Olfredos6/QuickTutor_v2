use QuickTutor;

/*drop table Tutors;
create table Tutors(
	ID int identity(0000000,1) not null,
	Pseudo char(70) primary key,
	KeyCode char(20) not null,

)

drop table Subjects;

create table Subjects(
	ID int identity(0,1) not null,
	Name char(50) not null,
	Pseudo char(70) not null foreign key references Tutors(Pseudo),
	Credit int not null
)

create table TokenSpace(
	Token char(8) primary key,
	Mail char(50) not null,
	Tutor char(70) not null foreign key references Tutors(Pseudo),
	Subject char(50) not null,
	Date date not null,
)
*/
drop table TokenMail;

