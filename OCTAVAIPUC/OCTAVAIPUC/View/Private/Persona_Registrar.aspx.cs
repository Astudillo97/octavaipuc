using OCTAVAIPUC.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCTAVAIPUC.View.Private
{
    public partial class Persona_Registrar : System.Web.UI.Page
    {
        TipoIdentificacion TI = new TipoIdentificacion();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Listado de los tipos de identificacion
                DropTipoIdentificacion.DataSource = TI.ConsultarTipIdentificacion();
                DropTipoIdentificacion.DataValueField = "IDTIDENTIFICACION";
                DropTipoIdentificacion.DataTextField = "TID_DETALLE";
                DropTipoIdentificacion.DataBind();
            }
        }

        protected void ButtonRegistrar_Click(object sender, EventArgs e)
        {
            if (DropTipoIdentificacion.Text != "0")
            {
                Persona PER = new Persona();
                PER.PER_IDENTIFICACION = TextIdentificacion.Text;
                PER.PER_NOMBRE = TextNombre.Text;
                PER.PER_APELLIDO = TextApellido.Text;
                PER.PER_CORREO = TextCorreo.Text;
                PER.PER_IDTIDENTIFICACION = DropTipoIdentificacion.Text;

                if (PER.ConsultarPersonaId(TextIdentificacion.Text).Rows.Count>0)
                {
                    Alerta.Visible = true;
                    Alerta.CssClass = "alert alert-danger";
                    Alert.Text = "La persona que intenta registrar ya se encuentra registrada";
                }
                else
                {
                    if (PER.RegistrarPersona(PER))
                    {
                        Alerta.Visible = true;
                        Alerta.CssClass = "alert alert-success";
                        Alert.Text = "Registrado Correctamente";
                    }
                    else
                    {
                        Alerta.Visible = true;
                        Alerta.CssClass = "alert alert-danger";
                        Alert.Text = "Datos incorrectos, verifique e intente nuevamente";
                    }
                }
            }
            else
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-danger";
                Alert.Text = "No ha selecionado un tipo de documento";
            }

        }
    }
}