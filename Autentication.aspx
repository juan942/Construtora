<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Autentication.aspx.cs" Inherits="ConstrucSistem.Autentication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Autentificacion.css" rel="stylesheet" type="text/css" />
    <link href="Content/Master.css" rel="stylesheet" type="text/css" />
<div id="a">
        <div class="container">
            <div class="row">
                <div class="col-md-5 offset-md-3">
                    <div class="card_login" style="margin-bottom: 4em;">
                        <div class="logo">
                            <img src="images/Constructora.png" alt="" style="height: 11em;margin-left: 2em;" />
                        </div>
                        <h2>Bienvenidos</h2>
                        <div>
                            <div class="form-group">
                                <input type="email" CssClass="form-control" id="Txt_Email" placeholder="E-mail" runat="server" />
                            </div>
                            <div class="form-group">
                                <input type="password" CssClass="form-control" id="Txt_Pwd" placeholder="Password" runat="server"/>
                            </div>
                            <br />
                            <asp:Button ID="Btn_Login" runat="server" Text="Login" OnClick="Btn_Login_Click" Height="50px" Width="100px" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</asp:Content>
