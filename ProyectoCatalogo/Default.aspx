<%@ Page Title="" Language="C#" MasterPageFile="~/Catalogo.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoCatalogo.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contenido/Estilo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <%-- Estructura del texto "Productos" --%>
    <div class="col-6">
        <h3 class="text-light position-relative" style="top: 10px">Productos</h3>
    </div>
    <%-- Estructura de las tarjetas --%>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater runat="server" ID="repProductos">
            <ItemTemplate>
                <div class="col">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0 bg-black bg-opacity-25">
                            <div class="col-md-4 border border-dark rounded-start" id="img">
                                <img src='<%#Eval("ImagenUrl") %>' class="img-fluid rounded-start" alt='<%#Eval("Nombre") %>' style="object-fit: cover">
                            </div>
                            <div class="col-md-8 border border-dark rounded-end">
                                <div class="card-body">
                                    <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                    <p class="card-text"><%#Eval("Precio") %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <%-- Filtro --%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
