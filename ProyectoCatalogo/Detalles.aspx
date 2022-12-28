<%@ Page Title="" Language="C#" MasterPageFile="~/Catalogo.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="ProyectoCatalogo.Detalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contenido/Estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col">
        <div class="card text-center bg-black bg-opacity-50" id="contenedor" style="height: 830px">
            <div class="card-header bg-secondary bg-opacity-25" id="centrar">
                <ul class="nav nav-pills card-header-pills">
                    <li class="nav-item">
                        <asp:Button ID="btnRegresar" CssClass="btn btn-primary" runat="server" Text="Regresar" Style="position: relative; right: 30px;" OnClick="btnRegresar_Click" />
                    </li>
                    <%if (Admin()) { %>
                    <li class="nav-item">
                        <asp:Button ID="btnModificar" CssClass="btn btn-warning" runat="server" Text="Modificar" Style="position: relative; right: 10px;" OnClick="btnModificar_Click" />
                    </li>
                    <li class="nav-item">
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" Style="position: relative; left: 10px;" OnClick="btnEliminar_Click" />
                    </li>
                    <%if (eliminar)
                        {%>
                    <li class="nav-item">
                        <asp:Label ID="lblConfirmacion" runat="server" Text="" CssClass="text-light card-text h5 text-bg-danger rounded-1 border border-danger" Style="position: relative; top: 8px;"></asp:Label>
                    </li>
                    <li class="nav-item ms-3">
                        <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" CssClass="btn btn-success" />
                    </li>
                    <li class="nav-item ms-3">
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" CssClass="btn btn-primary" />
                    </li>
                    <% } %>
                    <%}  %>
                </ul>
            </div>
            <div class="card-body">
                <div class="col-6 border-end border-5 border-secondary" id="centrar1" style="height: 772px; position: absolute; top: 56px;">
                    <asp:Image ID="imgProducto" runat="server" CssClass="img-fluid" ImageUrl="https://i.imgur.com/rMuhyd0.png" />
                </div>
                <div class="row">
                    <div class="col-6 position-relative start-50 ms-4 p-5">
                        <div class="mb-4">
                            <asp:Label ID="lblCodigo" CssClass="text-light h3 card-text" runat="server" Text="Código"></asp:Label>
                            <div class="col">
                                <asp:TextBox ID="txtCodigo" CssClass="form-control bg-secondary text-light" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="mb-4">
                            <asp:Label ID="lblNombre" CssClass="text-light h3 card-text" runat="server" Text="Nombre"></asp:Label>
                            <div class="col">
                                <asp:TextBox ID="txtNombre" CssClass="form-control bg-secondary text-light" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="mb-4">
                            <asp:Label ID="lblDescripcion" CssClass="text-light h3 card-text" runat="server" Text="Descripción"></asp:Label>
                            <div class="col">
                                <asp:TextBox ID="txtDescripcion" CssClass="form-control bg-secondary text-light" Enabled="false" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="mb-4">
                            <asp:Label ID="lblCategoria" CssClass="text-light h3 card-text" runat="server" Text="Categoría"></asp:Label>
                            <div class="col">
                                <asp:TextBox ID="txtCategoria" CssClass="form-control bg-secondary text-light" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="mb-4">
                            <asp:Label ID="lblMarca" CssClass="form-label text-light h3" runat="server" Text="Marca"></asp:Label>
                            <div class="col">
                                <asp:TextBox ID="txtMarca" CssClass="form-control bg-secondary text-light" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="mb-4">
                            <asp:Label ID="lblPrecio" CssClass="form-label text-light h3" runat="server" Text="Precio"></asp:Label>
                            <div class="col">
                                <asp:TextBox ID="txtPrecio" CssClass="form-control bg-secondary text-light" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
