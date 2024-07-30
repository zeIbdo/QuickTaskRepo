create database PB303
use PB303
create table Categories(
Id int primary key identity,
Name nvarchar(50) unique not null
)
create table Tags(
Id int primary key identity,
Name nvarchar(50) unique not null
)
create table Users(
Id int primary key identity,
Username nvarchar(50) unique not null,
Fullname nvarchar(50) not null,
Age int,
check (age>0 and age<150)
)
create table Comments(
Id int primary key identity,
UserId int references Users(Id),
BlogId int references Blogs(Id),
Content nvarchar(255) not null
)
create table Blogs(
Id int primary key identity,
Title nvarchar(50) not null,
Description text not null,
UserId int references Users(Id),
CategoryId int references Categories(Id)
)
create table BlogsTags(
BlogId int references Blogs(Id),
TagId int references Tags(Id)
)
INSERT INTO Categories (Name) VALUES ('Technology');
INSERT INTO Categories (Name) VALUES ('Travel');

INSERT INTO Tags (Name) VALUES ('Coding');
INSERT INTO Tags (Name) VALUES ('Adventure');

INSERT INTO Users (Username, Fullname, Age) VALUES ('john_doe', 'John Doe', 28);
INSERT INTO Users (Username, Fullname, Age) VALUES ('jane_smith', 'Jane Smith', 32);

INSERT INTO Blogs (Title, Description, UserId, CategoryId) VALUES ('The Future of AI', 'An in-depth look at artificial intelligence.', 1, 1);
INSERT INTO Blogs (Title, Description, UserId, CategoryId) VALUES ('Exploring the Alps', 'A travel guide to the Alps.', 2, 2);

INSERT INTO Comments (UserId, BlogId,Content) VALUES (1, 1,'qesey');
INSERT INTO Comments (UserId, BlogId,Content) VALUES (2, 2,'pis');

INSERT INTO BlogsTags (BlogId, TagId) VALUES (1, 1);
INSERT INTO BlogsTags (BlogId, TagId) VALUES (2, 2);

create view view_1 as
select Blogs.Title,Users.Fullname,Users.Username from Blogs
cross join Users
select * from view_1
create view view_2 as
select Blogs.Title,Categories.Name from Blogs
cross join Categories
select * from view_2


create procedure usp_procedure1 @userId int
as
select Content from Comments
where @userId=UserId

exec usp_procedure1 1

create procedure usp_procedure2 @userId int
as
select * from Blogs
where @userId=UserId

exec usp_procedure2 1
