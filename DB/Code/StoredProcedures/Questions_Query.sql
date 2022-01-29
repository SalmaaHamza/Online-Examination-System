
-- =================================Views==============================================--
-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-22-2022
-- Type:View
-- Description:view all the data of The Questions 
--Coulmns:Q_Number, Q_Description,ModelAnswer,Type_,Course_ID
-- =============================================
CREATE VIEW Questions_View AS
SELECT Ques_No as Q_Number, Ques_Desc as Q_Description, Model_Answer as ModelAnswer,Type as Type_,Crs_Id as Course_ID
FROM Question


-- =================================Stored Procedure=====================================================--
--==================================Select===========================================================--
-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-22-2022
-- Type:Stored Procedure
-- Parameters 
	-- @course_id: Course ID  Not Null 
-- Description:get list of the questions of certain subject
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found (couse_id)
-- =============================================

create proc spGetByIdAllQuestionsInCrs @course_id int
as
    BEGIN TRY 
		select Q_Number,Q_Description,Type_ from Questions_view where Course_ID=@course_id
		return 1000
	END TRY

	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go


-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-22-2022
-- Type:Stored Procedure
-- Parameters 
	-- @course_id: Course ID  Not Null 
-- Description:get Number of the questions of certain subject
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found (couse_id)
-- =============================================

create proc spGetByIdQuestionsNoInCrs @course_id int
as
    BEGIN TRY 
		select count(*) from Questions_view where Course_ID=@course_id
		return 1000
	END TRY

	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go



-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-22-2022
-- Type:Stored Procedure
-- Parameters 
	-- @course_id: Course ID  Not Null 
-- Description:get list of the questions of certain subject with Model Answer
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found (couse_id)
-- =============================================

create proc spGetAllQuestionsWizAnswerInCrs @course_id int
as
    BEGIN TRY 
		select Q_Number,Q_Description,Type_,ModelAnswer from Questions_view where Course_ID=@course_id
		return 1000
	END TRY

	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go


-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-22-2022
-- Type:Stored Procedure
-- Parameters 
	-- @Ques_no: Question Number  Not Null 
-- Description:get the answer of the question
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found (Question Number)
-- =============================================

create proc spGetByIdQuestionAnswer @Ques_no int
as
    BEGIN TRY 
		select ModelAnswer from Questions_view where Q_Number=@Ques_no
		return 1000
	END TRY
	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go


--======================================Update===========================================================--
---- =============================================
---- Author:      Nourhan AYman
---- Create date: 1-22-2022
---- Type:Stored Procedure
---- Parameters 
--	-- @que_no: Question Number  Not Null
--	-- @newdesc: New description Not Null
---- Description:update the Description of the question
---- return 
--	-- 1000 In Case of Success
--	-- 4000 In Case of Not Found (Question Number)
---- =============================================
create proc spUpdateQuestionDesc  @qNo int,@newdesc nvarchar(50)
as

    BEGIN TRY 
		update Questions_view set Q_Description=@newdesc where Q_Number= @qNo
		return 1000
	END TRY

	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go
---- =============================================
---- Author:      Nourhan AYman
---- Create date: 1-22-2022
---- Type:Stored Procedure
---- Parameters 
--	-- @que_no: Question Number  Not Null
--	-- @newModelAn: Question Number  Not Null
---- Description:update the Model Answer of the question
---- return 
--	-- 1000 In Case of Success
--	-- 4000 In Case of Not Found (Question Number)
---- =============================================
create proc spUpdateQuestionModelAnswer  @que_no int ,@newModelAn nvarchar(50)
as
    BEGIN TRY 
		update Questions_view set ModelAnswer=@newModelAn where Q_Number= @que_no
		return 1000
	END TRY

	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go
--======================================Insert===========================================================--

---- =============================================
---- Author:      Nourhan AYman
---- Create date: 1-22-2022
---- Type: Stored Procedure
---- Parameters 
--	-- @qNo: Question Number  Not Null
--	-- @qDesc: Question description Not Null
--  -- @modelAnswer: Question Model Answer Not Null
--  -- @type: Question Type if it is true/flase or Mutilble Choices  Not Null
--  -- @courseID: tell which course this question belong to
---- Description:Insert a question
---- return 
	-- 2000 In Case of Duplicate ID
	-- 3000 In Case of Not Found Foreign Key
	-- 1000 In Case of Success
---- =============================================
create proc spAddQuestion  @qNo int,@qDesc nvarchar(50),@modelAnswer nchar(10),@type nchar(10),@courseID int
as
	if Exists (select * from Questions_view where Q_Number = @qNo and Course_ID = @courseID)
		return 2000

	if not Exists(select * from Course where Crs_Id = @courseID) 
		return 3000

  
	insert into Questions_view values(@qNo,@qDesc,@modelAnswer,@type,@courseID )
	return 1000
	
Go


--======================================Delete===========================================================--

---- =============================================
---- Author:      Nourhan AYman
---- Create date: 1-22-2022
---- Type:Stored Procedure
---- Parameters 
--  -- @Course_ID: Course Number not null
---- Description:Delete All questions in Specific Course by Course Number
---- return 
--	-- 1000 In Case of Success
--	-- 4000 In Case of Not Found (Course Number is not found)
---- =============================================
create proc spDeleteAllCrsQuestions @Course_ID int
as
    BEGIN TRY 
		delete from Questions_view where Course_ID=@Course_ID
		return 1000
	END TRY
	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go

---- =============================================
---- Author:      Nourhan AYman
---- Create date: 1-22-2022
---- Type:Stored Procedure
---- Parameters 
--  -- @qNo : Question Number not null
---- Description:Delete specific question  aand its choices 
---- return 
--	-- 1000 In Case of Success
--	-- 4000 In Case of Not Found (Question Number is not found)
---- =============================================
create proc spDeleteQuestion @qNo int
as
    BEGIN TRY 
		delete from Questions_view where Q_Number=@qNo;
		delete from Ques_Choices where Ques_No = @qNo;
		return 1000
	END TRY

	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go
