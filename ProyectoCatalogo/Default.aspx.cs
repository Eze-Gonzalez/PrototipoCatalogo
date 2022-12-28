using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeloDominio;
using Datos;

namespace ProyectoCatalogo
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Cargo las tarjetas inicialmente.
            if (!IsPostBack)
            {
                DatosProducto datos = new DatosProducto();
                Session.Add("productos", datos.listar());
                repProductos.DataSource = Session["productos"];
                repProductos.DataBind();
            }
        }
    }
}