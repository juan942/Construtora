using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConstrucSistem
{
    public partial class Obras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Instanciomaos clases de conexion a BD
            ConectionDB conection = new ConectionDB();
            //Sentencia SQL a ejecutar
            var SqlCommandObra = "SELECT [ID],[Cliente],[Encargado],[Obra],[direccion],[fechaInicio],[fechaTermino],[Total] FROM [dbo].[CostoProyecto]";

            try
            {
                //Recuperamos los datos de BD
                proyec.DataSource = conection.GetData(SqlCommandObra);
                //POblamos la GridView con la Data recuperada
                proyec.DataBind();
                //Cerramos conexion a BD
                conection.CloseDB();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
           


        }

        protected void Btn_newObra_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/ObraForm");
        }

        protected void proyec_RowEditing(object sender, GridViewEditEventArgs e)
        {
            var fila = e.NewEditIndex;
            var idRow = proyec.Rows[fila].Cells[0].Text;
            Response.Redirect("~/View/ObraForm.aspx?ID="+idRow);
        }

        protected void proyec_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var fila = e.RowIndex;
            var idRow = proyec.Rows[fila].Cells[0].Text;
            ConectionDB conection = new ConectionDB();
            string commandDelete = "Delete [dbo].[Obra] where idObra = " + fila;
            int result = conection.insertCommand(commandDelete);
            if (result != 0){
                Response.Redirect("~/Obras");
            }
            else
            {
                Response.Write("<script>alert('No pudimos borrar esta obra, se encuetra ligada a unas Facturas');</script>");
            }
            conection.CloseDB();
        }

    }
}