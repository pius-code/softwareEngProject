-- CREATE DATABASE ComputerEngineeringDept;
-- CREATE SCHEMA department;
-- CREATE TABLE department.students (
--     student_id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     dob DATE,
--     email VARCHAR(100),
--     phone VARCHAR(15)
-- );
-- CREATE TABLE department.fees (
--     fee_id SERIAL PRIMARY KEY,
--     student_id INT REFERENCES department.students(student_id),
--     amount DECIMAL(10, 2),
--     date_paid DATE,
--     payment_method VARCHAR(50)
-- );
-- CREATE TABLE department.courses (
--     course_id SERIAL PRIMARY KEY,
--     course_name VARCHAR(100),
--     course_code VARCHAR(10)
-- );

-- CREATE TABLE department.enrollments (
--     enrollment_id SERIAL PRIMARY KEY,
--     student_id INT REFERENCES department.students(student_id),
--     course_id INT REFERENCES department.courses(course_id),
--     enrollment_date DATE
-- );
-- CREATE TABLE department.lectures (
--     lecture_id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(100),
--     phone VARCHAR(15)
-- );

-- CREATE TABLE department.lecture_course_assignments (
--     assignment_id SERIAL PRIMARY KEY,
--     lecture_id INT REFERENCES department.lectures(lecture_id),
--     course_id INT REFERENCES department.courses(course_id)
-- );
-- CREATE TABLE department.teaching_assistants (
--     ta_id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(100),
--     phone VARCHAR(15)
-- );

-- CREATE TABLE department.lecture_ta_assignments (
--     assignment_id SERIAL PRIMARY KEY,
--     lecture_id INT REFERENCES department.lectures(lecture_id),
--     ta_id INT REFERENCES department.teaching_assistants(ta_id)
-- );
-- Inserting sample students into the department.students table

-- INSERT INTO department.students (first_name, last_name, dob, email, phone)
-- VALUES
-- ('Pius', 'Oblie', '1995-06-15', 'pius.oblie@stuggmail.com', '+233201234001'),
-- ('Abena', 'Serwaa', '1996-08-20', 'abena.serwaa@stuggmail.com', '+233201234002'),
-- ('Nana', 'Kwesi', '1997-03-25', 'nana.kwesi@stuggmail.com', '+233201234003'),
-- ('Donald', 'Asamoah', '1994-12-10', 'donald.asamoah@stuggmail.com', '+233201234004'),
-- ('Isaac', 'Antwi', '1995-11-05', 'isaac.antwi@stuggmail.com', '+233201234005');

-- INSERT INTO department.fees (student_id, amount, date_paid, payment_method)
-- VALUES
-- (1, 500.00, '2024-01-15', 'mobile money'),
-- (2, 450.00, '2024-02-20', 'online bank'),
-- (3, 300.00, '2024-03-25', 'credit card'),
-- (4, 350.00, '2024-04-10', 'bitcoin'),
-- (5, 400.00, '2024-05-05', 'mobile money');
-- INSERT INTO department.courses (course_name, course_code)
-- VALUES
-- ('Software Engineering', 'SE101'),
-- ('Data Structures and Algorithms', 'DSA102'),
-- ('Linear Circuit', 'LC103'),
-- ('Python Programming', 'PP104');
-- INSERT INTO department.enrollments (student_id, course_id)
-- VALUES
-- (1, 1), 
-- (2, 2),
-- (3, 3),
-- (4, 4), 
-- (5, 1); 
-- Insert sample lectures
-- INSERT INTO department.lectures (first_name, last_name, email, phone)
-- VALUES
--     ('Kwame', 'Mensah', 'kwamemensah@gmail.com', '+233201234567'),
--     ('Ama', 'Darko', 'amadarko@gmail.com', '+233202345678'),
--     ('Yaw', 'Boateng', 'yawboateng@gmail.com', '+233203456789'),
--     ('Akosua', 'Ansah', 'akosuaansah@gmail.com', '+233204567890');
-- INSERT INTO department.lecture_course_assignments (lecture_id, course_id)
-- VALUES
--     (1, 1), -- Lecture 1 assigned to Software Engineering
--     (2, 2), -- Lecture 2 assigned to Data Structures and Algorithms
--     (3, 3), -- Lecture 3 assigned to Linear Circuit
--     (4, 4); -- Lecture 4 assigned to Python Programming
-- Insert sample teaching assistants
-- INSERT INTO department.teaching_assistants (first_name, last_name, email, phone)
-- VALUES
--     ('Kwame', 'Appiah', 'kwameappiah@gmail.com', '+233555555555'),
--     ('Abena', 'Mensah', 'abenamensah@gmail.com', '+233244444444'),
--     ('Kofi', 'Agyapong', 'kofiagyapong@gmail.com', '+233277777777'),
--     ('Akosua', 'Owusu', 'akosuaowusu@gmail.com', '+233233333333');
-- INSERT INTO department.lecture_ta_assignments (lecture_id, ta_id)
-- VALUES
--     (1, 1),
--     (2, 2),
--     (3, 3),
--     (4, 4);
-- CREATE OR REPLACE FUNCTION department.calculate_outstanding_fees()
-- RETURNS JSON AS $$
-- DECLARE
--     result JSON;
-- BEGIN
--     SELECT json_agg(row_to_json(fees_due)) INTO result
--     FROM (
--         SELECT 
--             s.student_id,
--             s.first_name,
--             s.last_name,
--             COALESCE(SUM(f.amount), 0) AS total_paid,
--             5000 - COALESCE(SUM(f.amount), 0) AS outstanding_fees
--         FROM 
--             department.students s
--         LEFT JOIN 
--             department.fees f ON s.student_id = f.student_id
--         GROUP BY 
--             s.student_id
--     ) AS fees_due;

--     RETURN result;
-- END;
-- $$ LANGUAGE plpgsql;