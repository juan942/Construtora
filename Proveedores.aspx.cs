using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConstrucSistem
{
    public partial class Proveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConectionDB conection = new ConectionDB();
            var RProvedores = "SELECT p.idProvedor,p.razonSocial,c.descripcion,p.direccion,p.tel,p.correo,p.cuentaBancaria " +
                               "FROM dbo.Provedor as p " +
                               "Inner join dbo.Categoria as c on p.categoria = c.idCategoria;";


            Tab_prove.DataSource = conection.GetData(RProvedores);
            Tab_prove.DataBind();
            
            //Drop_list de Propietarios
            string sqlQuery = "SELECT idCategoria, descripcion FROM [dbo].[Categoria]";
            DataTable dt = conection.GetData(sqlQuery);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    ListItem newItem = new ListItem(item[1].ToString(), item[0].ToString());
                    DD_categoria.Items.Add(newItem);
                }
            }

            var fill = "SELECT [idCategoria], CONCAT ([descripcion]) As Nombre FROM [dbo].[Categoria]";

            try
            {
                //Recuperamos los datos de BD
                DD_categoria.DataSource = conection.GetData(fill);
                //POblamos la GridView con la Data recuperada
                DD_categoria.DataBind();
                //Cerramos conexion a BD
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            conection.CloseDB();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string razon = Razon.Text;
            string categoria = DD_categoria.SelectedValue;
            string direccion = direc.Text;
            string bancaria = Cuenta.Text; 
            string telefono = Tele.Text;
            string correo = cocrreo.Text;
            ConectionDB conection = new ConectionDB();
            String sccript = "INSERT INTO [dbo].[Provedor] ([razonSocial],[categoria],[direccion],[tel],[correo],[cuentaBancaria]) VALUES ('"+ razon + "'," + categoria + ",'" + direccion + "','" + telefono + "','" + correo + "','" + bancaria + "')";
            try
            {
                var result = conection.insertCommand(sccript);

                if (result != 0)
                {
                    //notificacion
                    Response.Write("<script>alert('Proveedor registrado Exitosamente.');</script>");
                    Response.Redirect("~/Proveedores");
                }
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Razon.Text = "";
            categ.Text = "";
            direc.Text = "";
            Cuenta.Text = "";
            Tele.Text = "";
            cocrreo.Text = "";
            conection.CloseDB();
        }
    }
}