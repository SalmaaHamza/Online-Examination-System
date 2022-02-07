-- =============================================
-- Author:      Mohamed Ayman
-- Create date: 4-2-2022
-- Description: Generate Exam From 10 Questions
-- Parameters 
	-- @CrsID     :	Course ID Not NULL
	-- @ExamID	  : Exam ID NOT NULL
	-- @numberOfTF  :	Number of True Or False Question


-- return 
	-- 4000 In Case of Not Found Course or Exam ID
	-- 1000 In Case of Success


    
-- =============================================
alter proc spGenerateExam  @CrsID_ int,@ExamNo int, @noTF int,@examDuration time(7)
AS
	
		--Add Exam to Exam Table
		declare @check as int 
		exec @check = spAddExam @ExamNo, @noTF , @examDuration,@CrsID_

		-- IN CASE OF NOT SUCCESS RETURN 
		if(@check != 1000)
			return @check;

		
		Insert Into Exam_Ques
		select @ExamNo,*
		from 
		(	
				select top (@noTF) Ques_No
				from Question ,Course
				where Question.Crs_Id = @CrsID_ and Course.Crs_Id = Question.Crs_Id and Question.Type = 'TF' 
				order by NEWID()
		UNION all
				select top (10-@noTF) Ques_No
				from Question ,Course
				where Question.Crs_Id = @CrsID_ and Course.Crs_Id = Question.Crs_Id and Question.Type = 'MCQ' 
				order by NEWID()	
		)t;
		
	

GO

-- Testing

declare @x as int 
exec @x= spGenerateExam 1,15,4,'10-2-2000'
print @x

