using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConstrucSistem
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Instanciomaos clases de conexion a BD
            ConectionDB conection = new ConectionDB();
            //Sentencia SQL a ejecutar
            var SqlCommandProp = "SELECT TOP (1000) [idPropietario],[nombre],[apellido],[celular] FROM [dbo].[Propietario]";
            try
            {
                //Recuperamos los datos de BD
                proyec.DataSource = conection.GetData(SqlCommandProp);
                //POblamos la GridView con la Data recuperada
                proyec.DataBind();
                //Cerramos conexion a BD
              
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            conection.CloseDB();
        }

        protected void guardar_propietario_Click(object sender, EventArgs e)
        {
            var nombre = nombre_txt.Text;
            var apellido = apellido_text.Text;
            var telefono = telefono_text.Text;

            ConectionDB conection = new ConectionDB();
            string sqlCommand = String.Format("INSERT INTO [dbo].[Propietario] ([nombre],[apellido],[celular]) VALUES({0},{1},{2})", nombre, apellido, telefono);
            try
            {
                var result = conection.insertCommand(sqlCommand);
                if (result !=0)
                {
                    Response.Write("<script>alert('Propietario registrado Exitosamente.');</script>");
                    Response.Redirect("~/Propietario");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }



            nombre_txt.Text = "";
           apellido_text.Text = "";
           telefono_text.Text = "";

            conection.CloseDB();
        }
    }
}