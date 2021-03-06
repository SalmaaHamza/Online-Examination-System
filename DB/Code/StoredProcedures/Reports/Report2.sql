USE [Online_Examination_System]
GO
/****** Object:  StoredProcedure [dbo].[spGetByIdStdGradesInAllCrs]    Script Date: 2/7/2022 8:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[spGetByIdStdGradesInAllCrs] @stId int
as 
	BEGIN TRY  
			select c.Crs_Name, CONCAT(s.St_Fname,' ',s.St_Lname) [FullName] , sc.Grade from 
			Stud_Course sc inner join Course c on sc.Crs_Id = c.Crs_Id and sc.St_Id = @stId
	
	inner join Student s on sc.St_Id = s.St_Id

		return 1000;
	END TRY  

	BEGIN CATCH  
	   return 4000 
	END CATCH 
