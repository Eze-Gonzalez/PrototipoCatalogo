using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModeloDominio
{
    public class Usuario
    {
        public int Id { get; set; }
        public string User { get; set; }
        public string Pass { get; set; }
        public bool Admin { get; set; }

        public Usuario(string user, string pass) 
        {
            User = user;
            Pass = pass;
        }
    }
}
