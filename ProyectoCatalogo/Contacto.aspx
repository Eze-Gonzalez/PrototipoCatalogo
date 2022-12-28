<%@ Page Title="" Language="C#" MasterPageFile="~/Catalogo.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="ProyectoCatalogo.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
            <div class="card text-center text-light bg-black bg-opacity-25">
                <div class="card-header h4">
                    <%if (!MailEnviado)
                        {  %>
                    Formulario de contacto.
                    <%}
                        else
                        { %>
                    Mensaje Enviado.
                    <%}%>
                </div>
                <div class="card-body w-50 m-auto">
                    <%if (!MailEnviado)
                        {

                    %>
                    <div class="mb-3">
                        <label for="txtEmail" class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="nombre@ejemplo.com" TextMode="email" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="txtAsunto" class="form-label">Asunto</label>
                        <asp:TextBox ID="txtAsunto" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="txtMensaje" class="form-label">Mensaje</label>
                        <asp:TextBox ID="txtMensaje" TextMode="Multiline" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="card-footer text-muted">
                    <asp:Button ID="btnEnviar" CssClass="btn btn-outline-light btn-primary" Text="Enviar" OnClick="btnEnviar_Click" runat="server" />
                </div>
                <%}
                    else
                    {  %>
                <div class="mb-3">
                    <label class="form-label">Su mensaje fue enviado exitosamente. Gracias por contactarse!</label>
                </div>
                <div class="card-footer text-muted">
                    <asp:Button ID="btnInicio" CssClass="btn btn-outline-light btn-primary" Text="Volver al inicio" OnClick="btnInicio_Click" runat="server" />
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
