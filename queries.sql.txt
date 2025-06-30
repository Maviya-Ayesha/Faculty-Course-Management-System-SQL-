-- 1. Show all students with their basic details
SELECT * FROM student2;

-- 2. List students who took medical leave, with reason and dates
SELECT s.name, m.from_date, m.to_date, m.reason
FROM student2 s
JOIN medical_leave m ON s.rollno = m.rollno;

-- 3. List all students with their attendance percentage
SELECT 
    s.name,
    a.course,
    a.total_days,
    a.present_days,
    ROUND((a.present_days::NUMERIC / a.total_days) * 100, 2) AS attendance_percent
FROM student2 s
JOIN attendance a ON s.rollno = a.rollno;

-- 4. Find students with attendance below 85%
SELECT 
    s.name,
    a.course,
    ROUND((a.present_days::NUMERIC / a.total_days) * 100, 2) AS attendance_percent
FROM student2 s
JOIN attendance a ON s.rollno = a.rollno
WHERE (a.present_days::NUMERIC / a.total_days) * 100 < 85;

-- 5. List students who participated in any sports activity
SELECT 
    s.name,
    sp.sport_name,
    sp.participation_level,
    sp.award
FROM student2 s
JOIN sports_activity sp ON s.rollno = sp.rollno;

-- 6. Find students who participated in State or National level sports
SELECT 
    s.name,
    sp.sport_name,
    sp.participation_level
FROM student2 s
JOIN sports_activity sp ON s.rollno = sp.rollno
WHERE sp.participation_level IN ('State', 'National');

-- 7. Show total number of students per course
SELECT course, COUNT(*) AS student_count
FROM student2
GROUP BY course;

-- 8. List students who did not take any medical leave
SELECT name
FROM student2
WHERE rollno NOT IN (
    SELECT rollno FROM medical_leave
);

-- 9. Get average attendance percentage per course
SELECT 
    course,
    ROUND(AVG(present_days * 100.0 / total_days), 2) AS avg_attendance_percent
FROM attendance
GROUP BY course;

-- 10. List students who have both participated in sports and taken medical leave
SELECT DISTINCT s.name
FROM student2 s
JOIN sports_activity sa ON s.rollno = sa.rollno
JOIN medical_leave ml ON s.rollno = ml.rollno;
