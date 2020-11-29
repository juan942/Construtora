<%@ Page Title="Categorias" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="ConstrucSistem.Categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <!-- <link href="Content/Categoria.css" rel="stylesheet" type="text/css" />-->

        <div class="alert alert-warning alert-dismissible fade show" role="alert">
          <strong>Holy guacamole!</strong> You should check in on some of those fields below.
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="formulario">
                <div id="title1" class="card col-lg-12" style="background-color:aliceblue">
                    <h2>Nueva Categoria</h2>
                </div>
                <div class="form1">
                    <div class="input_descripcion">
                        <asp:Label ID="Label5" runat="server" Text="Descripcion:"></asp:Label>
                        <asp:TextBox ID="Text_categoria" runat="server" Height="26px" Width="265px"></asp:TextBox>
                    </div>
                    <div class="btn_send">
                        <asp:Button ID="Btn_GuardarCategoria" runat="server" Text="Registrar" OnClick="Btn_GuardarCategoria_Click" />
                    </div>
                </div>

            <div class="title3">
            <h3>Categorias Registradas</h3>
        </div>
            <div class="card col-lg-12" style="overflow:auto">
               <asp:GridView ID="cate" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1259px">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="idCategoria" HeaderText="Identificador"/>
                            <asp:BoundField DataField="descripcion" HeaderText="Descripcion"/>
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
