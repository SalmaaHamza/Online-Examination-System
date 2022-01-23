# Stored Procedure 
## Test Cases Codes
    In Case: 
        1. Insert
            a. Success = 1000 
            b. Failure
                1. Duplicate id = 2000
                2. Forign key doesn't exits in the original table = 3000
        
        2. Update
            a. Success = 1000
            b. Fail
                1. Id Not Found = 4000
                2. Forign key doesn't exits in the original table = 3000

        3. Delete 
            a. Sucess = 1000
            b. Fail
                1. Id Not Found = 4000
                2. If it has a child and we can't delete it = 5000   
        
        4. Select
            a. Success = 1000
        
        5. SelectById
            a. Success = 1000
            b. Fail
                1. Id Not Found = 4000

 ---
 # Sorted Procedure Naming
    Select - spGetTableName , spGetByIdTableName
    Insert -  spAddTableName
    Delete - spDeleteTableName
    Update - spUpdateTableName

---
# Created Objects 

## Tables
    1. Course
    2. Department
    3. Exam
    4. Ins_Course
    5. Instructor
    6. Ques_Choices
    7. Question
    8. Std_Exam_Crs ()
    9. Stud_Course ()
    10. Student (St_Id, St_Fname,St_Lname,St_Address,St_Age,Dept_Id)
    11. Topic

## Stored Procedure 
### 1. Courses
1. spGetCourses 
2. spGetCouresById @crsId int 
3. spAddCourse @crsId int ,@crsName nvarchar(50) ,  @crsDuration nvarchar(50) , @topId int
4. spUpdateCourse @crsId int , @crsName nvarchar(50) ,@crsDuration nvarchar(50),@topId int
5. proc spDeleteCourse @crsId int

### 2. Department
1. spGetDepts
2. spGetDeptByID @deptId int
3. spAddDept @deptID int,@deptName nvarchar(50),@deptDesc nvarchar(50),@deptLoc nvarchar(50),@deptMgr nvarchar(50),@mgrHD date
4. spUpdateDept @deptId int,@deptName nvarchar(50),@deptDesc nvarchar(50),@deptLoc nvarchar(50),@deptMgr nvarchar(50),@mgrHD date
5. spDeleteDept @deptId int

### 3. Exam 
1. spGetExams
2. spGetExamById @examNo int
3. spAddExam @examNo int ,@noTF nchar(10) , @examDuration time(7) , @crsId int
4. spUpdateExam  @examNo int ,@noTF nchar(10) , @exDuration time(7) , @crsId int
5. spDeleteExam @examNo int
## 4. Student
1. spGetStudent
2. spGetStudentById @stId int
3. spAddStduent @stId int, @stFname nvarchar(50) , @stLname nvarchar(50) , @stAddress nvarchar(100) , @stAge int, @deptId int
4. spUpdateStudent @stId int, @stFname nvarchar(50) , @stLname nvarchar(50) , @stAddress nvarchar(100) , @stAge int, @deptId int

4. spDeleteStudent @stId int

## 5. Student wiz Courses   
1. spGetStdsGradesInAllCrs
2. spGetStdGradesInAllCrsById @stId int **get Student grade In all Courses By Id**
3. spGetByIdStdsGradesInCrs @crsId int **get Students grades In Specific Course By Id**
4. spGetStdGradeInCrsById @stdId int, @crsId int **get Students grades In Specific Course By Id**
5. spAddGradeOfStdInCrs @stId int, @crsId int , @grade int
6. spUpdateGradeOfStdInCrs @stId int, @crsId int , @grade int
7. spDeleteGradeOfStdInCrs @stId int ,@crsId int

## 6. Exam wiz Question wiz Student
1. spGetStdAnswerInAllExam 
    **Get All Questions' Answers for all students in all Courses**
2. spGetAnswerOfStdInExamById @stId int,@ExamNo int
    **get Answers of a Student In Specific Exam By Id**
3. spAddStdAnswerOfQuestion @stId int, @examNo int , @quesNo int ,@answer varchar(5) 
    **Insert Question's Answer of Student in specific Exam**
4. spUpdateStdAnswerOfQuesInExam @stId int, @examNo int , @quesNo int ,@answer varchar(5) 
    **Update the Question's Answer of Student in specific Exam**
5. spDeleteStdAnswerOfQuesInExam @stId int, @examNo int , @quesNo int 
    **Remove the Question's Answer of Student in specific Exam**


---
## Functions


---
## Synonyms
            
    