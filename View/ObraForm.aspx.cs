using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConstrucSistem.View
{
    public partial class ObraForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["ID"];

            ConectionDB conection = new ConectionDB();
           
            //Drop_list de Propietarios
            string sqlQuery = "SELECT idPropietario, CONCAT(nombre,' ', apellido) AS Nombre FROM [dbo].[Propietario]";
            DataTable dt = conection.GetData(sqlQuery);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    ListItem newItem = new ListItem(item[1].ToString(), item[0].ToString());
                    DD_Propietario.Items.Add(newItem);
                }
            }
            dt.Dispose();

            //Drop_list de Encargados
            string sqlQuery2 = "SELECT idUsuario, CONCAT(nombre,' ', apellido) AS Nombre FROM [dbo].[Usuario]";
            dt = conection.GetData(sqlQuery2);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item1 in dt.Rows)
                {
                    ListItem newItem1 = new ListItem(item1[1].ToString(), item1[0].ToString());
                    DD_Encargado.Items.Add(newItem1);
                }
            }
            dt.Dispose();

            if (!String.IsNullOrEmpty(id))
            {
                //Drop_list de Propietarios
                sqlQuery = "SELECT * FROM [dbo].[Obra] where idObra = " + id;
                dt = conection.GetData(sqlQuery);
                DataRow dr = dt.Rows[0];
                //llenadmos el formulario con los datos actuales
                ID_obra.Value = dr[0].ToString();
                DD_Encargado.SelectedValue = dr[2].ToString();
                DD_Propietario.SelectedValue = dr[1].ToString();
                nombre_txt.Value = dr[3].ToString();
                Txt_Direccion.Value = dr[4].ToString();

                dt.Dispose();
            }

            conection.CloseDB();
        }


        protected void guardarObra_btn_Click(object sender, EventArgs e)
        {
            var id = Request.QueryString["ID"];
            ConectionDB conection = new ConectionDB();
            //Recogemos valores de la vista
            var encargado = DD_Encargado.SelectedValue;
            var propietario = DD_Propietario.SelectedValue;
            var obra = nombre_txt.Value;
            var direccion = Txt_Direccion.Value;
            var fechaI = fecha_DP.SelectedDate;
            var fecha = fechaI.ToString("yyyy-MM-dd");

            //Si no hay valor en ID realizamos un Insert
            if (String.IsNullOrEmpty(id))
            {
                
                string SqlCommand = String.Format("INSERT INTO [dbo].[Obra] ([propietario],[encargado],[nombre],[direccion],[fechaInicio],[fechaTermino]) VALUES({0},{1},'{2}','{3}','{4}',null);", propietario, encargado, obra, direccion, fecha);
                try
                {
                    var result = conection.insertCommand(SqlCommand);

                    if (result != 0)
                    {
                        //notificacion
                        DD_Propietario.Dispose();
                        DD_Encargado.Dispose();
                        Response.Write("<script>alert('Registro Guardado.');</script>");
                        Response.Redirect("~/Obras");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }

            }
            else
            {//En otro caso se trata de un Update
                string command = "UPDATE [dbo].[Obra] SET [propietario] ="+ propietario + 
                                " ,[encargado] = "+ encargado+
                                ",[nombre] = '" + obra+"'"+
                                ",[direccion] ='" + direccion+"'"+
                                ",[fechaTermino] ='" + fecha+"'"+
                                "WHERE idObra =" + id;
                try
                {
                    var result = conection.insertCommand(command);

                    if (result != 0)
                    {
                        //notificacion
                        DD_Propietario.Dispose();
                        DD_Encargado.Dispose();
                        Response.Write("<script>alert('Registro Actualizado.');</script>");
                        Response.Redirect("~/Obras");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            DD_Encargado.SelectedValue = "1";
            DD_Propietario.SelectedValue = "1";
            nombre_txt.Value = "";
            Txt_Direccion.Value = "";
            fecha_DP.SelectedDate = DateTime.Now;
            conection.CloseDB();

        }
    }
}