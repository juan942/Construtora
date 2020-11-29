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
    public partial class NRequisicion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConectionDB conection = new ConectionDB();

            try
            {
                //Declaro mi SqlCommand
                var fill = "SELECT R.[idRequisicion],R.[fechaCreacion],CONCAT(U.nombre,' ', U.apellido) AS Encargado,O.nombre,C.descripcion as Tipo, R.descripcion , E.descripcion  as Estatus " +
                            "FROM [dbo].[Requisicion] as R " +
                            "inner join[dbo].Obra as O on O.idObra = R.obra " +
                            "inner join[dbo].Usuario as U on U.idUsuario = R.encargado " +
                            "inner Join[dbo].Estado as E on E.idEstado = R.estado " +
                            "inner join[dbo].Categoria as C on C.idCategoria = R.tipoDeMaterial " +
                            "WHERE R.estado = 1";

                TableReques.DataSource = conection.GetData(fill);
                TableReques.DataBind();
                conection.CloseDB();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            conection.CloseDB();

        }

        protected void TableReques_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var fila = e.RowIndex;
            var idRow = TableReques.Rows[fila].Cells[0].Text;
            ConectionDB conection = new ConectionDB();
            string commandDelete = "DELETE FROM [dbo].[Requisicion] WHERE [idRequisicion] = " + fila;
            int result = conection.insertCommand(commandDelete);
            if (result != 0)
            {
                Response.Redirect("~/NuevaRequisicion");
            }
            else
            {
                Response.Write("<script>alert('No pudimos borrar esta Requision, se encuetra ligada a unas Facturas');</script>");
            }
            conection.CloseDB();
        }

        protected void TableReques_RowEditing(object sender, GridViewEditEventArgs e)
        {
            var fila = e.NewEditIndex;
            var idRow = TableReques.Rows[fila].Cells[0].Text;
            ConectionDB conection = new ConectionDB();
            string commandUpdate= "UPDATE [dbo].[Requisicion] SET[estado] = 3,[fechaPedido] = '"+DateTime.Now.ToString("yyyy-MM-dd")+"' WHERE idRequisicion = " + idRow;
            int result = conection.insertCommand(commandUpdate);
            if (result != 0)
            {
                //Registramos los datos en Facturas
                commandUpdate = "INSERT INTO [dbo].[Factura] ([requisicion],[provedor],[Estatus]) VALUES("+ idRow+",("+
                    "Select top 1 idProvedor from dbo.provedor where [categoria] = (Select idCategoria from dbo.Categoria where idCategoria = " + TableReques.Rows[fila].Cells[4].Text + "),4)";
                result = conection.insertCommand(commandUpdate);
                if (result != 0)
                {
                    Response.Write("<script>alert('La requicision fue aprovada, se enviara el pedido al Proveedor.');</script>");
                    Response.Redirect("~/NuevaRequisicion");
                }
            }
            else
            {
                Response.Write("<script>alert('No pudimos borrar esta Requision, se encuetra ligada a unas Facturas');</script>");
            }
            conection.CloseDB();
        }

        protected void TableReques_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void BtnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/RequisicionForm");
        }

    }       
}