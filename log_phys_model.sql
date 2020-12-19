DROP TABLE IF EXISTS "ensemble" CASCADE;
DROP TABLE IF EXISTS "group_lesson" CASCADE;
DROP TABLE IF EXISTS "individual_lesson" CASCADE;
DROP TABLE IF EXISTS "instructor" CASCADE;
DROP TABLE IF EXISTS "instrument" CASCADE;
DROP TABLE IF EXISTS "instrument_skill" CASCADE;
DROP TABLE IF EXISTS "personal_data" CASCADE;
DROP TABLE IF EXISTS "phone" CASCADE;
DROP TABLE IF EXISTS "salary" CASCADE;
DROP TABLE IF EXISTS "school" CASCADE;
DROP TABLE IF EXISTS "skill_of_instructor" CASCADE;
DROP TABLE IF EXISTS "student" CASCADE;
DROP TABLE IF EXISTS "audition" CASCADE;
DROP TABLE IF EXISTS "email" CASCADE;
DROP TABLE IF EXISTS "rental" CASCADE;
DROP TABLE IF EXISTS "rental_instrument" CASCADE;
DROP TABLE IF EXISTS "skill_of_student" CASCADE;
DROP TABLE IF EXISTS "administration" CASCADE;
DROP TABLE IF EXISTS "application" CASCADE;
DROP TABLE IF EXISTS "invoice" CASCADE;
DROP TABLE IF EXISTS "student_rental" CASCADE;
DROP TABLE IF EXISTS "guardian" CASCADE;
DROP TABLE IF EXISTS "instructor_salary" CASCADE;
DROP TABLE IF EXISTS "Lesson_price" CASCADE;
DROP TABLE IF EXISTS "Scheduled_lesson" CASCADE;
DROP TABLE IF EXISTS "sibling_with" CASCADE;
DROP TABLE IF EXISTS "Student_guardian" CASCADE;

CREATE TABLE instrument (
 instrument_id INT NOT NULL,
 brand VARCHAR(50) NOT NULL,
 type VARCHAR(10) NOT NULL,
 leaseability VARCHAR(5) NOT NULL,
 availability VARCHAR(5) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE personal_data (
 id INT NOT NULL,
 age VARCHAR(3) NOT NULL,
 firstName VARCHAR(50) NOT NULL,
 lastName VARCHAR(50) NOT NULL,
 ssn VARCHAR(12) NOT NULL,
 ID_number VARCHAR(50) NOT NULL,
 street_name VARCHAR(50),
 zip_code VARCHAR(10),
 city VARCHAR(30) NOT NULL,
 country VARCHAR(15)
);

ALTER TABLE personal_data ADD CONSTRAINT PK_personal_data PRIMARY KEY (id);


CREATE TABLE phone (
 id INT NOT NULL,
 phone_nr CHAR(10) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE rental (
 rental_id INT NOT NULL,
 delivery VARCHAR(10),
 rental_fee VARCHAR(10) NOT NULL,
 rental_period VARCHAR(10) NOT NULL
);

ALTER TABLE rental ADD CONSTRAINT PK_rental PRIMARY KEY (rental_id);


CREATE TABLE rental_instrument (
 instrument_id INT NOT NULL,
 rental_id INT NOT NULL
);

ALTER TABLE rental_instrument ADD CONSTRAINT PK_rental_instrument PRIMARY KEY (instrument_id,rental_id);


CREATE TABLE salary (
 salary_id VARCHAR(10) NOT NULL,
 month CHAR(10) NOT NULL,
 amount_of_lessons_given INT NOT NULL
);

ALTER TABLE salary ADD CONSTRAINT PK_salary PRIMARY KEY (salary_id);


CREATE TABLE school (
 school_id INT NOT NULL,
 name VARCHAR(50) NOT NULL,
 age_limit VARCHAR(2) NOT NULL,
 street_name VARCHAR(50),
 zip_code VARCHAR(10),
 city VARCHAR(30),
 country VARCHAR(15)
);

ALTER TABLE school ADD CONSTRAINT PK_school PRIMARY KEY (school_id);


CREATE TABLE student (
 student_id INT NOT NULL,
 reached_rental_limit CHAR(5) NOT NULL,
 personal_data_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE student_rental (
 student_id INT NOT NULL,
 rental_id INT NOT NULL
);

ALTER TABLE student_rental ADD CONSTRAINT PK_student_rental PRIMARY KEY (student_id,rental_id);


CREATE TABLE administration (
 admin_id INT NOT NULL,
 school_id INT,
 id INT
);

ALTER TABLE administration ADD CONSTRAINT PK_administration PRIMARY KEY (admin_id);


CREATE TABLE application (
 application_id INT NOT NULL,
 admin_id INT NOT NULL,
 student_id INT NOT NULL,
 admitted CHAR(10) NOT NULL
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (application_id);


CREATE TABLE email (
 id INT NOT NULL,
 email CHAR(10) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (id);


CREATE TABLE guardian (
 guardian_id INT NOT NULL,
 personal_data_id INT NOT NULL
);

ALTER TABLE guardian ADD CONSTRAINT PK_guardian PRIMARY KEY (guardian_id);


CREATE TABLE instructor (
 instructor_id INT NOT NULL,
 personal_data_id INT NOT NULL,
 school_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_salary (
 instructor_id INT NOT NULL,
 salary_id VARCHAR(10) NOT NULL
);

ALTER TABLE instructor_salary ADD CONSTRAINT PK_instructor_salary PRIMARY KEY (instructor_id,salary_id);


CREATE TABLE instrument_skill (
 instrument_skill_id INT NOT NULL,
 personal_data_id INT NOT NULL,
 instrument_type VARCHAR(20),
 level_of_skill VARCHAR(20)
);

ALTER TABLE instrument_skill ADD CONSTRAINT PK_instrument_skill PRIMARY KEY (instrument_skill_id,personal_data_id);


CREATE TABLE invoice (
 invoice_id CHAR(10) NOT NULL,
 amount VARCHAR(10),
 sibling_discount VARCHAR(10),
 month CHAR(10),
 student_id INT NOT NULL
);

ALTER TABLE invoice ADD CONSTRAINT PK_invoice PRIMARY KEY (invoice_id);


CREATE TABLE Lesson_price (
 price_id INT NOT NULL,
 day_of_week CHAR(10) NOT NULL,
 level_of_lesson CHAR(10) NOT NULL,
 price INT NOT NULL,
 admin_id INT,
 student_id INT
);

ALTER TABLE Lesson_price ADD CONSTRAINT PK_Lesson_price PRIMARY KEY (price_id);


CREATE TABLE Scheduled_lesson (
 sl_id INT NOT NULL,
 genre CHAR(10) NOT NULL,
 price INT NOT NULL,
 time TIMESTAMP(10) NOT NULL,
 max_limit_of_students INT NOT NULL,
 min_limit_of_students INT NOT NULL,
 instructor_id INT NOT NULL,
 price_id INT NOT NULL
);

ALTER TABLE Scheduled_lesson ADD CONSTRAINT PK_Scheduled_lesson PRIMARY KEY (sl_id);


CREATE TABLE sibling_with (
 student_id_1 INT NOT NULL,
 student_id_2 INT NOT NULL
);

ALTER TABLE sibling_with ADD CONSTRAINT PK_sibling_with PRIMARY KEY (student_id_1,student_id_2);


CREATE TABLE Student_guardian (
 student_id INT NOT NULL,
 guardian_id INT NOT NULL
);

ALTER TABLE Student_guardian ADD CONSTRAINT PK_Student_guardian PRIMARY KEY (student_id,guardian_id);


CREATE TABLE advance_audition (
 aa_id INT NOT NULL,
 student_id INT NOT NULL,
 instructor_id INT NOT NULL,
 result CHAR(4) NOT NULL,
 time TIMESTAMP(10),
 instrument_id INT
);

ALTER TABLE advance_audition ADD CONSTRAINT PK_advance_audition PRIMARY KEY (aa_id);


CREATE TABLE ensemble (
 ensemble_id INT NOT NULL,
 instrument_id INT NOT NULL,
 sl_id INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (ensemble_id);


CREATE TABLE group_lesson (
 group_lesson_id INT NOT NULL,
 instrument_id INT NOT NULL,
 sl_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id);


CREATE TABLE individual_lesson (
 individual_lesson_id INT NOT NULL,
 instrument_id INT NOT NULL,
 sl_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_lesson_id);


ALTER TABLE phone ADD CONSTRAINT FK_phone_0 FOREIGN KEY (id) REFERENCES personal_data (id);


ALTER TABLE rental_instrument ADD CONSTRAINT FK_rental_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE rental_instrument ADD CONSTRAINT FK_rental_instrument_1 FOREIGN KEY (rental_id) REFERENCES rental (rental_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (personal_data_id) REFERENCES personal_data (id);


ALTER TABLE student_rental ADD CONSTRAINT FK_student_rental_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_rental ADD CONSTRAINT FK_student_rental_1 FOREIGN KEY (rental_id) REFERENCES rental (rental_id);


ALTER TABLE administration ADD CONSTRAINT FK_administration_0 FOREIGN KEY (school_id) REFERENCES school (school_id);
ALTER TABLE administration ADD CONSTRAINT FK_administration_1 FOREIGN KEY (id) REFERENCES personal_data (id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (admin_id) REFERENCES administration (admin_id);
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE email ADD CONSTRAINT FK_email_0 FOREIGN KEY (id) REFERENCES personal_data (id);


ALTER TABLE guardian ADD CONSTRAINT FK_guardian_0 FOREIGN KEY (personal_data_id) REFERENCES personal_data (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (personal_data_id) REFERENCES personal_data (id);
ALTER TABLE instructor ADD CONSTRAINT FK_instructor_1 FOREIGN KEY (school_id) REFERENCES school (school_id);


ALTER TABLE instructor_salary ADD CONSTRAINT FK_instructor_salary_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE instructor_salary ADD CONSTRAINT FK_instructor_salary_1 FOREIGN KEY (salary_id) REFERENCES salary (salary_id);


ALTER TABLE instrument_skill ADD CONSTRAINT FK_instrument_skill_0 FOREIGN KEY (personal_data_id) REFERENCES personal_data (id);


ALTER TABLE invoice ADD CONSTRAINT FK_invoice_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE Lesson_price ADD CONSTRAINT FK_Lesson_price_0 FOREIGN KEY (admin_id) REFERENCES administration (admin_id);
ALTER TABLE Lesson_price ADD CONSTRAINT FK_Lesson_price_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE Scheduled_lesson ADD CONSTRAINT FK_Scheduled_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE Scheduled_lesson ADD CONSTRAINT FK_Scheduled_lesson_1 FOREIGN KEY (price_id) REFERENCES Lesson_price (price_id);


ALTER TABLE sibling_with ADD CONSTRAINT FK_sibling_with_0 FOREIGN KEY (student_id_1) REFERENCES student (student_id);
ALTER TABLE sibling_with ADD CONSTRAINT FK_sibling_with_1 FOREIGN KEY (student_id_2) REFERENCES student (student_id);


ALTER TABLE Student_guardian ADD CONSTRAINT FK_Student_guardian_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE Student_guardian ADD CONSTRAINT FK_Student_guardian_1 FOREIGN KEY (guardian_id) REFERENCES guardian (guardian_id);


ALTER TABLE advance_audition ADD CONSTRAINT FK_advance_audition_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE advance_audition ADD CONSTRAINT FK_advance_audition_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE advance_audition ADD CONSTRAINT FK_advance_audition_2 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (sl_id) REFERENCES Scheduled_lesson (sl_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (sl_id) REFERENCES Scheduled_lesson (sl_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (sl_id) REFERENCES Scheduled_lesson (sl_id);


