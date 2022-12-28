using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Servicios;

namespace ProyectoCatalogo
{
    public partial class Contacto : System.Web.UI.Page
    {
        public bool MailEnviado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            MailEnviado = false;
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            ServicioEmail servicio = new ServicioEmail();
            try
            {
                servicio.armarEmail(txtEmail.Text, txtAsunto.Text, txtMensaje.Text);
                servicio.enviarEmail();
                MailEnviado = true;
            }
            catch (Exception)
            {
                MailEnviado = false;
                throw;
            }
        }

        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
    }
}