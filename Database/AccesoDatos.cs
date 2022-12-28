using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Database
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;
        public SqlDataReader Lector
        {
            get { return lector; }
        }
        public AccesoDatos()
        {
            try
            {
                conexion = new SqlConnection("server=.\\SQLEXPRESS; database=CATALOGO_DB; integrated security=true");
                comando = new SqlCommand();
            }
            catch (Exception)
            {
                MessageBox.Show("Hubo un error al intentar conectar con la base de datos, intente nuevamente, si el problema persiste, contacte a su desarrollador", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void consultaFiltro(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }
        public void consulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = consulta;
        }
        public void lectura()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception)
            {
                MessageBox.Show("Hubo un error al intentar conectar con la base de datos, intente nuevamente, si el problema persiste, contacte a su desarrollador", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void ejecutar()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception)
            {
                MessageBox.Show("Hubo un error al intentar conectar con la base de datos, intente nuevamente, si el problema persiste, contacte a su desarrollador", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void parametros(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }
        public void cerrarConexion()
        {
            if (lector != null)
                lector.Close();
            conexion.Close();
        }
    }
}
