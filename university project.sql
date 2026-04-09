create database UniversityStudents; #creating the table here
use UniversityStudents; #making sure to use the table here 
create table students(
	Student_code varchar(9) primary key not null,
    NameOfStudent varchar(100) not null,
    Date_Of_birth date not null,
	student_gender enum ("M","F","Prefer not to share") not null,
    Contact_Number varchar(15) not null,
    Email_ID varchar(100) unique not null
    ); # i was gonna make Student_code int first but my student_code is GH1046612 and has 9 character
Create table Courses(
	Course_code varchar(10) primary key not null,
    course_name varchar(50) not null
); # same as student-code but then again our courses name are like w12sak so i made the course code varchar aswell
Create table enrollment(
	enrollment_ID varchar(10) primary key not null,
    Student_code varchar(9) not null,
    Course_code varchar(10) not null,
    semester varchar(50) not null,
    enrollment_date date not null,
    status enum("active", "completed", "on hold", "dropped") not null,
    foreign key (Student_code) references students(Student_code),
    foreign key (Course_code) references Courses(Course_code) 
    );
create table StudentGrades(
	Grade_code varchar(10) primary key not null,
	Grade decimal(5 , 2) check (Grade between 0 and 100) not null,
    enrollment_ID varchar(10) not null,
    foreign key (enrollment_ID) references enrollment(enrollment_ID)
    );   

INSERT INTO students VALUES
	('GH1046612', 'Sayed Kamran', '2003-11-26', 'M', '+491111111111', 'armankamran2@gmail.com'),
	('GH1046613', 'Ayusha Whatsup', '2003-11-27', 'F','+492222222222', 'ayusha.wassup@gmail.com'),
	('GH1046614', 'Arman Haider', '2003-11-28', 'M', '+493333333333', 'arman.haider@gmail.com'),
	('GH1046615', 'Fahad Khan', '2003-11-29', 'F', '+494444444444', 'fahad.khan@gmail.com'),
	('GH1046616', 'Sameer Tariq', '2003-11-30', 'M', '+495555555555', 'sameer.tariq@gmail.com'); #these are my friends
    
INSERT INTO courses VALUES
	('F100', 'English for Foundation Course'),
	('F101', 'Mathematical Skills for 
	Business and Computing'),
	('F107', 'Foundations of Computer 
	Science '),
	('F106', 'Academic and Professional 
	Developmentt'),
	('F102', 'Foreign Language'); #i had the first 4 courses in foundation but i added foreign language by myself
    
INSERT INTO enrollment VALUES
	('ER001', 'GH1046612', 'F100', 'Winter 2026', '2026-01-10', 'completed'),
	('ER002', 'GH1046613', 'F101', 'Winter 2026', '2026-01-10', 'dropped'),
	('ER003', 'GH1046615', 'F102', 'Winter 2026', '2026-01-11', 'active'),
	('ER004', 'GH1046614', 'F106', 'Winter 2026', '2026-01-12', 'active'),
	('ER005', 'GH1046615', 'F107', 'Winter 2026', '2026-01-13', 'on hold'),
	('ER006', 'GH1046616', 'F100', 'Winter 2026', '2026-01-14', 'active'),
	('ER007', 'GH1046616', 'F101', 'Winter 2026', '2026-01-11', 'active');
    
    
INSERT INTO StudentGrades VALUES
('GRD001', 85.5, 'ER001'),
('GRD002', 78.0, 'ER002'),
('GRD003', 88.5, 'ER003'),
('GRD004', 91.0, 'ER004'),
('GRD005', 67.5, 'ER005'),
('GRD006', 73.0, 'ER006'),
('GRD007', 82.0, 'ER007');