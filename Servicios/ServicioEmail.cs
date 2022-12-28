using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Servicios
{
    public class ServicioEmail
    {
        private MailMessage email;
        private SmtpClient servidor;

        public ServicioEmail()
        {
            servidor = new SmtpClient();
            servidor.Credentials = new NetworkCredential("6dd5f76512f7b3", "9d53556cb70915");
            servidor.EnableSsl = true;
            servidor.Port = 2525;
            servidor.Host = "smtp.mailtrap.io";
        }
        public void armarEmail(string emailUsuario, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@catalogoweb.com");
            email.To.Add(emailUsuario);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = "<h3>Prueba</h3>";
        }
        public void enviarEmail()
        {
            try
            {
                servidor.Send(email);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
