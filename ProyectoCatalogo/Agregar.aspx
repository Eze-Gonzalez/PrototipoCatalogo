<%@ Page Title="" Language="C#" MasterPageFile="~/Catalogo.Master" AutoEventWireup="true" CodeBehind="Agregar.aspx.cs" Inherits="ProyectoCatalogo.Agregar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contenido/Estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" id="contenedor">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label ID="lblCodigo" runat="server" Text="Código" CssClass="form-label text-light"></asp:Label>
                <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label text-light"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblDescripcion" runat="server" Text="Descripción" CssClass="form-label text-light"></asp:Label>
                <asp:TextBox ID="txtDescripción" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblCategoria" runat="server" Text="Categoría" CssClass="form-label text-light"></asp:Label>
                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblMarca" runat="server" Text="Marca" CssClass="form-label text-light"></asp:Label>
                <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <asp:Label ID="lblPrecio" runat="server" Text="Precio" CssClass="form-label text-light"></asp:Label>
                <asp:TextBox ID="txtPrecio" placeholder="Solo numeros sin separación de mil ni símbolos" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="lblImagen" runat="server" Text="Imagen" CssClass="form-label text-light"></asp:Label>
                <asp:TextBox ID="txtImagen" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImagen_TextChanged"></asp:TextBox>
            </div>
            <div class="mb-3" id="centrar">
                <asp:Image ID="imgProducto" runat="server" Style="max-height: 240px" />
            </div>
        </div>
        <div class="row" id="centrar1">
            <div class="col-3">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-outline-light btn-primary" onclick="btnAceptar_Click"/>
            </div>
            <div class="col-3">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-outline-light btn-primary" onclick="btnCancelar_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
