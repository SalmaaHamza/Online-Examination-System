-- =============================================
-- Author:      Salma Hamza
-- Create date: 1-22-2022
-- Description: Get All Questions' Answers for all students in all Courses 
-- return: 1000 In Case of Success
-- =============================================
create proc spGetStdAnswerInAllExam 
as
	select * from Std_Exam_Ques
	return 1000
Go

-- =============================================
-- Author: Salma Hamza
-- Create date: 1-22-2022
-- Description: get Answers of a Student In Specific Exam By Id
-- Parameters 
	-- @stId: Stduent Id  Not Null 
-- return 
	-- 1000 In Case of Sucess
	-- 4000 In Case of Not Found Std Key or Exam Key
-- =============================================

create Proc spGetAnswerOfStdInExamById @stId int,@ExamNo int
as 
	BEGIN TRY  
			select * from Std_Exam_Ques
			where St_Id = @stId and Exam_No = @ExamNo
		return 1000;
	END TRY  

	BEGIN CATCH  
	   return 4000 
	END CATCH 
GO

-- =============================================
-- Author:      Salma Hamza
-- Create date:  1-22-2022
-- Description: Insert Question's Answer of Student in specific Exam
-- Parameters 
	-- @stId: Stduent Id Not Null
	-- @examNo: Exam Number
	-- @quesNo: Question Number
	-- @answer : Student Answer

-- return 
	-- 2000 In Case of Duplicate ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================
create proc spAddStdAnswerOfQuestion @stId int, @examNo int , @quesNo int ,@answer varchar(5)
as
	if Exists (select * from Std_Exam_Ques where St_Id = @stId and Ques_No = @quesNo and Exam_No = @examNo)
		return 2000

	if not Exists(select * from Student where St_Id = @stId) or
		not Exists (select * from Question where Ques_No = @quesNo) or
		not Exists (select * from Exam where Exam_No = @examNo)

			return 3000

	insert into Std_Exam_Ques values(@stId,@examNo,@quesNo,@answer)
		return 1000
GO

-- =============================================
-- Author:      Salma Hamza
-- Create date: 22-1-2022
-- Description: Update the Question's Answer of Student in specific Exam 
-- Parameters 
	-- @stId: Stduent Id Not Null
	-- @examNo: Exam Number
	-- @quesNo: Question Number
	-- @answer : Student Answer

-- return 
	-- 4000 In Case of Not Found ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
-- =============================================

create proc spUpdateStdAnswerOfQuesInExam @stId int, @examNo int , @quesNo int ,@answer varchar(5)
as

	if not Exists (select * from Std_Exam_Ques where St_Id = @stId and Ques_No = @quesNo and Exam_No = @examNo)
		return 4000

	if not Exists(select * from Student where St_Id = @stId) or
		not Exists (select * from Question where Ques_No = @quesNo) or
		not Exists (select * from Exam where Exam_No = @examNo)

			return 3000
	
	update Std_Exam_Ques
		set Answer = @answer
		where St_Id = @stId and Ques_No = @quesNo and Exam_No = @examNo
	return 1000	

GO

-- =============================================
-- Author:      Salma Hamza
-- Create date: 22-1-2022
-- Description: Remove the Question's Answer of Student in specific Exam 
-- Parameters 
	-- @stId: Stduent Id Not Null
	-- @crsId: Course Id Not Null

-- return 
	-- 4000 In Case of Not Found ID
	-- 1000 In Case of Success
-- =============================================

create proc spDeleteStdAnswerOfQuesInExam @stId int, @examNo int , @quesNo int
as
	if not Exists (select * from Std_Exam_Ques where St_Id = @stId and Ques_No = @quesNo and Exam_No = @examNo)
		return 4000

	delete from Std_Exam_Ques where St_Id = @stId and Ques_No = @quesNo and Exam_No = @examNo
	return 1000
GO

