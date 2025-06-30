-- Student Table
CREATE TABLE student2 (
    rollno INT PRIMARY KEY,
    name VARCHAR(30),
    dob DATE,
    course VARCHAR(30),
    year INT
);

-- Medical Leave Table
CREATE TABLE medical_leave (
    leave_id SERIAL PRIMARY KEY,
    rollno INT,
    from_date DATE,
    to_date DATE,
    reason VARCHAR(100),
    CONSTRAINT fk_medical_student FOREIGN KEY (rollno) REFERENCES student2(rollno)
);

-- Sports Participation Table
CREATE TABLE sports_activity (
    activity_id SERIAL PRIMARY KEY,
    rollno INT,
    sport_name VARCHAR(30),
    participation_level VARCHAR(20), -- School/State/National
    award VARCHAR(30),
    CONSTRAINT fk_sports_student FOREIGN KEY (rollno) REFERENCES student2(rollno)
);

-- Attendance Table
CREATE TABLE attendance (
    rollno INT,
    course VARCHAR(30),
    total_days INT,
    present_days INT,
    PRIMARY KEY (rollno, course),
    CONSTRAINT fk_attend_student FOREIGN KEY (rollno) REFERENCES student2(rollno)
);
