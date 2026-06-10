DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS enrollments;

CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL ,
    last_name VARCHAR (100) NOT NULL
);
CREATE TABLE courses(
    id SERIAL PRIMARY KEY ,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE enrollments (
    student_id INT NOT NULL ,
    course_id INT NOT NULL ,
    progress INT DEFAULT 0,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    CONSTRAINT check_progress CHECK (progress >= 0 AND progress <= 100)
);
INSERT INTO students (first_name, last_name) VALUES ('Əli', 'Əliyev');
INSERT INTO courses (course_name) VALUES ('Java Backend');
INSERT INTO enrollments (student_id, course_id) VALUES (1, 1);

SELECT *FROM students;
SELECT *FROM courses;
SELECT * FROM enrollments;


