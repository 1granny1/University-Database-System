#A query to update the phone number of a student
UPDATE students
SET Contact_Number = '+499999999999'
WHERE Student_code = 'GH1046612';

#This is a query to remove the enrollment of someone who has dropped
DELETE FROM enrollment
WHERE status = 'dropped';

#this query shows the average grade outputted as a variable called average grade to find the average of the class 
SELECT AVG(Grade) AS Average_Grade
FROM StudentGrades;

#this is a query that shows students and their courses
SELECT s.NameOfStudent, c.course_name
FROM students s
JOIN enrollment e ON s.Student_code = e.Student_code
JOIN courses c ON e.Course_code = c.Course_code;

#This is a query that counts the number of students that are enrolled in each code
SELECT c.course_name, COUNT(e.Student_code) AS Total_Students
FROM courses c
JOIN enrollment e ON c.Course_code = e.Course_code
GROUP BY c.course_name;

#this query shows students along with their grades
SELECT s.NameOfStudent, g.Grade
FROM students s
JOIN enrollment e ON s.Student_code = e.Student_code
JOIN StudentGrades g ON e.enrollment_ID = g.enrollment_ID;