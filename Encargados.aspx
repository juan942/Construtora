<%@ Page Title="Encargados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Encargados.aspx.cs" Inherits="ConstrucSistem.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--<link href="Content/Encargados.css" rel="stylesheet" type="text/css" />-->



        <div class="card col-lg-12" style="background-color:aliceblue">
            <h2><%: Title %></h2>
        </div>
        <div class="formulario">
                <div class="nombre">
                    <asp:Label ID="Label5" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="nombre_txt" runat="server" Width="292px"></asp:TextBox>
                 </div>
                 <div class="apellido">
                    <asp:Label ID="Label2" runat="server" Text="Apellido"></asp:Label>
                    <asp:TextBox ID="apellido_txt" runat="server" Width="292px"></asp:TextBox>
                 </div>
                <div class="correo">
                    <asp:Label ID="Label3" runat="server" Text="Correo"></asp:Label>
                    <asp:TextBox ID="correo_txt" runat="server" Width="292px"></asp:TextBox>
                 </div>
                <div class="celular">
                    <asp:Label ID="Label4" runat="server" Text="Celular"></asp:Label>
                    <asp:TextBox ID="celular_txt" runat="server" Width="292px"></asp:TextBox>
                 </div>
                <div class="boton">
                    <asp:Button ID="guardar_user" runat="server" Text="Registrar" OnClick="guardar_user_Click" />
                </div>
                <div class="card col-lg-12" style="background-color:aliceblue">
                        <h2>Encargados Registrados</h2>
                    <hr />
                    <asp:Button ID="Button2" runat="server" Text="Mostrar todos" />
                </div>
                <div class="card col-lg-12" style="overflow:auto">
              <asp:GridView ID="empleados" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre(s)"/>
                        <asp:BoundField DataField="apellido" HeaderText="Apellido(s)"/>
                        <asp:BoundField DataField="correo" HeaderText="Correo"/>
                        <asp:BoundField DataField="celular" HeaderText="Celular"/>
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
