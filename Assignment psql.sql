-----Assignment-----------------
--Create Database
Drop table if exists Hospital_Data;

Create Table Hospital_Data(
Hospital_Name Varchar (100),
Location Varchar (50),
Department Varchar(50),
Doctors_Count Int ,
Patients_Count Int,
Admission_Date Date,
Discharge_Date Date,
Medical_Expenses Numeric(10,2)
);

Select * From Hospital_Data;

----Import data into the tables(BY USING IMPORT/EXPORT)

--1)Total Number of Patients
--Write an SQL query to find the total number of patients across all hospitals.
Select Sum(Patients_Count) As Total_Patients_Count
From Hospital_Data;


--2)Average Number of Doctors per Hospital
--Retrieve the average count of doctors available in each hospital.
Select * From Hospital_Data;
Select Hospital_Name,Avg(Doctors_Count) As Avg_Doctors_Count
From Hospital_Data
Group by Hospital_Name;


--3)Top 3 Departments with the Highest Number of Patients
-- Find the top 3 hospital departments that have the highest number of patients.
Select * From Hospital_Data;
Select Department,Sum(Patients_Count) As Total_Patients
From Hospital_Data
Group By Department
Order By Total_Patients desc Limit 3;

--4)Hospital with the Maximum Medical Expenses
--Identify the hospital that recorded the highest medical expenses.
Select Hospital_Name,Medical_Expenses As Highest_Medical_Expenses
From Hospital_Data
Order By Highest_medical_Expenses Desc Limit 1;


--5)Daily Average Medical Expenses
--Calculate the average medical expenses per day for each hospital.

Select Hospital_Name,
--(per day expenses = Medical_Expenses / Stay)
--(Stay=Discharge_Date - Admission_Date
Round(Avg(Medical_Expenses / (Discharge_Date::Date - Admission_Date::Date )),2)As Avg_Medical_Expenses_Per_Day
--::Date - Convert String into the Date type
FROM Hospital_Data
GROUP BY Hospital_Name;


--6) Longest Hospital Stay
--Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
Select * From Hospital_Data;
Select Hospital_Name,Location,Department,
(Discharge_Date::Date - Admission_Date::Date) As Longest_Stay
From Hospital_Data
Order By Longest_Stay Desc Limit 1;


--7)Total Patients Treated Per City
--Count the total number of patients treated in each city.
Select * From Hospital_Data;
Select Location,Sum(Patients_Count )As Total_Patients_Count
From Hospital_Data
Group By Location;


--8)Average Length of Stay Per Department
--Calculate the average number of days patients spend in each department.
Select * From Hospital_Data;
Select Department,Round(Avg(Discharge_Date - Admission_Date),2) As Avg_Spend_Days
From Hospital_Data
Group By Department;


--9)Identify the Department with the Lowest Number of Patients
--Find the department with the least number of patients.
Select * From Hospital_Data;
Select Department,Sum(Patients_Count )As Least_Patients
From Hospital_Data
Group By Department
Order By Least_Patients Asc Limit 1;

--10)Monthly Medical Expenses Report
--Group the data by month and calculate the total medical expenses for each month
SELECT 
    EXTRACT(MONTH FROM Admission_Date) AS Month,
    SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital_Data
GROUP BY  Month
ORDER BY  Month;

