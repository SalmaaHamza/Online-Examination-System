-- =============================================
-- Author:     Heba El Sayed
-- Create date: 7-2-2022
-- Description: Get Topic Of Crs 
-- Parameters 
	-- @CrsId int 
  
-- =============================================alter proc spGetTopicsOfCrs  @crs_ID INTasbegin    select Top_Name from Topic T inner join Course C on T.Crs_Id =C.Crs_Id AND C.Crs_Id=@crs_IDEnd
