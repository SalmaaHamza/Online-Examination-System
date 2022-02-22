using System;
using System.Collections.Generic;
using System.Linq;
using DAL;

using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static class StudentManager
    {
        private static DBManager dBManager = new();

        public static bool spGetByIdStudent(int id)
        {
            try
            {
                Dictionary<string, object> parms = new Dictionary<string, object>();
                parms.Add("stId", id);
                var checkData = dBManager.ExecuteScaler("spGetByIdStudent", parms);
                if (checkData != null) return true;
            }
            catch (Exception)
            {

                throw;
            }
            return false;
        }

        public static DataTable spGetByIdExamQuesWizChoices(int id)
        {
            try
            {
                var parms = new Dictionary<string, object>();
                parms.Add("examId", id);
                DataTable checkData = dBManager.ExecuteDataTable("spGetByIdExamQuesWizChoices", parms);

            }
            catch (Exception)
            {
              

            }
            return new();
        }

        public static void spCorrectExam(int stId,int examNo,int crsId, QuestionList questions)
        {
            try
            {
                var parms = new Dictionary<string, object>();
                parms.Add("stId", stId);
                parms.Add("examNo", examNo);
                parms.Add("crsId", crsId);
                for (int i = 0; i < 10; i++)
                {
                    parms.Add($"ans{i + 1}", questions[i]);
                }

                object checkData = dBManager.ExecuteScaler("spCorrectExam", parms);

            }
            catch (Exception)
            {


            }
            

        }
        
        public static StdGradesList spGetByIdStdGradesInAllCrsList(int stId)
            {
             
            try
            {
                var parms = new Dictionary<string, object>();
                parms.Add("stId", stId);


                return DataTable2StdGradesList(dBManager.ExecuteDataTable("spGetByIdStdGradesInAllCrs", parms));

            }
            catch (Exception)
            {

                throw;
            }


            return new();
        }

        public static StdGradesList DataTable2StdGradesList(DataTable DT)
        {
            StdGradesList stdGradesList = new(); 
            try
            {
                for (int i = 0; i < DT?.Rows.Count; i++)
                {
                    stdGradesList.Add(DataRow2StdGrades(DT.Rows[i]));

                }


            }
            catch (Exception)
            {

                throw;
            }
            return stdGradesList;
        }

        public static StdGrades DataRow2StdGrades(DataRow Dr)
        {
            StdGrades stdGrades = new();
            try
            {
                stdGrades.Crs_Name = Dr["Crs_Name"]?.ToString()??"NAN";
                stdGrades.FullName = Dr["FullName"]?.ToString()??"NAN";

                if (int.TryParse(Dr["Grade"].ToString() ?? "-1", out int TempInt))
                    stdGrades.Grade = TempInt;

            }
            catch
            {

            }
            return stdGrades;

        }
    }
}
