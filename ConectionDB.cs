using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using WebGrease.Css.Ast.Selectors;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.Common;

namespace ConstrucSistem
{
    public class ConectionDB
    {
        //Declaramos propiedades de la clase
        public string cadenaConexion = "Data Source=DESKTOP-74VTMNP\\SQLEXPRESS;Initial Catalog=AMconstructura;Integrated Security=true;";
        SqlConnection connection;

        // Metodo para abrir conexion a BD
        public void ConnectDB()
        {
            try
            {
                connection = new SqlConnection(this.cadenaConexion);
                connection.Open();
            }catch(Exception e)
            {
                Console.WriteLine("Error: " +  e.Message);
            }
        }

        //Cerramos conecion a BD
        public void CloseDB()
        {
            this.connection.Close();
        }

        /**
         * Realiza la consulta a BD para obtener informacion
        **/
        public SqlDataReader realizarConsulta(String consulta)
        {
            SqlDataReader sqlDataReader = null;
            try
            {
                this.ConnectDB();
                SqlCommand sc = new SqlCommand(consulta, connection);
                sqlDataReader = sc.ExecuteReader();
            }
            catch (Exception e)
            {
                sqlDataReader = null;
                Console.WriteLine("Error al ejecutar consulta: " + e.Message);
            }
            return sqlDataReader;
        }

        public DataTable GetData(string selectCommand)
        {
            this.ConnectDB();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(selectCommand, connection);
            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);

            //Incializamos la DataTable para guardar el resultado de la consulta
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            return dataTable;
        }

        public int insertCommand(String inser)
        {
            int result = 0;
            try
            {
                this.ConnectDB();
                SqlCommand sc = new SqlCommand(inser, connection);
               result = sc.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Console.WriteLine("Error al ejecutar consulta: " + e.Message);
            }

            return result;
        }
    }
}