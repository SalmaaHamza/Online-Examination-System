using BLL.Entities;
using DAL;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    static class ExamManager
    {
        private static DBManager dBManager = new();

        public static Exam spGetByIdQuestionsOfExam(int examNo)
        {
            Exam exam = new();
            try
            {
                Dictionary<string, object> parms = new();
                parms["examNo"] = examNo;
                DataTable checkData = dBManager.ExecuteDataTable("spGetByIdQuestionsOfExam", parms);
            }
            catch (Exception)
            {

                throw;
            }
            return exam;
        }


       


    }
}
