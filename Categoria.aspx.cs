using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConstrucSistem
{
    public partial class Categoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConectionDB conection = new ConectionDB();
            conection.ConnectDB();
            try
            {
                //Declaro mi SqlCommand
                var fill = "SELECT [idCategoria],[descripcion] FROM [dbo].[Categoria]";

                cate.DataSource = conection.GetData(fill);
                cate.DataBind();
                conection.CloseDB();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            conection.CloseDB();
        }

        protected void Btn_GuardarCategoria_Click(object sender, EventArgs e)
        {
            string categoria = Text_categoria.Text;

            if (categoria.Length > 0)
            {
                ConectionDB conection = new ConectionDB();
                String InsertCommand = "INSERT INTO [dbo].[Categoria] ([descripcion]) VALUES ('" + categoria + "')";
                var result = conection.insertCommand(InsertCommand);

                if (result != 0)
                {
                    // Mostrar mensaje de registro guardado
                    Response.Write("<script>alert('Categoria registrada Exitosamente.');</script>");
                    Response.Redirect("~/Categoria");

                }
                Text_categoria.Text = "";
                conection.CloseDB();
            }
            else
            {
                //Mostrando un mensaje diciendo que el campo vacio
                Response.Write("<script>alert('La descripcion de la categoria no puede ir vacio.');</script>");
                Response.Write("<script>toastr.error('Please Enter Name', 'Error');</script>");
            }
        }
    }
}