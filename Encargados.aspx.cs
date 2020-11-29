using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConstrucSistem
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConectionDB conection = new ConectionDB();


            try
            {

                //Declaro mi SqlCommand
                var emple = "SELECT [idUsuario],[rol],[nombre],[apellido],[correo],[celular],[credencial] FROM [dbo].[Usuario] WHERE Usuario.rol = 2; ";

                empleados.DataSource = conection.GetData(emple);
                empleados.DataBind();
                conection.CloseDB();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void guardar_user_Click(object sender, EventArgs e)
        {
            var nombre =    nombre_txt.Text;
            var apellido =  apellido_txt.Text;
            var correo =    correo_txt.Text;
            var celular =   celular_txt.Text;
            ConectionDB conection = new ConectionDB();

            String sccript = String.Format("INSERT INTO [dbo].[Usuario] ([rol],[nombre],[apellido],[correo],[celular],[credencial])VALUES(2,'{0}','{1}','{2}','{3}','helloworld')",nombre,apellido,correo,celular);

            try { 
                var result = conection.insertCommand(sccript);
                if (result != 0)
                {
                    //mostrar notificacion
                    Response.Write("<script>alert('Encargado registrado Exitosamente.');</script>");
                    Response.Redirect("~/Encargados");
                }
             }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
   
            conection.CloseDB();
            nombre_txt.Text = "";
            apellido_txt.Text = "";
            correo_txt.Text = "";
            celular_txt.Text = "";
        }
    }
}