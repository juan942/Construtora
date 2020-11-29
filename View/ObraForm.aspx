<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ObraForm.aspx.cs" Inherits="ConstrucSistem.View.ObraForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form">
            <div class="calendario">
                    <asp:HiddenField ID="ID_obra" runat="server" />
                    &nbsp;
                    <asp:Calendar ID="fecha_DP" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Caption="Fecha:" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="16px" NextPrevFormat="ShortMonth" Width="221px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                        <WeekendDayStyle HorizontalAlign="Center" />
                    </asp:Calendar>                                          
                    <br />
            </div>
            <div class="inputEncargado">
                    <asp:Label ID="Label1" runat="server" Text="Encargado:"></asp:Label>
                    <asp:DropDownList ID="DD_Encargado" runat="server" Height="22px">
                    </asp:DropDownList>
                    <br />
            </div>
            <div class="inputPropietario">
                    <asp:Label ID="Label2" runat="server" Text="Propietario:"></asp:Label>
                    <asp:DropDownList ID="DD_Propietario" runat="server" Height="22px">
                    </asp:DropDownList>
                    <br />
            </div>
            <div class="inputNombre">
                    <asp:Label ID="Label4" runat="server" Text="Nombre:"></asp:Label>
                    &nbsp;
                    <input id="nombre_txt" type="text" runat="server" />
                    <br />
            </div>
            <div  class="inputDireccion">
                    <asp:Label ID="Label3" runat="server" Text="Direccion:"></asp:Label>
                    &nbsp;
                    <input id="Txt_Direccion" type="text" runat="server" />
            </div>
            <div  class="Btn-send">
                <asp:Button ID="BtnSave"  runat="server" Font-Bold="True" ForeColor="#FF9933" Text="Guardar" Height="40px" UseSubmitBehavior="False" OnClick="guardarObra_btn_Click" />
            </div
        </div>
</asp:Content>
