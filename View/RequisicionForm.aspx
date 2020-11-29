<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequisicionForm.aspx.cs" Inherits="ConstrucSistem.View.RequisicionForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form">
                <div class="calendario">
                    <asp:Label ID="Label1" runat="server" Text="Fecha"></asp:Label>
                    <asp:Calendar ID="fecha_txt" runat="server"></asp:Calendar>
                </div>
        <br />
                <div class="inputObra">
                     <asp:Label ID="Label2" runat="server" Text="Obra"></asp:Label>
                    <asp:DropDownList ID="DD_Obra" runat="server" Height="23px" Width="223px"></asp:DropDownList>
                </div>
        <br />
                <div class="inputMaterial">
                    <asp:Label ID="Label4" runat="server" Text="tipo de material"></asp:Label>
                    <asp:DropDownList ID="DD_categoria" runat="server" Height="23px" Width="223px"></asp:DropDownList>
                </div>
        <br />
                <div class="inputDescripcion">
                    <textarea id="material_txt" name="S1" runat="server" ></textarea>
                </div>
        <br />
                <div class="Btn-send">
                    <asp:Button ID="solicitar_materialBtn" runat="server" Text="Enviar" OnClick="solicitar_materialBtn_Click" Height="37px" Width="211px" />
                </div>
            </div>
</asp:Content>
