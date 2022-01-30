----- Add Course-----

DECLARE @EmployeeName VARCHAR(30)
EXECUTE @EmployeeName = spAddCourse 1,'OOP',60
PRINT @EmployeeName
Go
------ADD Topics -------
spAddTopic 1, 'Constructors and Destructors',1 
Go
spAddTopic 3, 'Access Specifiers' ,1
Go
spAddTopic 4, 'Class Members and Types',1
Go
spAddTopic 5, 'Object',1
Go
spAddTopic 6, 'Classes',1
Go
spAddTopic 7, 'Inheritance and its Types',1
Go
spAddTopic 8, 'Exception Handling',1
Go
spAddTopic 9, 'Static Class Members',1
Go
spAddTopic 10, 'Member Functions & its Types',1
Go
spAddTopic 11, 'Memory Allocation & Scope of Variable',1
GO
spAddTopic 12,'Arguments and its Types & Inbuilt Classes',1
GO




