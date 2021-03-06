USE [Online_Examination_System]
GO
/****** Object:  StoredProcedure [dbo].[spGetByIdQuestionsOfExam]    Script Date: 2/6/2022 6:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[spGetByIdQuestionsOfExam] @examNo int
as
	declare @check int
	exec @check = spGetByIdExam @examNo
	
	--Check if exam exists
	if(@check != 1000)
		return @check
	select Q.Ques_No,Q.Model_Answer from Exam_Ques EQ
	inner join Question Q on EQ.Ques_No = q.Ques_No and EQ.Exam_No = @examNo
	return 1000