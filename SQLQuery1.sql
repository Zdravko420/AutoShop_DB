/* ��������� ������ ����� � ��� ���� �����
CREATE DATABASE CarDealership;
*/

/* Tables - ��������� ���������, �� ���������� �����-� �� �� �������� ��������� ����� ���������� ������� �� �� ���������� �������� �����, ������ �� ������ Primary Key
CREATE TABLE AvailableCars(Model NVARCHAR(255) PRIMARY KEY, Quantity FLOAT)
CREATE TABLE Sales(Model NVARCHAR(255) PRIMARY KEY, CustomOrders FLOAT, Sales FLOAT, Deliveries FLOAT, [Date] DATE)
CREATE TABLE CarSpecs(Model NVARCHAR(255) PRIMARY KEY, YearOfManufacture INT, Horsepower INT, Price FLOAT)
*/

/* Foreign Keys - ������ ��������� ����� ��������� ���� ���������� Model - Primary Key-a ��
ALTER TABLE AvailableCars
ADD FOREIGN KEY (Model) REFERENCES CarSpecs(Model);
ALTER TABLE AvailableCars
ADD FOREIGN KEY (Model) REFERENCES Sales(Model);
ALTER TABLE Sales
ADD FOREIGN KEY (Model) REFERENCES CarSpecs(Model);
*/

/* Procedure 1 - ������� ��������� ������� ������ ���� �� ������, ����� ��� ��������� �� ������� �� ������ �� �����
CREATE PROCEDURE usp_TotalDeliveriesForPeriodOfTime(@Date1 DATE, @Date2 DATE)
AS
Select SUM(Deliveries) AS [Total Deliveries] FROM Sales 
WHERE [Date] BETWEEN @Date1 AND @Date2
GO 
EXEC usp_TotalDeliveriesForPeriodOfTime '2020-01-01', '2020-03-01';
*/

/* Procedure 2 - ������� ��������� ������� ������ ���� �������� �� ������ �� ��������� ������ �� �����
CREATE PROCEDURE usp_TotalSalesForPeriodOfTime(@Date1 DATE, @Date2 DATE)
AS
Select SUM(Sales) AS [Total Sales] FROM Sales 
WHERE [Date] BETWEEN @Date1 AND @Date2
GO 
EXEC usp_TotalSalesForPeriodOfTime '2020-01-01', '2020-01-01'
*/

/* Procedure 3 - ������� ��������� ������� ������ ������ ������ � ����� ��
CREATE PROCEDURE usp_AvailableCars
AS
SELECT * FROM AvailableCars
GO;
EXEC usp_AvailableCars
*/

/* Procedure 4 - ���������� ��������� ������� �������� ��������������� ������� �� ���������� �� ������ �� �����
CREATE PROCEDURE usp_TotalCustomOrdersForPeriodOfTime(@Date1 DATE, @Date2 DATE)
AS
Select SUM(CustomOrders) AS [Total Sales] FROM Sales 
WHERE [Date] BETWEEN @Date1 AND @Date2
GO
EXEC usp_TotalCustomOrdersForPeriodOfTime '2020-01-01', '2020-01-01'
*/

/* Procedure 5 - ������ ��������� ������� ������ ���� �������� �� ����������
CREATE PROCEDURE usp_TotalSales
AS
SELECT SUM(Sales) AS [Total Sales] FROM Sales
GO
EXEC usp_TotalSales;
*/

/* Procedure 6 - ������� ��������� ������� ������ ���� ������ ���������� �� ������ �� �����
CREATE PROCEDURE usp_NewCars(@Date1 DATE, @Date2 DATE)
AS
SELECT Sum([New Cars]) AS [New Cars] FROM Sales
WHERE [Date] BETWEEN @Date1 AND @Date2
GO
EXECE usp_NewCars '2020-01-01', '2020-03-01'
*/

/* Procedure 7 - ������� ��������� ������� ������, ����� �� �� ������ �� �� �������� �� ������ �� �����
CREATE PROCEDURE usp_DroppedCars(@Date1 DATE, @Date2 DATE)
AS
SELECT (AvailableCars.Quantity - Sales.Sales) AS [Dropped Cars] FROM Sales 
JOIN AvailableCars ON Sales.Model = AvailableCars.Model 
WHERE [Date] BETWEEN @Date1 AND @Date2
GO
EXEC usp_DroppedCars '2020-01-01', '2020-01-01';
*/

/* Procedure 8 - ������ ��������� ������� ������ ������ �� ��������� ������ �� �����
CREATE PROCEDURE usp_TotalRevenue(@Date1 DATE, @Date2 DATE)
AS
SELECT SUM(Sales.Sales * CarSpecs.Price) FROM Sales
JOIN CarSpecs ON Sales.Model = CarSpecs.Model
WHERE [Date] BETWEEN @Date1 AND @Date2
GO
EXEC usp_TotalRevenue '2020-01-01', '2020-8-01'
*/


/* Procedure 9 - �������� ��������� ������� ������ ������ �� ��������� ������ �� �����
CREATE PROCEDURE usp_TotalExpenses(@Date1 DATE, @Date2 DATE)
AS
SELECT SUM((Sales.Sales * CarSpecs.Price) * 0.20) AS [Total Expenses] FROM Sales
JOIN CarSpecs ON Sales.Model = CarSpecs.Model
WHERE [Date] BETWEEN @Date1 AND @Date2
GO
EXEC usp_TotalExpenses '2020-01-01', '2020-01-01'
*/

SELECT * FROM AvailableCars