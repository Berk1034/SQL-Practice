--LAB1-Variant3.

--TASK 1:
SELECT DepartmentID
	,Name
FROM [HumanResources].Department
WHERE Name LIKE 'P%';

--TASK 2:
SELECT BusinessEntityID
	,JobTitle
	,Gender
	,VacationHours
	,SickLeaveHours
FROM [HumanResources].Employee
WHERE VacationHours BETWEEN 10
		AND 13;

--TASK 3:
SELECT HireDateMonth
FROM [HumanResources].Employee
/*WHERE MONTH(HireDate) = 7
*/
WHERE HireDateMonth = 7
ORDER BY BusinessEntityID ASC OFFSET 3 ROWS

FETCH NEXT 5 ROWS ONLY;

ALTER TABLE [HumanResources].Employee
ADD HireDateMonth as MONTH(HireDate);

ALTER TABLE [HumanResources].Employee
DROP COLUMN HireDateMonth;

CREATE INDEX ix_Month ON [HumanResources].Employee(HireDateMonth);

DROP INDEX [HumanResources].Employee.ix_Month;

SELECT BusinessEntityID
	,JobTitle
	,Gender
	,BirthDate
	,HireDate
FROM [HumanResources].Employee
WHERE MONTH(HireDate) = 7
ORDER BY BusinessEntityID ASC OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY;
