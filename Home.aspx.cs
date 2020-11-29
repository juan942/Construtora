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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (Session["IsLoged"] is null)
            {
               Response.Redirect("~/Autentication");
            }

            ConectionDB conection = new ConectionDB();
            var consulta = "Select * from dbo.CostoProyecto";
            var consulta_pendientes = "Select * from dbo.FacturasPendientes";
            SqlDataReader data =  conection.realizarConsulta(consulta);
            SqlDataReader data_pendientes = conection.realizarConsulta(consulta_pendientes);

            try
            {

                //Declaro mi SqlCommand
                var facturasXpagar = "SELECT * FROM [dbo].[FacturasPendientes]";

                FacturasPendientesPago.DataSource = conection.GetData(facturasXpagar);
                FacturasPendientesPago.DataBind();
                conection.CloseDB();
            }catch(Exception ex)
            {
                Response.Write(ex.Message);
            }

            ConectionDB conection2 = new ConectionDB();
            var consulta2 = "Select * from dbo.CostoProyecto";
            var consulta_pendientes2 = "Select * from dbo.FacturasPendientes";
            SqlDataReader data2 = conection2.realizarConsulta(consulta2);
            SqlDataReader data_pendientes2 = conection.realizarConsulta(consulta_pendientes2);

            try
            {
                //Declaro mi SqlCommand
                var proyectos = "SELECT [ID],[Cliente],[Encargado],[Obra],[direccion],[fechaInicio],[fechaTermino],[Total] FROM [dbo].[CostoProyecto] ";

                Proyec.DataSource = conection2.GetData(proyectos);
                Proyec.DataBind();
                conection2.CloseDB();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


            ConectionDB conection3 = new ConectionDB();
            var consulta3 = "Select * from dbo.CostoProyecto";
            var consulta_pendientes3 = "Select * from dbo.FacturasPendientes";
            SqlDataReader data3 = conection3.realizarConsulta(consulta3);
            SqlDataReader data_pendientes3 = conection.realizarConsulta(consulta_pendientes3);

            try
            {
                //Declaro mi SqlCommand
                var proyectos = "SELECT[fechaPago],[nombre],[razonSocial],[metodo],[total] FROM [dbo].[Pagos]";
                Pagados.DataSource = conection2.GetData(proyectos);
                Pagados.DataBind();
                conection3.CloseDB();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}