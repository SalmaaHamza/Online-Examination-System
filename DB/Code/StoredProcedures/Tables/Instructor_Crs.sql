-- =============================================
-- Author:      Heba Elsayed
-- Create date: 27-1-2022
-- Description: get all instructors evaluation  in all Courses

-- =============================================
alter proc spGetInsEvaluationInAllCrs 
as
begin
	select * from Ins_Course 
END
Go
-- =============================================
-- Author:      Heba Elsayed
-- Create date: 27-1-2022
-- Description: get instructor evaluation In all Courses By Id
-- Parameters 
	-- @insId: instructor Id  Not Null 
-- return 
	-- 0 In Case of Sucess
	-- 4000 In Case of Not Found Ins Key
-- =============================================

alter Proc spGetByIdInsEvaluationsInAllCrs @insId int
as 
begin
	BEGIN TRY  
			select * from Ins_Course
			where Ins_Id = @insId
	END TRY  

	BEGIN CATCH  
	   return 4000 
	END CATCH 
END
-- =============================================
-- Author:      Heba Elsayed
-- Create date: 27-1-2022
-- Description: get instructors' Evaluation In Specific Course By crsId
-- Parameters 
	-- @crsId: course Id  Not Null 
-- return 

	-- 4000 In Case of Not Found Crs Key
-- =============================================
Go
alter Proc spGetByIdInsEvaluationsInCrs @crsId int
as 
begin
	BEGIN TRY  
			select * from Ins_Course
			where Crs_Id=@crsId
	
	END TRY  

	BEGIN CATCH  
	   return 4000 
	END CATCH 
END

-- =============================================
-- Author:      Heba Elsayed
-- Create date: 27-1-2022
-- Description: get instructor evaluation In Specific Course By Id
-- Parameters 
	-- @crsId: course Id  Not Null 
	-- @insId: instructor Id  Not Null 
-- return 

	-- 4000 In Case of Not Found (Crs Key or Student Key)
-- =============================================
Go
alter Proc spGetByIdInsEvaluationInCrs @insId int, @crsId int
as 
begin
	BEGIN TRY  
			select * from Ins_Course
			where Crs_Id = @crsId and Ins_Id = @insId
	
	END TRY  

	BEGIN CATCH  
	   return 4000 
	END CATCH 
END
Go
-- =============================================
-- Author:      Heba Elsayed
-- Create date:  27-1-2022
-- Description: Insert Evaluation of Instructor in specific Course
-- Parameters 
	-- @insId: instructor Id Not Null
	-- @crsId : Course Id Not Null
	-- @evaluation: instructor evaluation in Course

-- return 
	-- 2000 In Case of Duplicate ID
	-- 3000 In Case of Not Found Foreign Key
	-- 0 In Case of Success
-- =============================================
alter proc spAddEvaluationOfInsInCrs @insId int, @crsId int , @evaluation nvarchar(50)
as
begin
	if Exists (select * from Ins_Course where Ins_Id = @insId and Crs_Id = @crsId)
		return 2000

	if not Exists(select * from Instructor where Ins_Id = @insId) or  not Exists (select * from Course where Crs_Id = @crsId)
		return 3000

	insert into Ins_Course values(@insId,@crsId,@evaluation)
		
END
GO
-- =============================================
-- Author:      Heba Elsayed
-- Create date: 27-1-2022
-- Description: Update the Evaluation of Instructor in specific Course
-- Parameters 
	-- @insId: instructor Id Not Null
	-- @crsId : Course Id Not Null
	-- @evaluation: instructor evaluation in Course

-- return 
	-- 4000 In Case of Not Found ID
	-- 3000 In Case of Not Found Foreign Key
	-- 0 In Case of Success
-- =============================================

alter proc spUpdateEvaluationOfInsInCrs @insId int, @crsId int ,  @evaluation nvarchar(50)
as
begin
	if not Exists (select * from Ins_Course where Ins_Id = @insId and Crs_Id = @crsId)
		return 4000

	if not Exists(select * from Instructor where Ins_Id = @insId) or  not Exists (select * from Course where Crs_Id = @crsId)
		return 3000
	
	update Ins_Course
		set Evaluation = @evaluation
		where Ins_Id = @insId and Crs_Id = @crsId

END
Go
-- =============================================
-- Author:      Heba Elsayed
-- Create date: 27-1-2022
-- Description: Remove Instructor's Evaluation In Specific Course
-- Parameters 
    -- @insId: instructor Id Not Null
	-- @crsId : Course Id Not Null

-- return 
	-- 4000 In Case of Not Found ID
	-- 0 In Case of Success
-- =============================================

alter proc spDeleteEvaluationOfInsInCrs @insId int, @crsId int
as
BEGIN
	if not Exists (select * from Ins_Course where Ins_Id= @insId and Crs_Id = @crsId)
		return 4000

	delete from Ins_Course where Ins_Id = @insId and Crs_Id = @crsId

END
GO

