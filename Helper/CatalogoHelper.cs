using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using ModeloDominio;

namespace Helper
{
    public class CatalogoHelper
    {
        public bool validarAdmin(Usuario usuario)
        {
            if (usuario!= null && usuario.Admin)
                return true;
            else
                return false;
        }
    }
}
