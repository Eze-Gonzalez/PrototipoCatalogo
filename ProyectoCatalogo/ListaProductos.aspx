<%@ Page Title="" Language="C#" MasterPageFile="~/Catalogo.Master" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="ProyectoCatalogo.ListaProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contenido/Estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col" id="contenedor">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <%-- Estructura de búsqueda y búsqueda avanzada --%>
                        <div class="col-3">
                            <div class="mb-3">
                                <asp:Button ID="btnBusqueda" runat="server" Text="Busqueda Avanzada" OnClick="btnBusqueda_Click" CssClass="btn btn-outline-light btn-primary" />
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="mb-3">
                                <asp:TextBox ID="txtFiltro" placeholder="Buscar" runat="server" AutoPostBack="true" CssClass="form-control w-50" OnTextChanged="txtFiltro_TextChanged"></asp:TextBox>
                                <asp:Button ID="btnFiltro" runat="server" Text="Buscar" OnClick="btnFiltro_Click" CssClass="btn btn-outline-light btn-primary" Style="position: relative; top: -38px; left: 324px;" />
                            </div>
                        </div>
                        <%if (chkAvanzado.Checked)
                            {%>
                        <div class="col-4">
                            <div class="mb-3">
                                <asp:Label ID="lblTipo" runat="server" Text="Tipo" CssClass="form-label text-light"></asp:Label>
                                <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged">
                                    <asp:ListItem Text="Seleccione un tipo" />
                                    <asp:ListItem Text="Código" />
                                    <asp:ListItem Text="Nombre" />
                                    <asp:ListItem Text="Categoría" />
                                    <asp:ListItem Text="Marca" />
                                    <asp:ListItem Text="Precio" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="mb-3">
                                <asp:Label ID="lblCriterio" runat="server" Text="Criterio" CssClass="form-label text-light"></asp:Label>
                                <asp:DropDownList ID="ddlCriterio" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="mb-3">
                                <asp:Label ID="lblFiltroAvanzado" runat="server" Text="Filtrar" CssClass="form-label text-light"></asp:Label>
                                <asp:TextBox ID="txtFiltroAvanzado" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="mb-3">
                                <asp:Button ID="btnFAvanzado" cssclass="btn btn-outline-light btn-primary" onclick="btnFAvanzado_Click" runat="server" Text="Buscar" />
                            </div>
                        </div>
                        <% } %>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%-- Estructura de la grilla --%>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="dgvProductos" CssClass="table table-bordered bg-black bg-opacity-25 text-center" 
                        runat="server" AutoGenerateColumns="false"
                        DataKeyNames="Id" AllowPaging="true" PageSize="6" OnPageIndexChanging="dgvProductos_PageIndexChanging"
                        OnSelectedIndexChanged="dgvProductos_SelectedIndexChanged"
                        HeaderStyle-BackColor="Black" ForeColor="White">
                        <Columns>
                            <asp:BoundField HeaderText="Código" DataField="Codigo" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                            <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
                            <asp:BoundField HeaderText="Precio" DataField="Precio" />
                            <asp:CommandField HeaderText="Detalles" ShowSelectButton="true" SelectText="🔎" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="row">
        <%-- Boton para agregar productos --%>
        <div class="col" id="botonAgregar">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" CssClass="btn btn-outline-light btn-primary" />
            <asp:CheckBox ID="chkAvanzado" Visible="false" runat="server" />
        </div>
    </div>
</asp:Content>
