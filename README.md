# sql-challenge - EmployeeSQL Analysis and Database Setup

## Contents
1. [Overview](#1-overview)  
2. [Repository](#2-repository)  
3. [Deployment](#3-deployment)  
4. [Data Query](#4-data-query)  
5. [References](#5-references)  


## 1. Overview
This project focuses on analysing historical employee data for Pewlett Hackard, a fictional company, using PostgreSQL. The primary objectives include designing an **Entity Relationship Diagram (ERD)**, creating a database schema, importing CSV data, and running SQL queries to answer key analytical questions. The dataset represents employees, their departments, titles, salaries, and managerial roles during the 1980s and 1990s.

---

## 2. Repository

### Structure
- **Main Folder**: [`EmployeeSQL`](EmployeeSQL)  
  - **ERD Diagram**: [`EmployeeSQL/erd.png`](EmployeeSQL/erd.png)
  - **ERD Text Description**: [`EmployeeSQL/erd.txt`](EmployeeSQL/erd.txt)
  - **Database Schema**: [`EmployeeSQL/schemata.sql`](EmployeeSQL/schemata.sql)
  - **SQL Queries**: [`EmployeeSQL/queries.sql`](EmployeeSQL/queries.sql)
- **Raw Data CSV Files**: [`Data`](Data)

### Database Name
- `EmployeeSQL`


## 3. Deployment
To set up and run the database and analysis:
1. Create a PostgreSQL database named `EmployeeSQL` in pgAdmin.
2. Load the schema by running `EmployeeSQL/schemata.sql`:
   - Ensure the tables are created in the correct order to manage foreign key dependencies.
3. Import the CSV data:
   - The CSV files should correspond to the tables created (e.g., `departments.csv` to `departments` table).
   - Follow this order: **departments**, **titles**, **employees**, **dept_emp**, **dept_manager**, **salaries**.
   - Enable headers during import for proper column alignment.
4. Load `queries.sql`:
   - Execute each section (1–8) to answer the analytical questions.
   - Read through comments for additional explanations or alternative solutions.


## 4. Data Query
SQL queries were executed to retrieve the following information:
1. The employee number, last name, first name, sex, and salary of each employee.
2. The first name, last name, and hire date for the employees who were hired in 1986.
3. The manager of each department along with their department number, department name, employee number, last name, and first name.
4. The department number for each employee along with that employee’s employee number, last name, first name, and department name.
5. The first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
6. Each employee in the Sales department, including their employee number, last name, and first name.
7. Each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. The frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).


## 5. References
- PostgreSQL Date and Time Functions: [Official Documentation](https://www.postgresql.org/docs/8.1/functions-datetime.html)  
- Data generated by Mockaroo, LLC: [Mockaroo Realistic Data Generator](https://mockaroo.com/)  
- Tool for ERD Creation: [QuickDBD - Quick Database Diagrams](http://www.quickdatabasediagrams.com/)  
