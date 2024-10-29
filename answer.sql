-- Part 1: INSERT Data
-- 1.1). Add a new patient with the following details
-- First Name: John
-- Second Name: Doe
-- Date of Birth: 15-11-1980
-- Gender: Male
-- Language: English

INSERT INTO patients 
	(first_name, last_name, date_of_birth, gender, language)
VALUES
	('John','Doe', '1980-11-15', 'Male', 'English');

-- Part 2: UPDATE Data
-- 2.1). Write a query to change John Doe's languge from "English" to "Spanish"

UPDATE patients
SET language='Spanish'
WHERE patient_id=946;

-- Part 3: DELETE Data
-- 3.1). Delete the patient with the patient_id number 10
DELETE FROM patients
WHERE patient_id = 10;

-- Part 4: Handling NULL Values
-- 4.1). Write a query to find that takes all the names and the emails of the providers and if any of them has a NULL email, replace it with N/A
SELECT first_name, last_name, 
	IFNULL(email_address, 'N/A') AS email_contact
FROM providers;

-- 4.2). Write a query that takes the names and contact details of the provider whether phone number or email and if any of the two is missing, 
-- replace it with Missing details
SELECT first_name, last_name, 
	COALESCE(email_address, phone_number, 'Missing details') AS needed_details
FROM providers;

-- Bonus question(Optional)
-- Write a query to retrieve all providers whose speciality is pediatrics and they are missing either of the contact details.
SELECT *
FROM providers
WHERE provider_specialty = 'Pediatrics'
	AND (email_address IS NULL OR phone_number IS NULL);

