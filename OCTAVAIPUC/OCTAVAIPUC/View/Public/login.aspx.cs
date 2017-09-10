using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCTAVAIPUC.Models;
using System.Data;

namespace OCTAVAIPUC.View.Public
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonValidar_Click(object sender, EventArgs e)
        {

        }

        protected void ValidarUsuario(object sender, EventArgs e)
        {
            //Condicion de validaciòn del usuario
            if (new Usuario().ValidarUsuario(TextUsuario.Value, TextPass.Value))
            {
                DataTable Consulta = new Usuario().ConsultarUsuario(TextUsuario.Value);

                //Iniciar sesiòn del usuario
                Usuario USU = new Usuario();
                USU.IDUSUARIO = Consulta.Rows[0]["IDUSUARIO"].ToString();
                USU.USU_USER = Consulta.Rows[0]["USU_USER"].ToString();
                USU.USU_IDROL = Consulta.Rows[0]["USU_IDROL"].ToString();
                Session["Usuario"] = USU;

                //Iniciar sesion de la persona
                Persona PER = new Persona();
                DataTable con_per = PER.ConsultarPersonaId(Consulta.Rows[0]["USU_IDPERSONA"].ToString());
                PER.IDPERSONA = con_per.Rows[0]["IDPERSONA"].ToString();
                PER.PER_NOMBRE = con_per.Rows[0]["PER_NOMBRE"].ToString();
                PER.PER_APELLIDO = con_per.Rows[0]["PER_APELLIDO"].ToString();
                PER.PER_IDESTADO = con_per.Rows[0]["PER_IDESTADO"].ToString();
                PER.PER_IDENTIFICACION = con_per.Rows[0]["PER_IDENTIFICACION"].ToString();
                PER.PER_CORREO = con_per.Rows[0]["PER_CORREO"].ToString();
                Session["Persona"] = PER;

                //Condiciòn del direccionamiento del rol.
                switch (USU.USU_IDROL)
                {
                    case "5":
                        //Administrador
                        Response.Redirect("/View/Private/index.aspx");
                        break;
                    case "6":
                        //Campesiono o proveedor
                        Response.Redirect("/View/Private/index.aspx");
                        break;
                    case "3":
                        //Cliente
                        Response.Redirect("/View/Private/index.aspx");
                        break;
                    default:
                        //Encaso que no encuentre algun rol
                        Session["Usuario"] = null;
                        Session["Persona"] = null;
                        Alerta.Visible = true;
                        Alerta.CssClass = "alert alert-danger";
                        Alert.Text = "Error de selección de rol";
                        break;
                }
            }
            else
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-danger";
                Alert.Text = "Usuario y contraseña incorrecta";
            }
        }
    }
}