-- Task 2


create database Course

use Course

create table Students(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(max),
	[Surname] nvarchar(max),
	[Age] int,
	[Email] nvarchar(max),
	[Address] nvarchar(max)
)

insert into Students([Name],[Surname],[Age],[Email],[Address])
values ('Name1','Surname1',16,'namesurname1@gmail.com','Baku'),
		  ('Name2','Surname2',17,'namesurname2@gmail.com','Sheki'),
		  ('Name3','Surname3',17,'namesurname3@gmail.com','Gebele'),
		  ('Name4','Surname4',16,'namesurname4@gmail.com','Baku')

select * from Students


create table StudentArchive(
		[Id] int primary key identity(1,1),
		[StudentId] int,
		[Name] nvarchar(max),
		[Surname] nvarchar(max),
		[Age] int,
		[Email] nvarchar(max),
		[Address] nvarchar(max),
		[Operation] nvarchar(max),
		[Date] datetime
)

select * from StudentArchive


create trigger trg_addArchiveAfterDeletion on Students
after delete
as
begin
		insert into StudentArchive([StudentId],[Name],[Surname],[Age],[Email],[Address],[Operation],[Date])
		select [Id], [Name], [Surname], [Age], [Email], [Address], 'Delete', GETDATE() from deleted
end


delete from Students where [Id] = 1