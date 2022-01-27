-- =============================================
-- Author:      Heba Elsayed
-- Create date: 1-22-2022
-- Description: get all instructors data
-- return:1000 In Case of Success
-- =============================================
create proc spGetInstructors
as
begin 
	select * from Instructor
	return 1000
end
--==========================================
-- Author:      Heba Elsayed
-- Create date: 1-22-2022
-- Description: get instructors data By Id
-- Parameters 
	-- @InsId: id of Instructor , Not Null 
-- return 
	-- 1000 In Case of Duplicate ID
	-- 4000 In Case of Not Found Key
-- =============================================
GO

create proc spGetByIdInstructor @InsId int
as 
begin
	BEGIN TRY  
			select * from Instructor
			where Ins_Id = @InsId
		return 1000;
	END TRY  
	BEGIN CATCH  
	   return 4000 
	END CATCH 
end

GO
--============================================
-- Author:      Heba Elsayed
-- Create date:  1-22-2022
-- Description: Insert New Instructors
-- Parameters 
	-- @InsId: id of Instructor , Not Null 
	-- @InsName : instructors name
	-- @InsDegree : instructor degree
	-- @salary : instructor salary
	-- @deptId : instructor's Department Id

-- return 
	-- 2000 In Case of Duplicate ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================
create proc spAddInstructor @InsId int, @InsName nvarchar(50) , @InsDegree nvarchar(50) , @salary int, @deptId int
as
begin
	if Exists (select * from Instructor where Ins_Id = @InsId )
		return 2000
	if not Exists(select * from Department where Dept_Id = @deptId)
		return 3000
	   insert into Instructor values(@InsId,@InsName,@InsDegree,@salary,@deptId)
		 return 1000
end
--=============================
-- Author:      Heba Elsayed
-- Create date: 22-1-2022
-- Description: Remove instructor From DB
-- Parameters 
	-- @InsId: id of Instructor , Not Null 

-- return 
	-- 4000 In Case of Not Found ID
	-- 1000 In Case of Success
-- =============================================
GO

create proc spDeleteInstructor @InsId int
as
	if not Exists (select * from Instructor where Ins_Id = @InsId )
			return 4000

	delete from Instructor where Ins_Id = @InsId
	return 1000
--=======================================
-- Author:     Heba ELsayed
-- Create date: 22-1-2022
-- Description: Update Instructor Data
-- Parameters 
-- @InsId: id of Instructor , Not Null 
	-- @InsName : instructors name
	-- @InsDegree : instructor degree
	-- @salary : instructor salary
	-- @deptId : instructor's Department Id

-- return 
	-- 4000 In Case of Not Found ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================
GO
create proc spUpdateInstructor @InsId int, @InsName nvarchar(50) , @InsDegree nvarchar(50) , @salary int, @deptId int
as
	if not Exists (select * from Instructor where Ins_Id = @InsId )
		return 4000	
	if not Exists(select * from Department where Dept_Id = @deptId)
		return 3000
	update Instructor
		set Ins_Name = @InsName , Ins_Degree = @InsDegree, Salary = @salary ,  Dept_id = @deptId 
		where Ins_Id = @InsId
	return 1000	