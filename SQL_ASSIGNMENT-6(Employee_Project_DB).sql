CREATE TABLE Employee(EmployeeID INT,FirstName varchar(max), LastName VARCHAR(max),	Salary INT,	JoiningDate DATETIME, Department VARCHAR(max), Gender char(1))

INSERT INTO Employee VALUES(1,'Vikas','Ahlawat',600000,	'02/12/2013 11:16',	'IT','M'),
(2,'Nikita','Jain',	530000,	'02/14/2013 11:16',	'HR','F'),
(3,'Ashish','Kumar', 1000000,'02/14/2013 11:16','IT','M'),
(4,'Nikhil','Sharma', 480000, '02/15/2013 11:16', 'HR','M'),
(5, 'Anish','Kaidan', 500000,'02/16/2013 11:16','PayRoll','M')

--1) Write a query to get all employee detail from "EmployeeDetail" table

SELECT*FROM Employee

--2) Write a query to get only "FirstName" column from "EmployeeDetail" table

SELECT FIRSTNAME FROM Employee

--3) Write a query to get FirstName in upper case as "First Name".

SELECT UPPER(firstname) from Employee

--4) Write a query to get FirstName in upper case as "First Name".

SELECT UPPER(FIRSTNAME) FROM Employee

--5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)

SELECT FIRSTNAME + ' ' + LASTNAME AS NAME FROM Employee


--6) Select employee detail whose name is "Vikas

SELECT*FROM Employee
WHERE FirstName = 'VIKAS'

--7) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'

SELECT*FROM Employee
WHERE FirstName LIKE 'a%'

--8) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.

SELECT*FROM Employee
WHERE FirstName LIKE 'a%'

--9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'

SELECT*FROM Employee
where FirstName LIKE '%h'


--10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'

SELECT*FROM Employee
WHERE FirstName LIKE '[a-p]%'

--11)    Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'

SELECT*FROM Employee
WHERE FirstName NOT LIKE '[a-p]%'

/* 12) Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) 
Wildcard Character represents any single character*/

SELECT*FROM Employee
WHERE GENDER LIKE '__le'

--13) Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters

SELECT*FROM Employee
WHERE FirstName LIKE 'A____'

--14) Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".

SELECT*FROM Employee
WHERE FirstName LIKE '%[%]%'

SELECT*FROM Employee
WHERE FirstName LIKE 'Vik%as'

--15) Get all unique "Department" from EmployeeDetail table

SELECT DISTINCT Department FROM Employee

--16) Get the highest "Salary" from EmployeeDetail table.

SELECT MAX(SALARY) AS HighestSalary
FROM Employee

--17) Get the lowest "Salary" from EmployeeDetail table

SELECT MIN(SALARY) AS LowestSalary
FROM Employee

--18) Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013

SELECT FORMAT(JoiningDate, 'dd MMM yyyy') AS FORMATTEDJoiningDate
FROM Employee

--19) Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"

SELECT CONVERT(varchar(10),JoiningDate,111) AS FORMATTEDJoiningDate
from Employee

--20) Show only time part of the "JoiningDate"

SELECT CONVERT(time, joiningdate) as joiningtime
from Employee

--21) Get only Year part of "JoiningDate"

SELECT YEAR(joiningdate) as JoiningYear from Employee

--22) Get only Month part of "JoiningDate”

SELECT MONTH(JoiningDate) AS JoiningMonth from Employee

--23) Get system date

SELECT GETDATE() AS SystemCURRENTDATE

--24) Get UTC date

SELECT GETUTCDATE() AS CURRENTutcDATETIME

--a) Get the first name, current date, joiningdate and diff between current date and joining date in months.

SELECT FirstName,
CAST(GETDATE() AS DATE) AS CURRENTDATE,
CAST(joiningdate as date) as joiningdate,
DATEDIFF(month,joiningdate,GETDATE()) as monthsdifference
from employee

--25) Get the first name, current date, joining date, and diff between current date and joining date in days

SELECT FirstName,
CAST(GETDATE() as date) AS CurrentDate,
CAST(JoiningDate as date) as joiningdate,
DATEDIFF(Day,JoiningDate,GETDATE()) AS Daydifference
from employee

--26) Get all employee details from EmployeeDetail table whose joining year is 2013

SELECT*FROM Employee 
WHERE YEAR(JoiningDate) = 2013

--27) Get all employee details from EmployeeDetail table whose joining month is Jan(1)

SELECT*FROM Employee
WHERE MONTH(JoiningDate) = 1

--28) Get all employee details from EmployeeDetail table whose joining month is Jan(1)

SELECT*FROM Employee
WHERE MONTH(JoiningDate) = 1

--29) Get how many employee exist in "EmployeeDetail" table

SELECT COUNT(*) AS TotalEmployees
FROM Employee

--31). Select only one/top 1 record from "EmployeeDetail" table

SELECT top 1 * from Employee

--32. Select all employee detail with First name "Vikas","Ashish", and "Nikhil".

SELECT*FROM Employee
WHERE FirstName IN ('VIKAS','ASHISH','NIKHIL')

--33. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"

SELECT*FROM Employee
WHERE FirstName NOT IN ('VIKAS','ASHISH','NIKHIL')

--34. Select first name from "EmployeeDetail" table after removing white spaces from right side

SELECT RTRIM(FIRSTNAME) AS FirstNameTrimmed
from Employee

--35. Select first name from "EmployeeDetail" table after removing white spaces from left side

SELECT LTRIM(FirstName) AS FirstNameTrimmed
FROM Employee

--36. Display first name and Gender as M/F.(if male then M, if Female then F)

SELECT FirstName,
case 
WHEN Gender = 'MALE' THEN 'M'
WHEN GENDER = 'FEMALE' THEN 'F'
ELSE 'OTHER'
END AS GenderIntial
from Employee

--37. Select first name from "EmployeeDetail" table prifixed with "Hello

SELECT 'Hello ' + FirstName AS GREETINGNAME
FROM Employee

--38. Get employee details from "EmployeeDetail" table whose Salary greater than 600000

SELECT*FROM Employee
WHERE Salary > 600000

--39. Get employee details from "EmployeeDetail" table whose Salary less than 700000

SELECT*FROM Employee
WHERE Salary < 700000

--40. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000

SELECT*FROM Employee
WHERE Salary BETWEEN 500000 AND 600000

---------------------------------------------------------------------------------------------------------------------------------------------------

--41. Give records of ProjectDetail table

CREATE TABLE Project(ProjectDetailID int PRIMARY KEY, EmployeeDetailID INT,	ProjectName varchar(100))

INSERT INTO Project VALUES(1,1,'Task Track'),
(2,1,'CLP'), (3,1,'Survey Managment'),(4,2,'HR Managment'),
(5,3,'Task Track'),(6,3,'GRS'),(7,3,'DDS'),
(8,4,'HR Managment'),(9,6,'GL Managment')

--42. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.

SELECT DEPARTMENT,
SUM(SALARY) AS TotalSalary
FROM Employee
GROUP BY Department

--43. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.

SELECT DEPARTMENT,
SUM(SALARY) AS TotalSalary
FROM Employee
group BY Department
ORDER by TotalSalary ASC

--44. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary

SELECT DEPARTMENT,
SUM(SALARY) AS TotalSalary
FROM Employee
GROUP BY Department
ORDER BY DESC

--45. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.

SELECT DEPARTMENT,
COUNT(*) AS TotalDepartment,
SUM(SALARY) AS TotalSalary
FROM Employee
GROUP BY Department

--46. Get department wise average salary from "EmployeeDetail" table order by salary ascending

SELECT Department,
AVG(SALARY) AS AverageSalary
FROM Employee
GROUP BY Department
ORDER by AverageSalary ASC


--47 . Get department wise maximum salary from "EmployeeDetail" table order by salary ascending

SELECT DEPARTMENT,
MAX(SALARY) AS MaxSalary
FROM Employee
group by Department
order by MaxSalary ASC


--48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.

SELECT DEPARTMENT,
MIN(SALARY) AS MinimunSalary
FROM Employee
GROUP by Department
order by MinimunSalary ASC

--49. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending

SELECT department,
MIN(salary) AS MinimumSalary
FROM Employee
group by Department
ORDER by MinimumSalary ASC

--50. Join both the table that is Employee and ProjectDetail based on some common paramter

SELECT E.EmployeeID,E.FIRSTNAME,E.LASTNAME,E.DEPARTMENT,E.SALARY,
P.ProjectDetailID,P.ProjectName
FROM Employee E 
INNER JOIN Project P 
ON E.EmployeeID = P.ProjectDetailID

--51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.

SELECT E.firstname, P.ProjectName
FROM Employee E 
INNER JOIN Project P 
ON E.EmployeeID = P.ProjectDetailID
ORDER BY E.FirstName 

--52. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.

SELECT E.FIRSTNAME,P.PROJECTNAME
FROM Employee E
LEFT JOIN Project P 
ON E.EmployeeID = P.ProjectDetailID
ORDER BY E.FirstName

--53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"

SELECT E.FirstName,
COALESCE(P.ProjectName, '-No Project Assigned') AS ProjectName
FROM Employee E 
LEFT JOIN Project P 
ON E.EmployeeID = P.ProjectDetailID
ORDER BY E.FirstName


--54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail

SELECT E.FirstName,P.ProjectName
FROM Employee E 
RIGHT JOIN Project P
ON E.EmployeeID = P.ProjectDetailID
ORDER BY E.FirstName

--55. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL

SELECT E.FirstName + ' ' + E.LastName as EmployeeName,
P.ProjectName 
FROM employee E 
FULL OUTER JOIN PROJECT P 
ON E.EmployeeID = P.ProjectDetailID

--56. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL

SELECT E.FirstName + ' ' + E.LastName AS EmployeeName,
P.ProjectName
FROM Employee E 
FULL OUTER JOIN Project P 
ON E.EmployeeID = P.ProjectDetailID

--57.Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL

SELECT E.FirstName + ' ' + E.LastName,
P.ProjectName
FROM Employee E 
FULL OUTER JOIN Project P 
ON E.EmployeeID = P.ProjectDetailID

--58.Write down the query to fetch EmployeeName & Project who has assign more than one project

SELECT E.FirstName + ' ' + E.LastName AS EmployeeName,
P.ProjectName
FROM Employee E 
INNER JOIN Project P
ON E.EmployeeID = P.ProjectDetailID
WHERE P.EmployeeDetailID IN (
    SELECT EmployeeDetailID
    FROM Project
    GROUP by EmployeeDetailID
    Having COUNT(ProjectDetailID) > 1
)
ORDER BY EmployeeName


--59. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName

SELECT E.FirstName + ' ' + E.LastName AS EmployeeName,
P.ProjectName
FROM Employee E 
INNER JOIN Project P 
ON E.EmployeeID = P.ProjectDetailID
WHERE P.ProjectName In (
    SELECT ProjectName
    FROM Project
    Group BY ProjectName
    Having COUNT(distinct ProjectDetailID) > 1
)
ORDER By P.ProjectName,EmployeeName

--60. Apply Cross Join in Both the tables

SELECT E.FirstName + ' ' + E.LastName AS EmployeeName,
P.ProjectName
FROM Employee E 
CROSS JOIN Project P 

