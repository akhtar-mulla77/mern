create database sunbeam;
use sunbeam;
create table users(
email varchar(50) primary key,
password varchar(20),
role enum("student","admin")
   );
   
create table students(
reg_no int primary key,name varchar(20),email varchar(50),course_id int , mobile_no int ,profile_pic blob,
foreign key(email) references users(email),
foreign key(course_id) references courses(course_id)

);

create table courses(
course_id int primary key,course_name varchar(10), description varchar(20),fees int , start_date date,end_date date,
video_expire_days int
);

create table videos(
video_id int primary key,course_id int,title varchar(20),description varchar(20),youtube_url varchar(20),added_at date,
foreign key(course_id) references courses(course_id)

);

ALTER TABLE students MODIFY mobile_no VARCHAR(10);
ALTER TABLE courses MODIFY course_name varchar(20);
ALTER TABLE videos MODIFY youtube_url varchar(50);
ALTER TABLE videos MODIFY description varchar(50);

INSERT INTO courses VALUES
(101, 'IIT-MERN', 'MERN', 4000, '2025-12-20', '2026-01-20', 60),
(102, 'AI', 'some course ', 10000, '2025-12-24', '2026-01-24', 45),
(103, 'Python ML', 'Machine Learning', 8000, '2025-12-24', '2026-01-24', 90),
(104, 'Android', 'Android related', 10000, '2025-12-24', '2026-01-24', 50);

INSERT INTO courses VALUES
(105, 'Java Basics', 'Core Java s', 5000, '2025-01-10', '2025-03-10', 60),
(106, 'Web Dev', 'HTML CSS', 4000, '2025-02-01', '2025-04-01', 45),
(107, 'Python ML', 'Machine', 8000, '2025-01-15', '2025-04-15', 90),
(108, 'DBMS', 'Database f', 3000, '2025-03-01', '2025-05-01', 50);

INSERT INTO students VALUES
(1001, 'student1', 's1', 101, 123456, NULL),
(1002, 'student2', 's2', 102, 123456, NULL),
(1003, 'student3', 's3', 103, 123456, NULL),
(1004, 'student4', 's4', 104, 123456, NULL);


INSERT INTO users VALUES
('s1', 'pass1', 'student'),
('s2', 'pass2', 'student'),
('s3', 'pass3', 'student'),
('s4', 'pass4', 'student'),
('admin@mail.com', 'admin123', 'admin');

INSERT INTO videos VALUES
(1, 101, 'Intro MERN', 'Basics of MERN stack', 'https://youtu.be/mern101', '2025-12-21'),
(2, 102, 'Intro AI', 'What is Artificial Intelligence?', 'https://youtu.be/ai101', '2025-12-25'),
(3, 103, 'Intro ML', 'Machine Learning overview', 'https://youtu.be/ml101', '2025-12-25'),
(4, 104, 'Intro Android', 'Basics of Android dev', 'https://youtu.be/android101', '2025-12-25');
   
SELECT * FROM courses where start_date > curdate();
select s.*, c.course_name from students s inner join courses c on s.course_id = c.course_id;

SELECT s.*, c.*
FROM students s JOIN courses c 
ON s.course_id = c.course_id
WHERE s.email = 's1'; 

SELECT c.course_id, c.course_name, c.start_date, c.end_date, c.video_expire_days,
v.video_id, v.title, v.added_at 
FROM courses c
JOIN videos v ON c.course_id = v.course_id
JOIN  students s ON s.course_id = c.course_id
WHERE s.email = 's1'
AND v.added_at + INTERVAL c.video_expire_days DAY >= CURDATE();

show tables;