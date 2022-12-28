using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModeloDominio;
using Database;
using System.Diagnostics.Eventing.Reader;

namespace Datos
{
    public class DatosUsuario
    {
        public List<Usuario> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Usuario> lista = new List<Usuario>();
            try
            {
                datos.consulta("ListarUsuarios");
                datos.lectura();
                while (datos.Lector.Read())
                {
                    Usuario usuario = new Usuario((string)datos.Lector["Usuario"], (string)datos.Lector["Pass"]);
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.Admin = (bool)datos.Lector["Administrador"];

                    lista.Add(usuario);
                }
                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public bool login(Usuario usuario)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.consulta("IniciarSesion");
                datos.parametros("@usuario", usuario.User);
                datos.parametros("@pass", usuario.Pass);
                datos.lectura();

                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.Admin = (bool)datos.Lector["Administrador"];
                    return true;
                }
                return false;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
