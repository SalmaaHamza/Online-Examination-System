-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 1-22-2022
-- Description: get all Courses data
-- return:1000 In Case of Success
-- =============================================
create proc spGetCourses
AS 
	select * from Course	
	return 1000
GO

-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 1-22-2022
-- Description: get course data By Course Id
-- Parameters 
	-- @crsId: Course Id  Not Null 
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found Key
-- =============================================
create proc spGetCourseById @crsId int 
AS
	BEGIN TRY
	select * from Course where Crs_Id = @crsId	return 1000
	End TRY
	
	BEGIN CATCH
		return 4000
	END CATCH
GO

-- =============================================
-- Author:      Mohamed Ayman
-- Create date:  1-22-2022
-- Description: Insert New Course
-- Parameters 
	-- @crsId:			Course Id Not Null
	-- @crsName :		Course Name  
	-- @crsDuration :	Course Duration 
	-- @topId :			Topic Department Id

-- return 
	-- 2000 In Case of Duplicate ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================
create proc spAddCourse @crsId int ,@crsName nvarchar(50) , @crsDuration nvarchar(50) , @topId int
AS 
	if Exists (	select *from Course	where Crs_Id = @crsId)
		return 2000

	if not Exists (	select * from Topic	where Top_Id = @topId)
		return 3000

	insert into Course values(@crsId , @crsName,@crsDuration,@topId )
		return 1000
GO

-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 22-1-2022
-- Description: Update Course Data
-- Parameters 
	-- @crsId:			Course Id Not Null
	-- @crsName :		Course Name  
	-- @crsDuration :	Course Duration 
	-- @topId :			Topic Department Id

-- return 
	-- 4000 In Case of Not Found ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================

create proc spUpdateCourse @crsId int , @crsName nvarchar(50) ,@crsDuration nvarchar(50),@topId int
AS
	if NOT EXISTS(select * from Course	where Crs_Id = @crsId)
		return 4000

	if NOT EXISTS(select * from Topic where Top_Id = @topId)
		return 3000

	update Course set Crs_Name = @crsName , Crs_Duration = @crsDuration ,Top_Id=@topId 	where Crs_Id = @crsId
		return 1000
GO

-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 22-1-2022
-- Description: Remove Course From DB
-- Parameters 
	-- @crsId: Course Id Not Null

-- return 
	-- 4000 In Case of Not Found ID
	-- 1000 In Case of Success
-- =============================================
create proc spDeleteCourse @crsId int
AS 
	if NOT EXISTS(select *	from Course	 where Crs_Id = @crsId )
	return 4000

	delete from Course	where Crs_Id = @crsId
	return 1000
GO