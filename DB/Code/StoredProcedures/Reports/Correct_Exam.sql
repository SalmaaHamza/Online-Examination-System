-- =============================================
-- Author:      Salma Hamza
-- Create date: 4-2-2022
-- Description: Correct Exam of 10 Questions
-- Parameters 
	-- @stId int 
	-- @examNo int 
	-- @crsId int
	-- Std Answers 1-10 

-- return 
	-- 4000 In Case of Failure
	-- 1000 In Case of Success


    
-- =============================================
ALTER proc [dbo].[spCorrectExam] @stId int , @examNo int ,@crsId int , @ans1 int,@ans2 int
,@ans3 int,@ans4 int,@ans5 int,@ans6 int,
@ans7 int,@ans8 int,@ans9 int,@ans10 int
As

	
	BEGIN TRY  
       -- Get Question No and Model Answer Of This Exam 
		declare @tempTable table (Ques_No int,Model_Answer int)
		
		insert into @tempTable (Ques_No,Model_Answer) exec spGetByIdQuestionsOfExam @examNo 


		declare @stdAnswers table(Answer int)
		insert into @stdAnswers(Answer) values(@ans1),(@ans2),(@ans3),(@ans4),(@ans5),(@ans6),(@ans7),(@ans8),(@ans9),(@ans10)

	-- Insert Std Answers
		
		declare @val int = 1;

		Insert Into Std_Exam_Ques(St_Id,Exam_No,Ques_No,Answer)
		Select St_Id = @stId,Exam_No = @examNo,Ques_No,Answer from 
		(select Ques_No , ROW_NUMBER() over (order by @val) row from @tempTable) QNo
		join 
		(select Answer , ROW_NUMBER() over (order by @val) row from @stdAnswers) stdAnswer
		on QNo.row = stdAnswer.row


	-- Check The grade of the std
		declare @grade as int = 0

		SELECT @grade = COUNT(*) FROM 
			(select Model_Answer , ROW_NUMBER() over (order by @val) row from @tempTable) ModelAns
		join 
			(select Answer , ROW_NUMBER() over (order by @val) row from @stdAnswers) StdAns
		on ModelAns.row = StdAns.row  and ModelAns.Model_Answer= StdAns.Answer

	-- Add Grade Of Std In This Exam
		Exec spUpdateGradeOfStdInCrs @stId , @crsId , @grade
		return 1000 
	END TRY  
	BEGIN CATCH  
		return 4000
	END CATCH   
	
		
