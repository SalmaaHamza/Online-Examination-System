-- =================================Views==============================================--
-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-27-2022
-- Type:View
-- Description:view all the data of The Questions_choices 
--Coulmns:Q_Number, Choice_Number,Choice_Description
-- =============================================
CREATE VIEW Questions_choices_View AS
SELECT Ques_No as Q_Number, Choice_No as Choice_Number, Choice_Desc as Choice_Description
FROM Ques_Choices

--(Not Tested)--
-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-27-2022
-- Type:View
-- Description:view questions with answer 
--Coulmns:Q_Number, Choice_Number,Choice_Description
-- =============================================
CREATE VIEW Questions_with_choices_with_Answers AS
select q.Q_Number,q.Q_Description,q.ModelAnswer,c.Choice_Number,c.Choice_Description
from Questions_choices_View c inner join Questions_View q
on c.Q_Number=q.Q_Number and c.Q_Number=(select distinct c.Q_Number
from Questions_choices_View c inner join Questions_View q
on c.Q_Number=q.Q_Number
group by c.Q_Number )


-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-27-2022
-- Type:View
-- Description:view questions without answer 
--Coulmns:Q_Number, Choice_Number,Choice_Description
-- =============================================
CREATE VIEW Questions_with_choices_without_Answers AS
select q.Q_Number,q.Q_Description,c.Choice_Number,c.Choice_Description
from Questions_choices_View c inner join Questions_View q
on c.Q_Number=q.Q_Number and c.Q_Number=(select distinct c.Q_Number
from Questions_choices_View c inner join Questions_View q
on c.Q_Number=q.Q_Number
group by c.Q_Number )
--(Not Tested)--

-- =================================Stored Procedure=====================================================--
--==================================Select===========================================================--
-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-27-2022
-- Type:Stored Procedure
-- Description:get list of the question with choices
-- =============================================

create proc USP_getlistof_questions_with_choices
as
	select *from Questions_with_choices_without_Answers
Go
-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-27-2022
-- Type:Stored Procedure
-- Parameters 
	-- @q_nou: Question Number  Not Null 
-- Description:get list of the choices  of certain Question
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found (question Number)
-- =============================================

create proc USP_getlistof_choicesByquestion_no @q_nou int
as
    BEGIN TRY 
	select Choice_Number ,Choice_Description from Questions_choices_View where Q_Number=@q_nou
	return 1000
	END TRY
	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go

-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-27-2022
-- Type:Stored Procedure
-- Parameters 
	-- @q_nou: Question Number  Not Null 
	-- @choice_no: Choice Number  Not Null 
-- Description:get the description of certain choice of a specfic question
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found (Question Number or Choice Number)
-- =============================================

create proc USP_get_choice_Desc @q_nou int,@choice_no int
as
    BEGIN TRY 
	select Choice_Description from Questions_choices_View
	where Q_Number=@q_nou and Choice_Number=@choice_no
	return 1000
	END TRY
	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go
--======================================Update===========================================================--
---- =============================================
---- Author:      Nourhan AYman
---- Create date: 1-27-2022
---- Type:Stored Procedure
---- Parameters 
--	-- @que_no: Question Number  Not Null
--	-- @choiceNo:Choice Number  Not Null
--	-- @newchoice_desc: Question Number  Not Null
---- Description:update one of the choices Description of the question
---- return 
--	-- 1000 In Case of Success
--	-- 4000 In Case of Not Found (Question Number or choice number)
---- =============================================
create proc USP_update_choice_ofQS  @que_no int ,@choiceNo int,@newchoice_desc nchar(10)
as
    BEGIN TRY 
	update Questions_choices_View set Choice_Description=@newchoice_desc
	where Q_Number= @que_no and Choice_Number=@choiceNo
	return 1000
	END TRY
	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go
--======================================Insert===========================================================--

---- =============================================
---- Author:      Nourhan AYman
---- Create date: 1-27-2022
---- Type:Stored Procedure
---- Parameters 
--	-- @q_no: Question Number  Not Null
--	-- @choice_No: Choice Number Not Null
--  -- @choice_Des: choice Description Not Null
---- Description:Insert The choices of questions
---- return 
--	-- 1000 In Case of Success
--	-- 4000 In Case of Not Found (question number is not found in the table of questions)
--  -- or something wrong happen in entered data
---- =============================================
create proc USP_Insert_Qs_Choices  @q_no int,@choice_No int,@choice_Des nchar(10)
as
    BEGIN TRY 
	insert into Questions_choices_View values(@q_no,@choice_No,@choice_Des )
	return 1000
	END TRY
	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go


--======================================Delete===========================================================--

---- =============================================
---- Author:      Nourhan AYman
--- Create date: 1-27-2022
---- Type:Stored Procedure
---- Parameters 
--	-- @q_no: Question Number  Not Null
---- Description:Delete the question choices by Question Number 
---- return 
--	-- 1000 In Case of Success
--	-- 4000 In Case of Not Found (Question Number  is not found)
---- =============================================
create proc USP_Delete_QS_choicesbyQues_No @q_no int
as
    BEGIN TRY 
	delete from Questions_choices_View where Q_Number=@q_no
	return 1000
	END TRY
	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go