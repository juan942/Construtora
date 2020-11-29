<%@ Page Title="Nuevos Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="ConstrucSistem.Proveedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<!--<link href="Content/Proveedores.css" rel="stylesheet" type="text/css" />-->

        <div class="card col-lg-12" style="background-color:aliceblue">
            <h2><%: Title %></h2>
        </div>
        <div class="formulario">
            <div class="razon">
                <asp:Label ID="Razn" runat="server" Text="Razon Social"></asp:Label>
                <asp:TextBox ID="Razon" runat="server" Height="26px" Width="265px"></asp:TextBox>
            </div>
            <br />
            <div class="categoria">
                 <asp:Label ID="categ" runat="server" Text="Categoria"></asp:Label>
                <asp:DropDownList ID="DD_categoria" runat="server" Height="25px" Width="251px">
                </asp:DropDownList>
            </div>
            <br />
            <div class="direccion">
                <asp:Label ID="diec" runat="server" Text="Dirección"></asp:Label>
                <asp:TextBox ID="direc" runat="server" Height="25px" Width="258px"></asp:TextBox>
            </div>
            <br />
            <div class="telefono">
                <asp:Label ID="Tle" runat="server" Text="Telefono"></asp:Label>
                <asp:TextBox ID="Tele" runat="server" Height="26px" Width="183px"></asp:TextBox>
            </div>
            <br />
            <div class="cuenta">
                <asp:Label ID="Cuena" runat="server" Text="Cuenta Bancaria"></asp:Label>
                <asp:TextBox ID="Cuenta" runat="server" Height="26px" Width="257px"></asp:TextBox>
            </div>
            <br />
            <div class="correo">
                <asp:Label ID="cocrro" runat="server" Text="Correo"></asp:Label>
                <asp:TextBox ID="cocrreo" runat="server" Height="26px" Width="257px"></asp:TextBox>
            </div>
            <br />
            <div class="boton">
                <asp:Button ID="Button1" runat="server" Text="Registrar" OnClick="Button1_Click" />
            </div>
            <br />
            <br />
        <div class="card col-lg-12" style="background-color:aliceblue">
            <h3>Proveedores Registrados</h3>
        </div>
            <div class="card col-lg-12"  style="overflow:auto">
                
          <asp:GridView ID="Tab_prove" runat="server" DataKeyNames="idProvedor" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" EnablePersistedSelection="True" AutoGenerateColumns="False">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="razonSocial" HeaderText="Razon Social"/>
                        <asp:BoundField DataField="descripcion" HeaderText="Categoria"/>
                        <asp:BoundField DataField="direccion" HeaderText="Direccion"/>
                        <asp:BoundField DataField="tel" HeaderText="Telefono"/>
                        <asp:BoundField DataField="correo" HeaderText="Correo"/>
                        <asp:BoundField DataField="cuentaBancaria" HeaderText="Cuenta Bancaria"/>
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