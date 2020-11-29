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
    public partial class Pagar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ConectionDB conection = new ConectionDB();

            //Cargamos las facturas pendientes de Pago
            try
            {

                //Declaro mi SqlCommand
                var facturasXpagar = "SELECT * FROM [dbo].[FacturasPendientes]";

                FacturasPendientesPago.DataSource = conection.GetData(facturasXpagar);
                FacturasPendientesPago.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


            var facturasPendientes = "Select F.idFactura,R.idRequisicion, R.fechaCreacion,P.razonSocial,E.descripcion, R.fechaPedido, O.nombre from [dbo].[Factura] AS F " +
                                        "inner join dbo.Provedor as P On P.idProvedor = F.provedor "+
                                        "inner join dbo.Requisicion AS R On F.requisicion = R.idRequisicion "+
                                         "inner join dbo.Estado as E ON E.idEstado = R.estado "+
                                         "inner join dbo.Obra as O On R.obra = O.idObra "+
                                        "where F.Estatus = 4";
            Requisiciones.DataSource = conection.GetData(facturasPendientes);
            Requisiciones.DataBind();

            //Cargamos el DronDowList de Facturas
            string sqlQuery = "SELECT [idFactura] FROM [dbo].[Factura] where Estatus = 4";
            DataTable dt = conection.GetData(sqlQuery);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    ListItem newItem = new ListItem(item[0].ToString());
                    DD_Pagar.Items.Add(newItem);
                }
            }

            //Cargamos el DronDowList de Provedores
            string sqlQuery1 = "SELECT q.idProvedor, q.razonSocial FROM [dbo].[Provedor] as q";
            DataTable dt1 = conection.GetData(sqlQuery1);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt1.Rows)
                {
                    ListItem newItem = new ListItem(item[0].ToString() + item[1].ToString());
                    DD_Provedor.Items.Add(newItem);
                }
            }


            //Cargamos el DorwDowList de Metodos de Pago
            sqlQuery = "SELECT [idMetodo],[metodo] FROM [dbo].[MetodoPago]";
            dt = conection.GetData(sqlQuery);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    ListItem newItem = new ListItem(item[1].ToString(), item[0].ToString());
                    DD_Pago.Items.Add(newItem);
                }
            }
            dt.Dispose();

            string QR = "Select R.idRequisicion from [dbo].[Factura] AS F " +
                        "inner join dbo.Requisicion AS R On F.requisicion = R.idRequisicion where F.Estatus = 4";
            dt = conection.GetData(QR);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    ListItem newItem = new ListItem(item[0].ToString());
                    DropDownRequisiciones.Items.Add(newItem);
                }
            }

            conection.CloseDB();
        }

        protected void pagarFactura_Click(object sender, EventArgs e)
        {
            var factura = DD_Pagar.SelectedValue;
            var tipoPago = DD_Pago.SelectedValue;
            var prove = DD_Provedor.SelectedValue;

            ConectionDB conection = new ConectionDB();
            String SqlCommand = String.Format("UPDATE [dbo].[Factura] SET [pago] = {0},[fechaPago] = '{1}',[Estatus] = 5 WHERE idFactura = {2}", tipoPago, DateTime.Now.ToString("yyyy-MM-dd"),factura);
            try
            {
                var result = conection.insertCommand(SqlCommand);

                if (result != 0)
                {
                    //notificacion
                    DD_Pagar.Dispose();
                    DD_Pago.Dispose();
                    Response.Write("<script>alert('Pago registrado Exitosamente.');</script>");
                    Response.Redirect("~/PagarFactura");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            conection.CloseDB();
            DD_Pagar.SelectedValue = "";
            DD_Pago.SelectedValue = "";
        }

        protected void Btn_guardar_Click(object sender, EventArgs e)
        {
            var requisicion = DropDownRequisiciones.SelectedValue;
            var monto = Txt_Monto.Text;

            string sqlCommand = "update [dbo].[Factura] set total = "+monto+" , fechaMaxPago = '"+DateTime.Now.AddDays(30).ToString("yyyy-MM-dd")+"' where requisicion = "+ requisicion+"";
            ConectionDB connection = new ConectionDB();

            int result = connection.insertCommand(sqlCommand);
            sqlCommand = "update [dbo].[Requisicion] set estado = 3, fechaEntrega = '"+DateTime.Now.ToString("yyyy-MM-dd")+"';";
            result = connection.insertCommand(sqlCommand);
            if (result != 0)
            {
                //notificacion
                DD_Pagar.Dispose();
                DD_Pago.Dispose();
                Response.Write("<script>alert('Requisicion actualizada correctamente.');</script>");
                Response.Redirect("~/NuevaRequisicion");
            }

        }
    }
}