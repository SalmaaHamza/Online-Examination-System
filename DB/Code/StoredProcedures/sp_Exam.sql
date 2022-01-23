-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 1-22-2022
-- Description: get all Exams data
-- return:1000 In Case of Success
-- =============================================
create proc spGetExams
AS
	select * from Exam
	return 1000
GO
-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 1-22-2022
-- Description: get Exam data By Exam Id
-- Parameters 
	-- @exNo: Exam Id  Not Null 
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found Key
-- =============================================
create proc spGetExamById @exNo int
AS 
	if NOT EXISTS (select * from Exam Where exam_No = @exNo )
	return 4000
	
	select * from Exam Where exam_No = @exNo 
	return 1000
GO
-- =============================================
-- Author:      Mohamed Ayman
-- Create date:  1-22-2022
-- Description: Insert New Exam
-- Parameters 
	-- @exNo:			Exam Id Not Null
	-- @noTF :		    T or F Or NOT  
	-- @exDuration :	Exam Duration 
	-- @crsId :			Course Id

-- return 
	-- 2000 In Case of Duplicate ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================
create proc spAddExam @exNo int ,@noTF nchar(10) , @exDuration time(7) , @crsId int
AS 
	if Exists (	select * from Exam where Exam_No = @exNo)
		return 2000

	if not Exists (	select * from Course where Crs_Id = @crsId)
		return 3000

	insert into Exam values(@exNo , @noTF,@exDuration,@crsId )
		return 1000
GO

-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 22-1-2022
-- Description: Update Exam Data
-- Parameters 
	-- @exNo:			Exam Id Not Null
	-- @noTF :		    T or F Or NOT  
	-- @exDuration :	Exam Duration 
	-- @crsId :			Course Id

-- return 
	-- 4000 In Case of Not Found ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================

create proc spUpdateExam  @exNo int ,@noTF nchar(10) , @exDuration time(7) , @crsId int
AS
	if NOT EXISTS(select * from Exam where Exam_No = @exNo)
		return 4000

	if NOT EXISTS(select * from Course where Crs_Id = @crsId)
		return 3000

	update Exam set Exam_No = @exNo  ,No_TF = @noTF , Duration = @exDuration ,Crs_Id = @crsId
		return 1000
GO

-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 22-1-2022
-- Description: Remove Exam From DB
-- Parameters 
	-- @exNo: Exam Id Not Null

-- return 
	-- 4000 In Case of Not Found ID
	-- 1000 In Case of Success
-- =============================================
create proc spDeleteCourse @exNo int
AS 
	if NOT EXISTS(select * from Exam where Exam_No = @exNo)
	return 4000

	delete from Exam where Exam_No = @exNo
	return 1000
GO
