using DAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    static class InstructorManager
    {
        static DBManager dBManager = new();

        //Login 
        static bool spGetByIdInstructor(int id)
        {
            try
            {
                Dictionary<string, object> parms = new Dictionary<string, object>();
                parms["InsId"] = id;
                DataTable checkData =  dBManager.ExecuteDataTable("spGetByIdInstructor",parms);
                if (checkData?.Rows.Count == 1) return true;
            }
            catch (Exception)
            {

                throw;
            }
            return false;
        }

        static void spGenerateExam(GenerateExam exam)
        {
            try
            {
                PropertyInfo[] properties = typeof(GenerateExam).GetProperties();

                Dictionary<string, object> parms = new();

                foreach (PropertyInfo property in properties)
                {
                    parms[property.Name] = property.GetValue(exam);
                }

                dBManager.ExecuteNonQuery("spGenerateExam", parms);
            }
            catch (Exception e)
            {

                throw;
            }
        }
    }
}
