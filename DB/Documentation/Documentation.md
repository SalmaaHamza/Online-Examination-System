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
                2.  Forign key doesn't exits in the original table = 3000

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



---
## Functions


---
## Synonyms
            
    