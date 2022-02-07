-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 1-22-2022
-- Description: get all Department data
-- return:1000 In Case of Success
-- =============================================
create proc spGetCourses
AS
	select * from Department
	return 1000
GO
-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 1-22-2022
-- Description: get Department data By Department Id
-- Parameters 
	-- @deptId: Department Id  Not Null 
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found Key
-- =============================================
create proc spGetDepartmentByID @deptId int
AS
	if NOT EXISTS(	select * from Department where Dept_Id = @deptId)
	return 4000

	select * from Department	where Dept_Id = @deptId
	return 1000
GO
-- =============================================
-- Author:      Mohamed Ayman
-- Create date:  1-22-2022
-- Description: Insert New Department
-- Parameters 
	-- @deptID   :		Department Id Not Null
	-- @deptName :		Department Name  
	-- @deptDesc :		Department Description
	-- @deptLoc  :		Department Location
	-- @deptMgr  :		Department Manager
	-- @mgrHD    :		Manager Hire Date

-- return 
	-- 2000 In Case of Duplicate ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================
create proc spAddDepartment @deptID int,@deptName nvarchar(50),@deptDesc nvarchar(50),@deptLoc nvarchar(50),@deptMgr nvarchar(50),@mgrHD date
AS
	if EXISTS(select * from Department where Dept_Id = @deptID)
		return 2000

	if NOT EXISTS(select * from Instructor where Ins_Id = @deptMgr)
		return 3000

	insert into Department values(@deptID,@deptName,@deptDesc,@deptLoc,@deptMgr,@mgrHD)
		return 1000
GO
-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 22-1-2022
-- Description: Update Department Data
-- Parameters 
	-- @deptId   :		Department Id Not Null
	-- @deptName :		Department Name  
	-- @deptDesc :		Department Description
	-- @deptLoc  :		Department Location
	-- @deptMgr  :		Department Manager
	-- @mgrHD    :		Manager Hire Date

-- return 
	-- 4000 In Case of Not Found ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================
create proc spUpdateDepartment @deptId int,@deptName nvarchar(50),@deptDesc nvarchar(50),@deptLoc nvarchar(50),@deptMgr nvarchar(50),@mgrHD date
AS
	if NOT EXISTS(select * from Department where Dept_Id = @deptId)
		return 4000

	if NOT EXISTS(select * from Instructor where Ins_Id = @deptMgr)
		return 3000

	update Department set Dept_Name = @deptName , Dept_Desc = @deptDesc , Dept_Location = @deptLoc , Dept_Manager = @deptMgr , Manager_hiredate = @mgrHD where Dept_Id = @deptId
		return 1000
GO
-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 22-1-2022
-- Description: Remove Department From DB
-- Parameters 
	-- @deptId: Department Id Not Null

-- return 
	-- 4000 In Case of Not Found ID
	-- 1000 In Case of Success
-- =============================================
create proc spDeleteDepartment @deptId int
AS
	if NOT EXISTS( select * from Department where Dept_Id=@deptId)
	return 4000

	delete from Department where Dept_Id = @deptId
	return 1000
GO
