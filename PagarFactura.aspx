<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PagarFactura.aspx.cs" Inherits="ConstrucSistem.Pagar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <!--<link href="Content/PagarFactura.css" rel="stylesheet" type="text/css" />-->

          <div class="formulario">
                <div class="card col-lg-12" style="background-color:aliceblue">
                    <h2>Facturas sin pagar</h2>
                </div>
        <div class="card col-lg-12" style="overflow:auto">
             <asp:Label ID="Label2" runat="server" Text="Nota a pagar:"></asp:Label>
            <asp:DropDownList ID="DD_Pagar" runat="server" Height="25px" Width="258px">
            </asp:DropDownList>
                <asp:Label ID="Label1" runat="server" Text="Tipo de Pago:"></asp:Label>
            <asp:DropDownList ID="DD_Pago" runat="server" Height="25px" Width="258px">
            </asp:DropDownList>
                <asp:Button ID="pagarFactura" runat="server" Text="Registrar el pago" OnClick="pagarFactura_Click" />
             <br />
            <br />
            <asp:GridView ID="FacturasPendientesPago" DataKeyNames="idFactura" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px" EnablePersistedSelection="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="idFactura" HeaderText="ID"/>
                    <asp:BoundField DataField="fechaMaxPago" HeaderText="Fecha Max Pago"/>
                    <asp:BoundField DataField="razonSocial" HeaderText="Proveedor"/>
                    <asp:BoundField DataField="DiasRestantes" HeaderText="Dias Restantes"/>
                    <asp:BoundField DataField="total" HeaderText="Total" DataFormatString="$ {0}"/>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>  
                   
         </div>
              <br />
              <br />

                <div class="card col-lg-12" style="background-color:aliceblue">
                    <h2>Requisiciones Pendientes de Entrega</h2>
                </div>
                <div class="card col-lg-12"  style="overflow:auto">
                    <asp:Label ID="Label3" runat="server" Text="Marcar como entregado:"></asp:Label>
                        <asp:DropDownList ID="DropDownRequisiciones" runat="server" Height="25px" Width="258px">
                        </asp:DropDownList><br />
                    <asp:Label ID="Label4" runat="server" Text="Monto"></asp:Label>
                        <asp:TextBox ID="Txt_Monto" runat="server" Width="263px" Height="16px"></asp:TextBox>
                    <asp:Label ID="Label5" runat="server" Text="Proveedor a pagar:"></asp:Label>
                        <asp:DropDownList ID="DD_Provedor" runat="server" Height="25px" Width="258px">
                        </asp:DropDownList><br />
                    <asp:Button ID="Btn_guardar" runat="server" Text="Guardar" OnClick="Btn_guardar_Click" />
                    <br />
                    <br />
                    <asp:GridView ID="Requisiciones" runat="server" AutoGenerateColumns="False" DataKeyNames="idFactura" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px" EnablePersistedSelection="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="idRequisicion" HeaderText="ID"/>
                            <asp:BoundField DataField="fechaCreacion" HeaderText="Requisitado el"/>
                            <asp:BoundField DataField="razonSocial" HeaderText="Proveedor"/>
                            <asp:BoundField DataField="nombre" HeaderText="Obra"/>
                            <asp:BoundField DataField="fechaPedido" HeaderText="Solicitado el"/>
                            <asp:BoundField DataField="descripcion" HeaderText="Estatus"/>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                 </div>
          </div>


</asp:Content>
