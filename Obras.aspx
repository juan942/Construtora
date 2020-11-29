<%@ Page Title="Proyectos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Obras.aspx.cs" Inherits="ConstrucSistem.Obras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
 <!--<link href="Content/Obras.css" rel="stylesheet" type="text/css" />-->


    <div class="formulario">
            <div class="card col-lg-12" style="background-color:aliceblue">
               <div class="title2">
                    <h2>Proyectos Registrados</h2><asp:Button ID="Btn_newObra" runat="server" Text="+ Agregar" Height="25px" Width="103px" OnClick="Btn_newObra_Click" />
                </div>
            </div>

        <div class="card col-lg-12"  style="overflow:auto">
            <asp:GridView ID="proyec" runat="server" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px" 
                AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" EnablePersistedSelection="True"
               OnRowEditing="proyec_RowEditing" OnRowDeleting="proyec_RowDeleting" AutoGenerateColumns="False">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="Obra" HeaderText="Obra"/>
                        <asp:BoundField DataField="Cliente" HeaderText="Propietario"/>
                        <asp:BoundField DataField="direccion" HeaderText="Direccion"/>
                        <asp:BoundField DataField="Encargado" HeaderText="Encargado"/>
                        <asp:BoundField DataField="fechaInicio" HeaderText="Fecha de Inicio"/>
                        <asp:BoundField DataField="fechaTermino" HeaderText="Fecha de Termino"/>
                        <asp:CommandField ShowEditButton="True" ShowCancelButton="False" ShowDeleteButton="True" />
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

