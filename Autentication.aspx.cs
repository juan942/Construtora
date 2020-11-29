using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConstrucSistem
{
    public partial class Autentication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {

            // Recuperando los datos de la vista
            var email = Txt_Email.Value;
            var pwd = Txt_Pwd.Value;
            //Declaro mi sentencia SQL
            string consulta = String.Format("SELECT idUsuario,rol,nombre,apellido,correo,credencial FROM [dbo].[Usuario] where correo = '{0}' and credencial='{1}';", email,pwd);
            //Instancio mi clase para comunicarme a DB
            ConectionDB conectionDB = new ConectionDB();
            SqlDataReader sqlData = conectionDB.realizarConsulta(consulta);

            //Si el usuario fue encontrado
            if (sqlData.Read())
            {
                //Seteamos las variables Session
                Session["IsLoged"] = true;
                Session["id"] = sqlData["idUsuario"].ToString();
                Session["Rol"] = sqlData["rol"].ToString();
                Session["Nombre"] = sqlData["nombre"].ToString() + " " + sqlData["apellido"].ToString();
                Session["Correo"] = sqlData["correo"].ToString();
                Response.Redirect("~/Home");
            }
            else
            {
                //Imprimir un mensaje de error
                // Favor de validar Credenciales
                Response.Write("<script>alert('Contraseña invalida, Favor de validar Usuario y Password');</script>");
                Response.Redirect("~/Autentication");
            }

            conectionDB.CloseDB();

        }
    }
}