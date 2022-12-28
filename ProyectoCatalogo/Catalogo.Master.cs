using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Datos;
using ModeloDominio;
using Helper;

namespace ProyectoCatalogo
{
    public partial class Catalogo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] != null)
                {
                    linkInicioSesion.Text = "Bienvenido " + ((Usuario)Session["Usuario"]).User;
                }
            }
        }

        protected void linkInicioSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioSesion.aspx", false);
        }
        public bool Admin()
        {
            CatalogoHelper helper = new CatalogoHelper();
            return helper.validarAdmin((Usuario)Session["Usuario"]);
        }
    }
}