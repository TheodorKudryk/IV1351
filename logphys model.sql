DROP TABLE IF EXISTS "ensamble" CASCADE;
DROP TABLE IF EXISTS "group_lesson" CASCADE;
DROP TABLE IF EXISTS "individual_lesson" CASCADE;
DROP TABLE IF EXISTS "instructor" CASCADE;
DROP TABLE IF EXISTS "instructor_ensamble" CASCADE;
DROP TABLE IF EXISTS "instructor_group_lesson" CASCADE;
DROP TABLE IF EXISTS "instructor_individual_lesson" CASCADE;
DROP TABLE IF EXISTS "instrument" CASCADE;
DROP TABLE IF EXISTS "instrument_skill" CASCADE;
DROP TABLE IF EXISTS "personal_data" CASCADE;
DROP TABLE IF EXISTS "phone" CASCADE;
DROP TABLE IF EXISTS "quantity_of_instrument" CASCADE;
DROP TABLE IF EXISTS "salary" CASCADE;
DROP TABLE IF EXISTS "school" CASCADE;
DROP TABLE IF EXISTS "skill_of_instructor" CASCADE;
DROP TABLE IF EXISTS "student" CASCADE;
DROP TABLE IF EXISTS "student_ensamble" CASCADE;
DROP TABLE IF EXISTS "student_group_lesson" CASCADE;
DROP TABLE IF EXISTS "student_individual_lesson" CASCADE;
DROP TABLE IF EXISTS "students_nr_of_siblings" CASCADE;
DROP TABLE IF EXISTS "audition" CASCADE;
DROP TABLE IF EXISTS "available_spots" CASCADE;
DROP TABLE IF EXISTS "available_time_slots" CASCADE;
DROP TABLE IF EXISTS "email" CASCADE;
DROP TABLE IF EXISTS "ensamble_instrument" CASCADE;
DROP TABLE IF EXISTS "group_lesson_instrument" CASCADE;
DROP TABLE IF EXISTS "individual_lesson_instrument" CASCADE;
DROP TABLE IF EXISTS "nr_of_children_of_guardian" CASCADE;
DROP TABLE IF EXISTS "rental" CASCADE;
DROP TABLE IF EXISTS "rental_instrument" CASCADE;
DROP TABLE IF EXISTS "skill_of_student" CASCADE;
DROP TABLE IF EXISTS "students_in_queue" CASCADE;
DROP TABLE IF EXISTS "two_item_policy" CASCADE;
DROP TABLE IF EXISTS "administration" CASCADE;
DROP TABLE IF EXISTS "application" CASCADE;
DROP TABLE IF EXISTS "booking" CASCADE;
DROP TABLE IF EXISTS "pricing_scheme" CASCADE;
DROP TABLE IF EXISTS "amount_of_lesson" CASCADE;
DROP TABLE IF EXISTS "invoice" CASCADE;

CREATE TABLE ensamble (
 ensamble_id INT NOT NULL,
 genre CHAR(10) NOT NULL,
 price INT,
 time TIMESTAMP(10) NOT NULL,
 max_limit_of_students INT NOT NULL,
 min_limit_of_students INT NOT NULL
);

ALTER TABLE ensamble ADD CONSTRAINT PK_ensamble PRIMARY KEY (ensamble_id);



CREATE TABLE group_lesson (
 group_lesson_id INT NOT NULL,
 price INT,
 time TIMESTAMP(10) NOT NULL,
 max_limit_of_students INT NOT NULL,
 min_limit_of_students INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id);


CREATE TABLE individual_lesson (
 individual_lesson_id INT NOT NULL,
 max_limit_of_students INT NOT NULL,
 price INT,
 time TIMESTAMP(10) NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_lesson_id);


CREATE TABLE instructor (
 instructor_id CHAR(10) NOT NULL,
 employment_ID VARCHAR(50) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_ensamble (
 instructor_id CHAR(10) NOT NULL,
 ensamble_id INT NOT NULL
);

ALTER TABLE instructor_ensamble ADD CONSTRAINT PK_instructor_ensamble PRIMARY KEY (instructor_id,ensamble_id);


CREATE TABLE instructor_group_lesson (
 instructor_id CHAR(10) NOT NULL,
 group_lesson_id INT NOT NULL
);

ALTER TABLE instructor_group_lesson ADD CONSTRAINT PK_instructor_group_lesson PRIMARY KEY (instructor_id,group_lesson_id);


CREATE TABLE instructor_individual_lesson (
 instructor_id CHAR(10) NOT NULL,
 individual_lesson_id INT NOT NULL
);

ALTER TABLE instructor_individual_lesson ADD CONSTRAINT PK_instructor_individual_lesson PRIMARY KEY (instructor_id,individual_lesson_id);


CREATE TABLE instrument (
 instrument_id INT NOT NULL,
 brand VARCHAR(50) NOT NULL,
 type VARCHAR(10) NOT NULL,
 leaseability VARCHAR(5) NOT NULL,
 availability VARCHAR(5) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE instrument_skill (
 instrument_skill_id INT NOT NULL,
 instrument_type VARCHAR(20),
 level_of_skill VARCHAR(20)
);

ALTER TABLE instrument_skill ADD CONSTRAINT PK_instrument_skill PRIMARY KEY (instrument_skill_id);


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
 phone_nr VARCHAR(20) NOT NULL,
 personal_data_id INT NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (phone_nr,personal_data_id);


CREATE TABLE quantity_of_instrument (
 instrument_id INT NOT NULL,
 nr_of_instruments INT NOT NULL
);

ALTER TABLE quantity_of_instrument ADD CONSTRAINT PK_quantity_of_instrument PRIMARY KEY (instrument_id);


CREATE TABLE salary (
 amount VARCHAR(10) NOT NULL,
 instructor_id CHAR(10) NOT NULL
);

ALTER TABLE salary ADD CONSTRAINT PK_salary PRIMARY KEY (amount,instructor_id);


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


CREATE TABLE skill_of_instructor (
 instructor_id CHAR(10) NOT NULL,
 instrument_skill_id INT NOT NULL
);

ALTER TABLE skill_of_instructor ADD CONSTRAINT PK_skill_of_instructor PRIMARY KEY (instructor_id,instrument_skill_id);


CREATE TABLE student (
 student_id INT NOT NULL,
 reached_rental_limit CHAR(10) NOT NULL,
 personal_data_id INT NOT NULL,
 school_id INT
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE student_ensamble (
 ensamble_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_ensamble ADD CONSTRAINT PK_student_ensamble PRIMARY KEY (ensamble_id,student_id);


CREATE TABLE student_group_lesson (
 student_id INT NOT NULL,
 group_lesson_id INT NOT NULL
);

ALTER TABLE student_group_lesson ADD CONSTRAINT PK_student_group_lesson PRIMARY KEY (student_id,group_lesson_id);


CREATE TABLE student_individual_lesson (
 student_id INT NOT NULL,
 individual_lesson_id INT NOT NULL
);

ALTER TABLE student_individual_lesson ADD CONSTRAINT PK_student_individual_lesson PRIMARY KEY (student_id,individual_lesson_id);


CREATE TABLE student_nr_of_siblings (
 nr_of_siblings INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_nr_of_siblings ADD CONSTRAINT PK_student_nr_of_siblings PRIMARY KEY (nr_of_siblings,student_id);


CREATE TABLE audition (
 audition_id INT NOT NULL,
 student_id INT NOT NULL,
 grade VARCHAR(4) NOT NULL,
 instrument VARCHAR(29) NOT NULL
);

ALTER TABLE audition ADD CONSTRAINT PK_audition PRIMARY KEY (audition_id,student_id);


CREATE TABLE available_spots (
 school_id INT NOT NULL,
 places_of_admission VARCHAR(10) NOT NULL
);

ALTER TABLE available_spots ADD CONSTRAINT PK_available_spots PRIMARY KEY (school_id);


CREATE TABLE available_time_slots (
 available_time_slots INT NOT NULL,
 instructor_id CHAR(10) NOT NULL
);

ALTER TABLE available_time_slots ADD CONSTRAINT PK_available_time_slots PRIMARY KEY (available_time_slots,instructor_id);


CREATE TABLE email (
 email VARCHAR(40) NOT NULL,
 personal_data_id INT NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (email,personal_data_id);


CREATE TABLE ensamble_instrument (
 instrument_id INT NOT NULL,
 ensamble_id INT NOT NULL
);

ALTER TABLE ensamble_instrument ADD CONSTRAINT PK_ensamble_instrument PRIMARY KEY (instrument_id,ensamble_id);


CREATE TABLE group_lesson_instrument (
 instrument_id INT NOT NULL,
 group_lesson_id INT NOT NULL
);

ALTER TABLE group_lesson_instrument ADD CONSTRAINT PK_group_lesson_instrument PRIMARY KEY (instrument_id,group_lesson_id);


CREATE TABLE individual_lesson_instrument (
 instrument_id INT NOT NULL,
 individual_lesson_id INT NOT NULL
);

ALTER TABLE individual_lesson_instrument ADD CONSTRAINT PK_individual_lesson_instrument PRIMARY KEY (instrument_id,individual_lesson_id);


CREATE TABLE nr_of_children_of_guardian (
 nr_of_children_person_is_guardian_of INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE nr_of_children_of_guardian ADD CONSTRAINT PK_nr_of_children_of_guardian PRIMARY KEY (nr_of_children_person_is_guardian_of,student_id);


CREATE TABLE rental (
 student_id INT NOT NULL,
 rental_id INT NOT NULL,
 delivery VARCHAR(10),
 rental_fee VARCHAR(10) NOT NULL,
 rental_period VARCHAR(10) NOT NULL
);

ALTER TABLE rental ADD CONSTRAINT PK_rental PRIMARY KEY (student_id,rental_id);


CREATE TABLE rental_instrument (
 student_id INT NOT NULL,
 rental_id INT NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE rental_instrument ADD CONSTRAINT PK_rental_instrument PRIMARY KEY (student_id,rental_id,instrument_id);


CREATE TABLE skill_of_student (
 student_id INT NOT NULL,
 instrument_skill_id INT NOT NULL
);

ALTER TABLE skill_of_student ADD CONSTRAINT PK_skill_of_student PRIMARY KEY (student_id,instrument_skill_id);


CREATE TABLE students_in_queue (
 school_id INT NOT NULL,
 nr_of_students_in_queue VARCHAR(5) NOT NULL
);

ALTER TABLE students_in_queue ADD CONSTRAINT PK_students_in_queue PRIMARY KEY (school_id);


CREATE TABLE two_item_policy (
 student_id INT NOT NULL,
 rental_id INT NOT NULL,
 nr_of_items INT NOT NULL
);

ALTER TABLE two_item_policy ADD CONSTRAINT PK_two_item_policy PRIMARY KEY (student_id,rental_id);


CREATE TABLE administration (
 school_id INT NOT NULL
);

ALTER TABLE administration ADD CONSTRAINT PK_administration PRIMARY KEY (school_id);


CREATE TABLE application (
 application_id INT NOT NULL,
 school_id INT NOT NULL,
 student_id INT NOT NULL,
 accepted VARCHAR(10),
 declined VARCHAR(10)
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (application_id,school_id,student_id);


CREATE TABLE booking (
 school_id INT NOT NULL,
 booking_id INT NOT NULL,
 instructor_employment_id VARCHAR(50) NOT NULL,
 lesson_type VARCHAR(50) NOT NULL
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (school_id,booking_id);


CREATE TABLE pricing_scheme (
 school_id INT NOT NULL,
 pricing_scheme_id INT NOT NULL,
 skill_level VARCHAR(15) NOT NULL,
 lesson_type VARCHAR(20) NOT NULL,
 day_of_week VARCHAR(10) NOT NULL
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (school_id,pricing_scheme_id);


CREATE TABLE amount_of_lesson (
 school_id INT NOT NULL,
 booking_id INT NOT NULL,
 lessons_taken INT NOT NULL
);

ALTER TABLE amount_of_lesson ADD CONSTRAINT PK_amount_of_lesson PRIMARY KEY (school_id,booking_id);


CREATE TABLE invoice (
 student_id INT NOT NULL,
 school_id INT NOT NULL,
 booking_id INT NOT NULL,
 pricing_scheme_id INT NOT NULL,
 amount VARCHAR(10),
 sibling_discount VARCHAR(10)
);

ALTER TABLE invoice ADD CONSTRAINT PK_invoice PRIMARY KEY (student_id,school_id,booking_id,pricing_scheme_id);


ALTER TABLE instructor_ensamble ADD CONSTRAINT FK_instructor_ensamble_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE instructor_ensamble ADD CONSTRAINT FK_instructor_ensamble_1 FOREIGN KEY (ensamble_id) REFERENCES ensamble (ensamble_id);


ALTER TABLE instructor_group_lesson ADD CONSTRAINT FK_instructor_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE instructor_group_lesson ADD CONSTRAINT FK_instructor_group_lesson_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id);


ALTER TABLE instructor_individual_lesson ADD CONSTRAINT FK_instructor_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE instructor_individual_lesson ADD CONSTRAINT FK_instructor_individual_lesson_1 FOREIGN KEY (individual_lesson_id) REFERENCES individual_lesson (individual_lesson_id);


ALTER TABLE phone ADD CONSTRAINT FK_phone_0 FOREIGN KEY (personal_data_id) REFERENCES personal_data (id);


ALTER TABLE quantity_of_instrument ADD CONSTRAINT FK_quantity_of_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE salary ADD CONSTRAINT FK_salary_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE skill_of_instructor ADD CONSTRAINT FK_skill_of_instructor_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE skill_of_instructor ADD CONSTRAINT FK_skill_of_instructor_1 FOREIGN KEY (instrument_skill_id) REFERENCES instrument_skill (instrument_skill_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (personal_data_id) REFERENCES personal_data (id);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (school_id) REFERENCES school (school_id);


ALTER TABLE student_ensamble ADD CONSTRAINT FK_student_ensamble_0 FOREIGN KEY (ensamble_id) REFERENCES ensamble (ensamble_id);
ALTER TABLE student_ensamble ADD CONSTRAINT FK_student_ensamble_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_group_lesson ADD CONSTRAINT FK_student_group_lesson_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id);


ALTER TABLE student_individual_lesson ADD CONSTRAINT FK_student_individual_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE student_individual_lesson ADD CONSTRAINT FK_student_individual_lesson_1 FOREIGN KEY (individual_lesson_id) REFERENCES individual_lesson (individual_lesson_id);


ALTER TABLE student_nr_of_siblings ADD CONSTRAINT FK_student_nr_of_siblings_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE audition ADD CONSTRAINT FK_audition_0 FOREIGN KEY (audition_id) REFERENCES student (student_id);


ALTER TABLE available_spots ADD CONSTRAINT FK_available_spots_0 FOREIGN KEY (school_id) REFERENCES school (school_id);


ALTER TABLE available_time_slots ADD CONSTRAINT FK_available_time_slots_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE email ADD CONSTRAINT FK_email_0 FOREIGN KEY (personal_data_id) REFERENCES personal_data (id);


ALTER TABLE ensamble_instrument ADD CONSTRAINT FK_ensamble_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE ensamble_instrument ADD CONSTRAINT FK_ensamble_instrument_1 FOREIGN KEY (ensamble_id) REFERENCES ensamble (ensamble_id);


ALTER TABLE group_lesson_instrument ADD CONSTRAINT FK_group_lesson_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE group_lesson_instrument ADD CONSTRAINT FK_group_lesson_instrument_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id);


ALTER TABLE individual_lesson_instrument ADD CONSTRAINT FK_individual_lesson_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE individual_lesson_instrument ADD CONSTRAINT FK_individual_lesson_instrument_1 FOREIGN KEY (individual_lesson_id) REFERENCES individual_lesson (individual_lesson_id);


ALTER TABLE nr_of_children_of_guardian ADD CONSTRAINT FK_nr_of_children_of_guardian_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE rental ADD CONSTRAINT FK_rental_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE rental_instrument ADD CONSTRAINT FK_rental_instrument_0 FOREIGN KEY (student_id,rental_id) REFERENCES rental (student_id,rental_id);
ALTER TABLE rental_instrument ADD CONSTRAINT FK_rental_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE skill_of_student ADD CONSTRAINT FK_skill_of_student_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE skill_of_student ADD CONSTRAINT FK_skill_of_student_1 FOREIGN KEY (instrument_skill_id) REFERENCES instrument_skill (instrument_skill_id);


ALTER TABLE students_in_queue ADD CONSTRAINT FK_students_in_queue_0 FOREIGN KEY (school_id) REFERENCES available_spots (school_id);


ALTER TABLE two_item_policy ADD CONSTRAINT FK_two_item_policy_0 FOREIGN KEY (student_id,rental_id) REFERENCES rental (student_id,rental_id);


ALTER TABLE administration ADD CONSTRAINT FK_administration_0 FOREIGN KEY (school_id) REFERENCES school (school_id);
ALTER TABLE administration ADD CONSTRAINT FK_administration_1 FOREIGN KEY (school_id) REFERENCES students_in_queue (school_id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (school_id) REFERENCES administration (school_id);
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (school_id) REFERENCES administration (school_id);


ALTER TABLE pricing_scheme ADD CONSTRAINT FK_pricing_scheme_0 FOREIGN KEY (school_id) REFERENCES administration (school_id);


ALTER TABLE amount_of_lesson ADD CONSTRAINT FK_amount_of_lesson_0 FOREIGN KEY (school_id,booking_id) REFERENCES booking (school_id,booking_id);


ALTER TABLE invoice ADD CONSTRAINT FK_invoice_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE invoice ADD CONSTRAINT FK_invoice_1 FOREIGN KEY (school_id,booking_id) REFERENCES amount_of_lesson (school_id,booking_id);
ALTER TABLE invoice ADD CONSTRAINT FK_invoice_2 FOREIGN KEY (school_id,pricing_scheme_id) REFERENCES pricing_scheme (school_id,pricing_scheme_id);


