"TO SHOW ALL STUDENTS AND THEIR CLASSES"
SELECT students.first_name, students.last_name, classes.class_name
FROM students
JOIN classes ON students.class_id = classes.class_id;

"STUDENTS AND THEIR GRADES"
SELECT s.first_name, s.last_name, sub.subject_name, g.grade
FROM grades g
JOIN students s ON g.student_id = s.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id;

"TEACHERS SUBJECT"
SELECT 
t.first_name, t.last_name, sub.subject_name
FROM teachers t
JOIN teacher_subjects ts ON t.teacher_id = ts.teacher_id
JOIN subjects sub ON ts.subject_id = sub.subject_id;

"AVARAGE GRADE OF STUDENT"
SELECT s.first_name, s.last_name, AVG(g.grade) AS average_grade
FROM grades g
JOIN students s ON g.student_id = s.student_id
GROUP BY s.student_id;

"BEST STUDENTS"
SELECT s.first_name, s.last_name, AVG(g.grade) AS average_grade
FROM grades g
JOIN students s ON g.student_id = s.student_id
GROUP BY s.student_id
ORDER BY average_grade ASC
LIMIT 5;

"TIMETABLE"
SELECT c.class_name, sub.subject_name, t.first_name, t.last_name, sc.day_of_week, sc.lesson_number
FROM schedules sc
JOIN classes c ON sc.class_id = c.class_id
JOIN subjects sub ON sc.subject_id = sub.subject_id
JOIN teachers t ON sc.teacher_id = t.teacher_id;
