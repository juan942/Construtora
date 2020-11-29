<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ConstrucSistem.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <link href="Content/Home.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<div class="card col-lg-12">
        <div class="title1">
            <h2>Proyectos</h2>
        </div>
</div>

<div class="card col-lg-12"  style="overflow:auto">
            <asp:GridView ID="Proyec" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Identificador proyecto"/>
                <asp:BoundField DataField="Cliente" HeaderText="Cliente"/>
                <asp:BoundField DataField="Encargado" HeaderText="Encargado"/>
                <asp:BoundField DataField="Obra" HeaderText="Obra"/>
                <asp:BoundField DataField="direccion" HeaderText="Direccion"/>
                <asp:BoundField DataField="fechaInicio" HeaderText="Inicio de Obra" />
                <asp:BoundField DataField="fechaTermino" HeaderText="Termino de Obra"/>
                <asp:BoundField DataField="Total" HeaderText="Costo de Obra" DataFormatString="$ {0}"/>
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
<div class="card col-lg-12">
        <div class="title1">
            <h2>Facturas Pendientes</h2>
        </div>
</div>
    <div class="card col-lg-12"  style="overflow:auto">

         <asp:GridView ID="FacturasPendientesPago" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="fechaEntrega" HeaderText="Fecha de Entrega"/>
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
  <div class="card col-lg-12">
        <div class="title1">
                        <h2>Facturas Pagadas</h2>
        </div>
</div>
        <div class="card col-lg-12"  style="overflow:auto">
             <asp:GridView ID="Pagados" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="fechaPago" HeaderText="Fecha de Pago"/>
                    <asp:BoundField DataField="nombre" HeaderText="Proyecto"/>
                    <asp:BoundField DataField="razonSocial" HeaderText="Provedor"/>
                    <asp:BoundField DataField="metodo" HeaderText="Metodo Pago"/>
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
    
</asp:Content>

