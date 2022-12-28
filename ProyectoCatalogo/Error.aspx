<%@ Page Title="" Language="C#" MasterPageFile="~/Catalogo.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="ProyectoCatalogo.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
            <div class="card text-center">
                <div class="card-header">
                    Error
                </div>
                <div class="card-body">
                    <h5 class="card-title">Error al ingresar a la página</h5>
                    <asp:Label ID="lblError" CssClass="card-text" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="card-footer text-muted">
                    <a href="Default.aspx" class="btn btn-primary">Inicio</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
