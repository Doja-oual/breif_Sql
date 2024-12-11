CREATE DATABASE hospitalManagment;

USE hospitalManagment;
CREATE TABLE departments (
   id INT(11) PRIMARY KEY AUTO_INCREMENT,
   department_name VARCHAR(50),
   location VARCHAR(100)
);

CREATE TABLE staff (
    staff_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    department_id INT(11),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE doctors (
    doctor_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    department_id INT(11),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE patients (
    patient_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE appointments (
    appointment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    appointment_date DATE,
    appointment_time TIME,
    doctor_id INT(11),
    patient_id INT(11),
    reason VARCHAR(255),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE medications (
    medication_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    medication_name VARCHAR(100),
    dosage VARCHAR(50)
);

CREATE TABLE prescriptions (
    prescription_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    patient_id INT(11),
    doctor_id INT(11),
    medication_id INT(11),
    prescription_date DATE,
    dosage_instructions VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);

CREATE TABLE rooms (
    room_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10),
    room_type ENUM('General', 'Private', 'ICU'),
    availability TINYINT(1)
);

CREATE TABLE admissions (
    admission_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    patient_id INT(11),
    room_id INT(11),
    admission_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);


ALTER TABLE departments ADD UNIQUE(department_name);
ALTER TABLE staff ADD UNIQUE(phone_number);
ALTER TABLE staff ADD UNIQUE(email);
ALTER TABLE doctors ADD UNIQUE(phone_number);
ALTER TABLE doctors ADD UNIQUE(email);
ALTER TABLE patients ADD UNIQUE(phone_number);
ALTER TABLE medications ADD UNIQUE(medication_name);
ALTER TABLE rooms ADD UNIQUE(room_number);


INSERT INTO departments (department_name, location) VALUES 
('Cardiologie', 'Bâtiment A - Rabat'),
('Neurologie', 'Bâtiment B - Casablanca'),
('Oncologie', 'Bâtiment C - Marrakech');

INSERT INTO staff (first_name, last_name, job_title, phone_number, email, department_id) VALUES
('Ahmed', 'El Amrani', 'Infirmier', '0612345678', 'ahmed.elamrani@example.com', 1),
('Fatima', 'Boukhari', 'Technicienne', '0612345679', 'fatima.boukhari@example.com', 2);

INSERT INTO doctors (first_name, last_name, specialization, phone_number, email, department_id) VALUES
('Ali', 'Bensaid', 'Cardiologue', '0612345680', 'ali.bensaid@example.com', 1),
('Rachid', 'El Idrissi', 'Neurologue', '0612345681', 'rachid.elidrissi@example.com', 2);

INSERT INTO patients (first_name, last_name, gender, date_of_birth, phone_number, email, address) VALUES
('Yassir', 'El Khatib', 'Male', '1985-08-12', '0612345682', 'yassir.elkhatib@example.com', 'Boulevard Mohamed V, Casablanca'),
('Sanae', 'Said', 'Female', '1995-06-25', '0612345683', 'sanae.said@example.com', 'Rue Hassan II, Rabat');

INSERT INTO rooms (room_number, room_type, availability) VALUES
('101', 'Générale', 1),
('102', 'Privée', 1),
('103', 'USI', 0);

INSERT INTO medications (medication_name, dosage) VALUES
('Aspirine', '500mg'),
('Paracétamol', '250mg');

INSERT INTO appointments (appointment_date, appointment_time, doctor_id, patient_id, reason) VALUES
('2024-12-11', '09:00:00', 1, 1, 'Bilan de suivi'),
('2024-12-12', '11:30:00', 2, 2, 'Évaluation neurologique');

INSERT INTO prescriptions (patient_id, doctor_id, medication_id, prescription_date, dosage_instructions) VALUES
(1, 1, 1, '2024-12-10', 'Prendre un comprimé par jour'),
(2, 2, 2, '2024-12-10', 'Prendre deux comprimés après les repas');

INSERT INTO admissions (patient_id, room_id, admission_date, discharge_date) VALUES
(1, 1, '2024-12-01', '2024-12-07'),
(2, 2, '2024-12-05', NULL);


INSERT INTO patients(first_name,last_name,date_of_birth,gender,phone_number) VALUES
('Alex ','Johnson','1990-07-15','masculin','1234567890');

SELECT * FROM departments;

SELECT * FROM patients;


--ex3 trie tableux
SELECT * FROM patients
ORDER BY date_of_birth ASC ;

--ex4 Filtre tableux
SELECT DISTINCT gender
FROM patients;

SELECT * FROM medications
LIMIT 3;


INSERT INTO departments (department_name, location) VALUES
('Pédiatrie', 'Bâtiment F - Casablanca'),
('Dermatologie', 'Bâtiment G - Rabat'),
('Orthopédie', 'Bâtiment H - Marrakech'),
('Ophtalmologie', 'Bâtiment I - Tanger'),
('Dentisterie', 'Bâtiment J - Agadir');

SELECT * FROM doctors;

INSERT INTO doctors (first_name, last_name, specialization, phone_number, email, department_id) 
VALUES
('Mouad', 'Bennani', 'Pédiatre', '0612345691', 'mouad.bennani@example.com',21),
('Imane', 'Ziani', 'Dermatologue', '0612345692', 'imane.ziani@example.com',22),
('Youssef', 'Haddad', 'Orthopédiste', '0612345693', 'youssef.haddad@example.com',3);

SELECT * FROM departments;

SELECT * FROM doctors
ORDER BY first_name ASC
LIMIT 3 ;


SELECT * FROM patients
WHERE date_of_birth > '2000-01-01';

SELECT * FROM patients ;

SELECT * FROM patients
WHERE date_of_birth < '1995-01-01';

--ex7
SELECT * FROM doctors
WHERE department_id = (SELECT id FROM departments WHERE department_name = 'Cardiologie')
   OR department_id = (SELECT id FROM departments WHERE department_name = 'Neurologie');

----ex8 
SELECT * 
FROM admissions 
WHERE admission_date BETWEEN '2024-11-01' AND '2024-11-07';

-------ex9
SELECT first_name, last_name, date_of_birth,
       CASE 
           WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 18 THEN 'Enfant'
           WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 18 AND 60 THEN 'Adulte'
           ELSE 'Senior'
       END AS age_category
FROM patients;

----ex10
SELECT COUNT(*) AS total_appointments 
FROM appointments;

--ex11
SELECT department_id, COUNT(*) AS number_of_doctors
FROM doctors
GROUP BY department_id;




----ex12

SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS average_age
FROM patients;



--ex13
SELECT MAX(appointment_date) AS latest_appointment_date, 
       MAX(appointment_time) AS latest_appointment_time
FROM appointments;


----ex14
SELECT room_id, 
       SUM(1) AS total_admissions
FROM admissions
GROUP BY room_id;




----ex15
SELECT * 
FROM patients
WHERE email IS NULL OR email = '';

--ex16
---------

--ex17
DELETE FROM appointments 
WHERE appointment_date < '2024-01-01';

--ex18
UPDATE departments
SET department_name = 'Cancer Treatment'
WHERE department_name = 'Oncology';

---ex19

SELECT gender, COUNT(*) AS number_of_patients
FROM patients
GROUP BY gender
HAVING COUNT(*) >= 2;

----ex20
CREATE VIEW admissions_actives AS
SELECT 
    admission_id,
    patient_id,
    room_id,
    admission_date,
    discharge_date
FROM admissions
WHERE discharge_date IS NULL OR discharge_date >= CURRENT_DATE();
SELECT * FROM admissions_actives;

DROP VIEW active_admissions;


