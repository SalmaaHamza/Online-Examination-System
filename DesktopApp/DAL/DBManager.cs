using System;
using Microsoft.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections.Generic;

namespace DAL
{
    public class DBManager
    {
        SqlConnection sqlCn;
        SqlCommand sqlCmd;
        SqlDataAdapter sqlDA;
        DataTable DT;
 

        public DBManager()
        {
            try
            {
                sqlCn = new SqlConnection(ConfigurationManager.ConnectionStrings["Online_Examination_System"].ConnectionString);
                sqlCmd = new SqlCommand("", sqlCn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlDA = new(sqlCmd);
                DT = new DataTable();
          



            }
            catch (Exception ex)
            {
                //log Execption

         
            }
        }

        public int ExecuteNonQuery(string SPName)
        {
            int R = -1;
            try
            {
                sqlCmd.Parameters.Clear();
                sqlCmd.CommandText = SPName;
                if (sqlCn.State == ConnectionState.Closed)
                    sqlCn.Open();
                R = sqlCmd.ExecuteNonQuery();
                sqlCn.Close();
            }
            catch (Exception ex)
            {

            }
            return R;
        }
        public DataTable ExecuteDataTable(string SPName)
        {
            try
            {
                DT?.Clear();
                sqlCmd.CommandText = SPName;
                sqlDA.Fill(DT);
                return DT;
            }
            catch
            {

            }
            return new();
        }
        public object ExecuteScaler(string SPName)
        {
            object R = new();
            try
            {
                sqlCmd.Parameters.Clear();
                sqlCmd.CommandText = SPName;
                if (sqlCn.State == ConnectionState.Closed)
                    sqlCn.Open();
                R = sqlCmd.ExecuteScalar();
                sqlCn.Close();
            }
            catch (Exception ex)
            {

            }
            return R;

        }

        public int ExecuteNonQuery(string SPName, Dictionary<string, object> parms)
        {
            int R = -1;
            try
            {
                sqlCmd.Parameters.Clear();
                foreach (var item in parms)
                    sqlCmd.Parameters.Add(new SqlParameter(item.Key, item.Value));
                sqlCmd.CommandText = SPName;
                if (sqlCn.State == ConnectionState.Closed)
                    sqlCn.Open();
                R = sqlCmd.ExecuteNonQuery();
                sqlCn.Close();
            }
            catch (Exception ex)
            {

            }
            return R;
        }

        public object ExecuteScaler(string SPName, Dictionary<string, object> parms)
        {
            object R = new();
            try
            {
                sqlCmd.Parameters.Clear();
                sqlCmd.CommandText = SPName;

                foreach (var item in parms)
                    sqlCmd.Parameters.Add(new SqlParameter(item.Key, item.Value));

                if (sqlCn.State == ConnectionState.Closed)
                    sqlCn.Open();
                R = sqlCmd.ExecuteScalar();
                sqlCn.Close();
            }
            catch (Exception ex)
            {

            }
            return R;

        }

        public DataTable ExecuteDataTable(string SPName, Dictionary<string, object> parms)
        {
            try
            {
                DT?.Clear();
                sqlCmd.CommandText = SPName;

                foreach (var item in parms)
                    sqlCmd.Parameters.Add(new SqlParameter(item.Key, item.Value));

                sqlDA.Fill(DT);
                return DT;
            }
            catch
            {

            }
            return new();
        }
    }
}
