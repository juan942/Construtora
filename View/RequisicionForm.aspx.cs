using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConstrucSistem.View
{
    public partial class RequisicionForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["ID"];

            ConectionDB conection = new ConectionDB();
            //DrowDowList Obra
            string sqlQuery = "SELECT [idObra],[nombre] FROM [dbo].[Obra]";
            DataTable dt = conection.GetData(sqlQuery);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    ListItem newItem = new ListItem(item[1].ToString(), item[0].ToString());
                    DD_Obra.Items.Add(newItem);
                }
            }
            dt.Dispose();
            conection.CloseDB();

            //Cateria
            sqlQuery = "SELECT [idCategoria],[descripcion] FROM [dbo].[Categoria]";
            dt = conection.GetData(sqlQuery);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    ListItem newItem = new ListItem(item[1].ToString(), item[0].ToString());
                    DD_categoria.Items.Add(newItem);
                }
            }
            dt.Dispose();
            conection.CloseDB();
        }

        protected void solicitar_materialBtn_Click(object sender, EventArgs e)
        {
            var fecha = fecha_txt.SelectedDate.ToString("yyyy-MM-dd");
            var idObra = DD_Obra.SelectedValue;
            var categoria = DD_categoria.SelectedValue;
            var material = material_txt.Value;

            var id = Request.QueryString["ID"];

            ConectionDB conection = new ConectionDB();
            if (String.IsNullOrEmpty(id))
            {
                String SqlCommand = String.Format("INSERT INTO [dbo].[Requisicion] ([fechaCreacion],[encargado],[obra],[tipoDeMaterial],[descripcion],[estado],[fechaPedido],[fechaEntrega])VALUES ('{0}',{1},{2},{3},'{4}',1,null,null);", fecha, Session["id"], idObra, categoria, material);
                try
                {
                    var result = conection.insertCommand(SqlCommand);

                    if (result != 0)
                    {
                        //notificacion
                        DD_Obra.Dispose();
                        DD_categoria.Dispose();
                        Response.Write("<script>alert('Registro Guardado.');</script>");
                        Response.Redirect("~/NuevaRequisicion");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            conection.CloseDB();
            fecha_txt.SelectedDate = DateTime.Now;
            DD_Obra.SelectedValue = "";
            DD_categoria.SelectedValue = "";
            material_txt.Value = "";
        }
    }
}