--Task 3

create database Courses

use database Courses

create table Countries(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(max)
)
create table Cities(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(max),
	[CountryId] int,
	foreign key (CountryId) references Countries(Id)
)
create table Students(
	[Id] int primary key identity(1,1),
	[FullName] nvarchar(max),
	[Age] int,
	[Email] nvarchar(max),
	[CityId] int,
	foreign key (CityId) references Cities(Id)
)
create table Teachers(
	[Id] int primary key identity(1,1),
	[FullName] nvarchar(max),
	[Salary] decimal,
	[CityId] int,
	foreign key (CityId) references Cities(Id)
)
create table Groups(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(max),
	[RoomId] int,
	foreign key (RoomId) references Rooms(Id)
)
create table Rooms(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(max),
	[Capacity] int
)
create table StaffMembers(
	[Id] int primary key identity(1,1),
	[Job] nvarchar,
	[RoleId] int,
	foreign key (RoleId) references Roles(Id)
)
create table Roles(
	[Id] int primary key identity(1,1),
	[Role] nvarchar
)

create table StudentGroups(
	[Id] int primary key identity(1,1),
	[GroupId] int,
	[StudentId] int,
	foreign key (GroupId) references Groups(Id),
	foreign key (StudentId) references Students(Id)
)

create table TeacherGroups(
	[Id] int primary key identity(1,1),
	[GroupId] int,
	[TeacherId] int,
	foreign key (GroupId) references Groups(Id),
	foreign key (TeacherId) references Teachers(Id)
)

