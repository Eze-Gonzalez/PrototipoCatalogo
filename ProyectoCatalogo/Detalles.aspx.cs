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
    public partial class Detalles : System.Web.UI.Page
    {
        public bool eliminar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            DatosProducto datos = new DatosProducto();
            
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    Producto detalle = datos.buscarProducto(int.Parse(Request.QueryString["id"]));
                    txtCodigo.Text = detalle.Codigo;
                    txtNombre.Text = detalle.Nombre;
                    txtDescripcion.Text = detalle.Descripcion;
                    txtCategoria.Text = detalle.Categoria.Descripcion;
                    txtMarca.Text = detalle.Marca.Descripcion;
                    txtPrecio.Text = detalle.Precio.ToString();
                    cargarImagen(detalle.ImagenUrl);
                    Title = "Detalles de " + detalle.Nombre;
                }
                    
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void cargarImagen(string imagen)
        {
            try
            {
                if (imagen != "" && imagen != " " && imagen != null)
                    imgProducto.ImageUrl = imagen;
                else
                    imgProducto.ImageUrl = "https://i.imgur.com/yzczBvI.png";
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            CatalogoHelper helper = new CatalogoHelper();
            if (helper.validarAdmin((Usuario)Session["usuario"]))
                Response.Redirect("ListaProductos.aspx", false);
            else
                Response.Redirect("Default.aspx", false);
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Agregar.aspx?id=" + Request.QueryString["id"], false);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            eliminar = true;
            btnEliminar.Visible = false;
            btnModificar.Visible = false;
            lblConfirmacion.Text = "Esta a punto de eliminar el producto " + txtNombre.Text + ", esta acción no se puede revertir, ¿desea continuar?";
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            DatosProducto datos = new DatosProducto();
            int id = int.Parse(Request.QueryString["id"]);
            datos.eliminar(id);
            Response.Redirect("ListaProductos.aspx", false);
            eliminar = false;
            btnEliminar.Visible = true;
            btnModificar.Visible = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            eliminar = false;
            btnEliminar.Visible = true;
            btnModificar.Visible = true;
        }
        public bool Admin()
        {
            CatalogoHelper helper = new CatalogoHelper();
            return helper.validarAdmin((Usuario)Session["usuario"]);
        }
    }
}