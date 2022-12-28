<%@ Page Title="" Language="C#" MasterPageFile="~/Catalogo.Master" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="ProyectoCatalogo.InicioSesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contenido/Estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-3 mt-3 m-auto text-light">
            <div class="row">
                <div class="mb-3">
                    <asp:Label ID="lblUsuario" CssClass="form-label" runat="server" Text="Usuario"></asp:Label>
                    <asp:TextBox ID="txtUsuario" CssClass="form-control" placeholder="Ingrese su usuario" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="mb-3">
                    <asp:Label ID="lblPass" CssClass="form-label" runat="server" Text="Contraseña"></asp:Label>
                    <asp:TextBox ID="txtPass" CssClass="form-control" placeholder="Ingrese su contraseña" TextMode="Password" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="mb-3" id="centrar">
                    <asp:Button ID="btnLogin" runat="server" cssclass="btn btn-outline-light btn-primary" OnClick="btnLogin_Click" Text="Iniciar Sesión" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="mb-3">
                    <a href="RecordarUsuario.aspx" class="form-label btn text-light">¿Olvidaste tu usuario o contraseña?</a>
                    <a href="Registrarse.aspx" class="form-label btn text-light">¿No tienes cuenta? Registrate.</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
