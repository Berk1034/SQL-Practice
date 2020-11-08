--LAB2-Variant3.

--TASK 1:
SELECT Employee.BusinessEntityID
	,JobTitle
	,Department.DepartmentID
	,Name
FROM [HumanResources].Employee
INNER JOIN [HumanResources].EmployeeDepartmentHistory ON Employee.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN [HumanResources].Department ON EmployeeDepartmentHistory.DepartmentID = Department.DepartmentID;

--TASK 2:
SELECT Department.DepartmentID
	,Department.Name
	,COUNT(EmployeeDepartmentHistory.DepartmentID) AS EmpCount
FROM [HumanResources].Department
INNER JOIN [HumanResources].EmployeeDepartmentHistory ON Department.DepartmentID = EmployeeDepartmentHistory.DepartmentID
GROUP BY Department.DepartmentID
	,Department.Name;

--TASK3:
SELECT JobTitle
	,EmployeePayHistory.Rate
	,EmployeePayHistory.RateChangeDate
	,CONCAT (
		'The rate for '
		,JobTitle
		,' was set to '
		,Rate
		,' at '
		,CONVERT(NVARCHAR(11), RateChangeDate, 106)
		) AS Report
FROM [HumanResources].Employee
INNER JOIN [HumanResources].EmployeePayHistory ON Employee.BusinessEntityID = EmployeePayHistory.BusinessEntityID;
