<%@ Page Title="Requisiciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevaRequisicion.aspx.cs" Inherits="ConstrucSistem.NRequisicion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--<link href="Content/Nrequisicion.css" rel="stylesheet" type="text/css" />-->

            <div class="card col-lg-12" style="background-color:aliceblue">
                <h2>Requisiciones</h2>
                <asp:Button ID="BtnNuevo" runat="server" Text="+ Nueva Requision" Height="22px" OnClick="BtnNuevo_Click" Width="139px" />
            </div>
            <div class="card col-lg-12"  style="overflow:auto">
              <asp:GridView ID="TableReques" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px"
                   OnRowDeleting="TableReques_RowDeleting" OnRowEditing="TableReques_RowEditing" OnRowCreated="TableReques_RowCreated">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="idRequisicion" HeaderText="ID"/>
                    <asp:BoundField DataField="fechaCreacion" HeaderText="Fecha creación"/>
                    <asp:BoundField DataField="Encargado" HeaderText="Encargado"/>
                    <asp:BoundField DataField="nombre" HeaderText="Obra"/>
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo material" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                    <asp:BoundField DataField="Estatus" HeaderText="Estatus" />
                    <asp:CommandField ShowEditButton="True" ShowCancelButton="False" ShowDeleteButton="True" EditText="Aprovar" />
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