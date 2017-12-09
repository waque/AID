create or replace view all_employees (employeeid, firstname, lastname, dob, jobtitle, reportto, salary) as
	(select employeeid, firstname, lastname, dob, jobtitle, reportto, salary from company.employees)
	union
	(select EmployeeID, FirstName, LastName, BirthDate, Title, ReportsTo, Salary from northwind.Employees);



create or replace view all_adress_info(employeeid, city, state, country, postalcode) as
	(select employeeid, city, state, country, postalcode from company.branches natural join company.employees)
	union
	(select EmployeeID, City, Region, Country, PostalCode  from northwind.Employees);


create or replace view all_territories (employeeid, territory) as
	(select employeeid, city from company.branches natural join company.employees)
	union
	(select EmployeeID, TerritoryDescription from northwind.EmployeeTerritories natural join northwind.Territories);


