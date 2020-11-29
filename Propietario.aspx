<%@ Page Title="Propietarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Propietario.aspx.cs" Inherits="ConstrucSistem.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--<link href="Content/Propietario.css" rel="stylesheet" type="text/css" />-->

        <div class="card col-lg-12" style="background-color:aliceblue">
            <h2><%: Title %></h2>
        </div>
        <div class="formulario">
            <div class="nombre">
                <asp:Label ID="Label5" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="nombre_txt" runat="server" Height="26px" Width="265px"></asp:TextBox>
            </div>
            <div class="apellido">
                <asp:Label ID="Label3" runat="server" Text="Apellido"></asp:Label>
                <asp:TextBox ID="apellido_text" runat="server" Height="25px" Width="258px"></asp:TextBox>
            </div>
            <div class="telefono">
                <asp:Label ID="Label6" runat="server" Text="Telefono"></asp:Label>
                <asp:TextBox ID="telefono_text" runat="server" Height="26px" Width="183px"></asp:TextBox>
            </div>
                <div class="boton">
                    <asp:Button ID="guardar_propietario" runat="server" Text="Registrar" OnClick="guardar_propietario_Click" />
                </div>
                <div class="card col-lg-12" style="background-color:aliceblue">
                    <hr />
                    <h3>Propietarios Registrados</h3>
                </div>
                <div class="boton2">
                    <asp:Button ID="Button2" runat="server" Text="Actualizar lista" />
                </div>
            <div class="card col-lg-12"  style="overflow:auto">

            <asp:GridView ID="proyec" runat="server" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" EnablePersistedSelection="True">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre(s)"/>
                        <asp:BoundField DataField="apellido" HeaderText="Apellido(s)"/>
                        <asp:BoundField DataField="celular" HeaderText="Telefono"/>
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
