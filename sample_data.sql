-- Insert Students
INSERT INTO student2 (rollno, name, dob, course, year) VALUES
(101, 'Ayesha Khan', '2003-01-15', 'B.Sc. Mathematics', 1),
(102, 'Ravi Mehra', '2002-08-22', 'BCA', 2),
(103, 'Zara Hussain', '2003-05-10', 'B.Sc. Mathematics', 1),
(104, 'Nikita Roy', '2001-12-01', 'BBA', 3);

-- Insert Medical Leave Records
INSERT INTO medical_leave (rollno, from_date, to_date, reason) VALUES
(101, '2025-03-01', '2025-03-03', 'Flu and Fever'),
(103, '2025-03-10', '2025-03-12', 'Migraine');

-- Insert Sports Activity
INSERT INTO sports_activity (rollno, sport_name, participation_level, award) VALUES
(102, 'Football', 'State', 'Runner Up'),
(104, 'Badminton', 'College', 'Gold Medal');

-- Insert Attendance
INSERT INTO attendance (rollno, course, total_days, present_days) VALUES
(101, 'B.Sc. Mathematics', 90, 84),
(102, 'BCA', 85, 75),
(103, 'B.Sc. Mathematics', 90, 82),
(104, 'BBA', 88, 80);
