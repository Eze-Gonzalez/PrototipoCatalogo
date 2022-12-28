using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeloDominio;
using Helper;

namespace ProyectoCatalogo
{
    public partial class ListaProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CatalogoHelper helper = new CatalogoHelper();
            //Cargo la grilla inicialmente.
            if (!IsPostBack)
            {
                DatosProducto datos = new DatosProducto();
                Session.Add("productos", datos.listar());
                dgvProductos.DataSource = Session["productos"];
                dgvProductos.DataBind();
            }
            if (Session["usuario"] == null)
            {
                Response.Redirect("InicioSesion.aspx", false);
            }else if (!(helper.validarAdmin((Usuario)Session["usuario"])))
            {
                Session.Add("Error", "Debes ser Administrador para entrar a esta sección.");
                Response.Redirect("Error.aspx", false);
            }

        }
        protected void dgvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvProductos.PageIndex = e.NewPageIndex;
            dgvProductos.DataBind();
        }
        protected void dgvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Configuro el boton de detalles.
            string id = dgvProductos.SelectedDataKey.Value.ToString();
            Response.Redirect("Detalles.aspx?id=" + id, false);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //Envio a la pagina para agregar si doy click en el boton.
            Response.Redirect("Agregar.aspx", false);
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            //configuro el filtro rapido solo con el texto.
            List<Producto> lista = (List<Producto>)Session["productos"];
            DatosProducto datos = new DatosProducto();
            dgvProductos.DataSource = datos.buscar(lista, txtFiltro.Text, true);
            dgvProductos.DataBind();
        }

        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            //configuro el filtro rapido con boton, ya que no es instantaneo el cambio de texto en la linea 45
            //por lo que a algunas personas se les podría dificultar entender como se busca.
            List<Producto> lista = (List<Producto>)Session["productos"];
            DatosProducto datos = new DatosProducto();
            dgvProductos.DataSource = datos.buscar(lista, txtFiltro.Text, true);
            dgvProductos.DataBind();
        }

        protected void btnBusqueda_Click(object sender, EventArgs e)
        {
            //Configuro para que aparezcan y desaparezcan los filtros, según correspondan.
            if (btnBusqueda.Text == "Busqueda Avanzada")
            {
                chkAvanzado.Checked = true;
                txtFiltro.Visible = !chkAvanzado.Checked;
                btnFiltro.Visible = !chkAvanzado.Checked;
                btnBusqueda.Text = "Mostrar Todo";
            }
            else
            {
                chkAvanzado.Checked = false;
                txtFiltro.Visible = !chkAvanzado.Checked;
                btnFiltro.Visible = !chkAvanzado.Checked;
                btnBusqueda.Text = "Busqueda Avanzada";
                ddlTipo.SelectedIndex = 0;
                ddlCriterio.Items.Clear();
                dgvProductos.DataSource = Session["productos"];
                dgvProductos.DataBind();
            }
        }
        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            txtFiltroAvanzado.Text = "";
            if (ddlTipo.SelectedIndex > 0)
            {
                if (ddlTipo.SelectedItem.ToString() == "Precio")
                {
                    ddlCriterio.Items.Add("Mayor a");
                    ddlCriterio.Items.Add("Menor a");
                    ddlCriterio.Items.Add("Igual a");
                }
                else
                {
                    ddlCriterio.Items.Add("Empieza con");
                    ddlCriterio.Items.Add("Termina con");
                    ddlCriterio.Items.Add("Contiene");
                }
            }
            else
                ddlCriterio.Items.Clear();
        }

        protected void btnFAvanzado_Click(object sender, EventArgs e)
        {
            DatosProducto datos = new DatosProducto();
            dgvProductos.DataSource = datos.filtrar(ddlTipo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(), txtFiltroAvanzado.Text);
            dgvProductos.DataBind();
        }
    }
}