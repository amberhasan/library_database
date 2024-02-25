-- Insert my name into the Employee table
INSERT INTO EMPLOYEE (fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES ('Amber', 'M', 'Hasan', '111111111', '1995-08-16', '2439 Micarta Drive', 'F', '100000.00', NULL, '6');

-- Query to show that my record was added
SELECT * FROM EMPLOYEE WHERE ssn = '111111111';

-- Update my supervisor
UPDATE EMPLOYEE
SET superssn = '111111100'
WHERE ssn = '111111111';

-- Query to show that my record was added
SELECT * FROM EMPLOYEE WHERE ssn = '111111111';