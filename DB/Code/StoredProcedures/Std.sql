-- =============================================
-- Author:      Salma Hamza
-- Create date: 1-22-2022
-- Description: get all students data
-- return:1000 In Case of Success
-- =============================================
create proc spGetStudent 
as
	select * from Student
	return 1000
Go

-- =============================================
-- Author:      Salma Hamza
-- Create date: 1-22-2022
-- Description: get student data By Id
-- Parameters 
	-- @stId: Stduent Id  Not Null 
-- return 
	-- 1000 In Case of Duplicate ID
	-- 4000 In Case of Not Found Key
-- =============================================

create Proc spGetStudentById @stId int
as 
	BEGIN TRY  
			select * from Student
			where St_Id = @stId
		return 1000;
	END TRY  

	BEGIN CATCH  
	   return 4000 
	END CATCH 
	
GO

-- =============================================
-- Author:      Salma Hamza
-- Create date:  1-22-2022
-- Description: Insert New student
-- Parameters 
	-- @stId: Stduent Id Not Null
	-- @stFname : Stduent First Name 
	-- @stLname : Stduent Lirst Name 
	-- @stAddress : Stduent Address
	-- @stAge: Student Age
	-- @deptId : Stduent's Department Id

-- return 
	-- 2000 In Case of Duplicate ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================
create proc spAddStduent @stId int, @stFname nvarchar(50) , @stLname nvarchar(50) , @stAddress nvarchar(100) , @stAge int, @deptId int
as
	if Exists (select * from Student where St_Id = @stId )
		return 2000

	if not Exists(select * from Department where Dept_Id = @deptId)
		return 3000

	insert into Student values(@stId,@stFname,@stLname,@stAddress,@stAge,@deptId)
		return 1000
GO

-- =============================================
-- Author:      Salma Hamza
-- Create date: 22-1-2022
-- Description: Update Student Data
-- Parameters 
	-- @stId: Stduent Id Not Null
	-- @stFname : Stduent First Name 
	-- @stLname : Stduent Lirst Name 
	-- @stAddress : Stduent Address
	-- @stAge: Student Age
	-- @deptId : Stduent's Department Id

-- return 
	-- 4000 In Case of Not Found ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================

create proc spUpdateStudent @stId int, @stFname nvarchar(50) , @stLname nvarchar(50) , @stAddress nvarchar(100) , @stAge int, @deptId int
as
	if not Exists (select * from Student where St_Id = @stId )
		return 4000

	if not Exists(select * from Department where Dept_Id = @deptId)
		return 3000
	
	update Student
		set St_Fname = @stFname , St_Lname = @stLname, St_Address = @stAddress , St_Age = @stAge , Dept_id = @deptId 
		where St_Id = @stId
	
	return 1000	

GO

-- =============================================
-- Author:      Salma Hamza
-- Create date: 22-1-2022
-- Description: Remove Student From DB
-- Parameters 
	-- @stId: Stduent Id Not Null

-- return 
	-- 4000 In Case of Not Found ID
	-- 1000 In Case of Success
-- =============================================

create proc spDeleteStudent @stId int
as
	if not Exists (select * from Student where St_Id = @stId )
			return 4000

	delete from Student where St_Id = @stId
	return 1000
GO

