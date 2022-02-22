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

ALTER proc spExamQuestions @examNo int, @stdId int
as

	BEGIN TRY
		select Q.Ques_No,Ques_Desc,QC.Choice_Desc,Q.Model_Answer ,Answer,Type from Exam_Ques EQ
		inner join Question Q on EQ.Ques_No = Q.Ques_No and EQ.Exam_No = @examNo
		inner join Ques_Choices QC on Q.Ques_No = QC.Ques_No
		inner join Std_Exam_Ques S ON S.Ques_No = eq.Ques_No and S.St_Id = @stdId
	RETURN 1000
	END TRY

	BEGIN CATCH 
	return 4000
	END CATCH