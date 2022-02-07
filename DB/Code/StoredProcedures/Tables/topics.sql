-- =================================Views==============================================--
-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-27-2022
-- Type:View
-- Description:view all the data of The Topics 
--Coulmns:Topic_ID, Topic_Name
-- =============================================
alter VIEW Topics_View AS
SELECT Top_Id  as Topic_ID, Top_Name as Topic_Name, Crs_Id as Course_ID
FROM Topic
-- =================================Stored Procedure=====================================================--
--==================================Select===========================================================--
-- =============================================
-- Author:      Nourhan AYman
-- Create date: 1-27-2022
-- Type:Stored Procedure
-- Parameters 
	-- @topicNo: Topic Number  Not Null 
-- Description:get Name of Topic
-- return 
	-- 1000 In Case of Success
	-- 4000 In Case of Not Found (Topic Number)
-- =============================================

create proc spGetByIdTopicName @topicNo int
as
    BEGIN TRY 
		select Topic_Name from Topics_View where Topic_Name=@topicNo
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
-- Description:get all Topics
-- =============================================

create proc spGetAllTopics 
as 
	select * from Topics_View
Go
--======================================Update===========================================================--
---- =============================================
---- Author:      Nourhan AYman
---- Create date: 1-27-2022
---- Type:Stored Procedure
---- Parameters 
--	-- @T_no: Topic Number  Not Null
--	-- @newTopic_Name: Topic Name  Not Null
---- Description:update Topic Name
---- return 
--	-- 1000 In Case of Success
--	-- 4000 In Case of Not Found (Topic Number)
---- =============================================
create proc spUpdateTopicName  @T_no int ,@newTopic_Name nvarchar(50)
as
    BEGIN TRY 
		update Topics_View set Topic_Name=@newTopic_Name
		where Topic_ID=@T_no
		return 1000
	END TRY

	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go


--======================================Insert===========================================================--

---- =============================================
---- Author:      Nourhan AYman
---- Create date: 1-29-2022
---- Type:Stored Procedure
---- Parameters 
--	-- @T_no: Topic Number  Not Null
--	-- @Topic_name: Topic Name Not Null
---- Description:Insert The Topics
---- return 
--	-- 1000 In Case of Success
	-- 3000 In Case of Not Found Foreign Key
--	-- 4000 In Case of somthing wrong happen in data entered
--
---- =============================================
alter proc spAddTopic  @topicID int,@topicName nvarchar(50),@crsID int
as
	if Exists (select * from Topics_View where  Topic_ID = @topicID and Course_ID = @crsID)
		return 2000

	if not Exists(select * from Course where Crs_Id = @crsID) 
		return 3000

    insert into Topics_View values(@topicID,@topicName,@crsID)
		return 1000
Go


--======================================Delete===========================================================--

---- =============================================
---- Author:      Nourhan AYman
--- Create date: 1-27-2022
---- Type:Stored Procedure
---- Parameters 
--	-- @T_no: Topic Number  Not Null
---- Description:Delete The Topic by Topic Number 
---- return 
--	-- 1000 In Case of Success
--	-- 4000 In Case of Not Found (Topic Number  is not found)
---- =============================================
create proc spDeleteTopic @T_no int
as
    BEGIN TRY 
		delete from Topics_View where Topic_ID=@T_no
		return 1000
	END TRY
	BEGIN CATCH  
	   return 4000 
	END CATCH 
Go