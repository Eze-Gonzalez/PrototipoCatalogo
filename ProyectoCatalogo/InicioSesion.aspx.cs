using Datos;
using ModeloDominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoCatalogo
{
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            DatosUsuario datos = new DatosUsuario();
            try
            {
                usuario = new Usuario(txtUsuario.Text, txtPass.Text);
                if (datos.login(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Default.aspx", false);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}