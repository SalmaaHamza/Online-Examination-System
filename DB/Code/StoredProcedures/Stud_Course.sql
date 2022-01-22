-- =============================================
-- Author:      Salma Hamza
-- Create date: 1-22-2022
-- Description: get all Students grades in all Courses
-- return: 1000 In Case of Success
-- =============================================
create proc spGetStdsGradesInAllCrs
as
	select * from Stud_Course
	return 1000
Go

-- =============================================
-- Author:      Salma Hamza
-- Create date: 1-22-2022
-- Description: get Student grade In all Courses By Id
-- Parameters 
	-- @stId: Stduent Id  Not Null 
-- return 
	-- 1000 In Case of Sucess
	-- 4000 In Case of Not Found Std Key
-- =============================================

create Proc spGetByIdStudentGradesInAllCrs @stId int
as 
	BEGIN TRY  
			select * from Stud_Course
			where St_Id = @stId
		return 1000;
	END TRY  

	BEGIN CATCH  
	   return 4000 
	END CATCH 
GO

-- =============================================
-- Author:      Salma Hamza
-- Create date: 1-22-2022
-- Description: get Students grade In Specific Course By Id
-- Parameters 
	-- @crsId: Stduent Id  Not Null 
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found Crs Key
-- =============================================

create Proc spGetByIdStudentsGradesInSpecificCrs @crsId int
as 
	BEGIN TRY  
			select * from Stud_Course
			where Crs_Id = @crsId
		return 1000;
	END TRY  

	BEGIN CATCH  
	   return 4000 
	END CATCH 
GO

-- =============================================
-- Author:      Salma Hamza
-- Create date: 1-22-2022
-- Description: get Students grade In Specific Course By Id
-- Parameters 
	-- @crsId: Stduent Id  Not Null 
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found (Crs Key or Student Key)
-- =============================================

create Proc spGetByIdStudentGradeInCrs @stdId int, @crsId int
as 
	BEGIN TRY  
			select * from Stud_Course
			where Crs_Id = @crsId and St_Id = @stdId
		return 1000;
	END TRY  

	BEGIN CATCH  
	   return 4000 
	END CATCH 
GO

-- =============================================
-- Author:      Salma Hamza
-- Create date:  1-22-2022
-- Description: Insert Grade of Student in specific Coursr
-- Parameters 
	-- @stId: Stduent Id Not Null
	-- @crsId : Course Id Not Null
	-- @grade: Students'grade in Course

-- return 
	-- 2000 In Case of Duplicate ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================
create proc spAddGradeOfStdInCrs @stId int, @crsId int , @grade int
as
	if Exists (select * from Stud_Course where St_Id = @stId and Crs_Id = @crsId)
		return 2000

	if not Exists(select * from Student where St_Id = @stId) or  not Exists (select * from Course where Crs_Id = @crsId)
		return 3000

	insert into Stud_Course values(@stId,@crsId,@grade)
		return 1000
GO

-- =============================================
-- Author:      Salma Hamza
-- Create date: 22-1-2022
-- Description: Update the Grade of Student in specific Course
-- Parameters 
	-- @stId: Stduent Id Not Null
	-- @crsId : Course Id Not Null
	-- @grade: Students'grade in Course

-- return 
	-- 4000 In Case of Not Found ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================

create proc spUpdateGradeOfStdInCrs @stId int, @crsId int , @grade int
as

	if not Exists (select * from Stud_Course where St_Id = @stId and Crs_Id = @crsId)
		return 4000

	if not Exists(select * from Student where St_Id = @stId) or  not Exists (select * from Course where Crs_Id = @crsId)
		return 3000
	
	update Stud_Course
		set Grade = @grade
		where St_Id = @stId and Crs_Id = @crsId
	return 1000	

GO

-- =============================================
-- Author:      Salma Hamza
-- Create date: 22-1-2022
-- Description: Remove Student's Grade In Specific Course
-- Parameters 
	-- @stId: Stduent Id Not Null
	-- @crsId: Course Id Not Null

-- return 
	-- 4000 In Case of Not Found ID
	-- 1000 In Case of Success
-- =============================================

create proc spDeleteStudent @stId int ,@crsId int
as
	if not Exists (select * from Stud_Course where St_Id = @stId and Crs_Id = @crsId)
		return 4000

	delete from Stud_Course where St_Id = @stId and Crs_Id = @crsId
	return 1000
GO

