--View for Student Attendance Summary
CREATE OR REPLACE VIEW student_attendance_summary AS
SELECT 
    s.rollno,
    s.name,
    a.course,
    a.total_days,
    a.present_days,
    ROUND((a.present_days::NUMERIC / a.total_days) * 100, 2) AS attendance_percent
FROM student2 s
JOIN attendance a ON s.rollno = a.rollno;

SELECT * FROM student_attendance_summary;

--View for Sports Participation Detail
CREATE OR REPLACE VIEW sports_participation_report AS
SELECT 
    s.rollno,
    s.name,
    sa.sport_name,
    sa.participation_level,
    sa.award
FROM student2 s
JOIN sports_activity sa ON s.rollno = sa.rollno;

--Function to Calculate Total Medical Leaves Taken by a Student
CREATE OR REPLACE FUNCTION count_medical_leaves(roll INT)
RETURNS INT AS $$
DECLARE
    leave_count INT;
BEGIN
    SELECT COUNT(*) INTO leave_count
    FROM medical_leave
    WHERE rollno = roll;

    RETURN leave_count;
END;
$$ LANGUAGE plpgsql;

SELECT count_medical_leaves(101);

--PL/SQL block for printing Attendance Records for a Student using cursor
DO $$
DECLARE
    rec RECORD;
    rno INT := 101;
    cur CURSOR FOR
        SELECT course, total_days, present_days,
               ROUND((present_days * 100.0 / total_days), 2) AS percent
        FROM attendance
        WHERE rollno = rno;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO rec;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'Course: %, Total: %, Present: %, Attendance: %%',
            rec.course, rec.total_days, rec.present_days, rec.percent;
    END LOOP;
    CLOSE cur;
END;
$$;

