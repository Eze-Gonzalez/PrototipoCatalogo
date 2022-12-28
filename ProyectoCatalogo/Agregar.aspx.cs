using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeloDominio;
using Datos;
using Helper;

namespace ProyectoCatalogo
{
    public partial class Agregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CatalogoHelper helper = new CatalogoHelper();
            if (helper.validarAdmin((Usuario)Session["usuario"]))
            {
                DatosMarca marcas = new DatosMarca();
                DatosCategoria categorias = new DatosCategoria();
                if (!IsPostBack)
                {
                    ddlCategoria.DataSource = categorias.listar();
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataBind();
                    ddlMarca.DataSource = marcas.listar();
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataBind();
                }

                if (Request.QueryString["id"] != null && !IsPostBack)
                {

                    int id = int.Parse(Request.QueryString["id"]);
                    DatosProducto datos = new DatosProducto();
                    Producto modificado = datos.buscarProducto(id);
                    txtCodigo.Text = modificado.Codigo;
                    txtNombre.Text = modificado.Nombre;
                    txtDescripción.Text = modificado.Descripcion;
                    txtImagen.Text = modificado.ImagenUrl;
                    ddlCategoria.SelectedValue = modificado.Categoria.Id.ToString();
                    ddlMarca.SelectedValue = modificado.Marca.Id.ToString();
                    txtPrecio.Text = modificado.Precio.ToString();
                    Title = "Modificar " + modificado.Nombre;
                }
                else
                {
                    Title = "Agregar producto";

                }
                cargarimagen(txtImagen.Text);
            }
            else
            {
                Session.Add("Error", "Debes ser Administrador para entrar a esta sección.");
                Response.Redirect("Error.aspx", false);
            }
            
        }

        private void cargarimagen(string imagen)
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

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            DatosProducto datos = new DatosProducto();
            Producto producto = new Producto();
            try
            {
                producto.Codigo = txtCodigo.Text;
                producto.Nombre = txtNombre.Text;
                producto.Descripcion = txtDescripción.Text;
                producto.ImagenUrl = txtImagen.Text;
                producto.Precio = Math.Round(decimal.Parse(txtPrecio.Text), 2, MidpointRounding.AwayFromZero);
                producto.Categoria = new Categoria();
                producto.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
                producto.Marca = new Marca();
                producto.Marca.Id = int.Parse(ddlMarca.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    producto.Id = int.Parse(Request.QueryString["id"]);
                    datos.modificar(producto);
                }
                else
                {
                    datos.agregar(producto);
                }
                Response.Redirect("Detalles.aspx?id=" + Request.QueryString["id"], false);
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void txtImagen_TextChanged(object sender, EventArgs e)
        {
            cargarimagen(txtImagen.Text);
        }
    }
}