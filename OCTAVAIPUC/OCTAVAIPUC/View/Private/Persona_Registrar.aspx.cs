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
        //Departamento DEP = new Departamento();
        //Municipio MUN = new Municipio();
        Rol ROL = new Rol();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Listado de los tipos de identificacion
                DropTipoIdentificacion.DataSource = TI.ConsultarTipIdentificacion();
                DropTipoIdentificacion.DataValueField = "IDTIDENTIFICACION";
                DropTipoIdentificacion.DataTextField = "TID_DETALLE";
                DropTipoIdentificacion.DataBind();

                //Listado de los tipos de identificacion
                DropDownRol.DataSource = ROL.ConsultarRol();
                DropDownRol.DataValueField = "IDROL";
                DropDownRol.DataTextField = "ROL_DETALLE";
                DropDownRol.DataBind();

                //Listado de los departamentos
                //DataTable ConDep = DEP.ConsultarDepartamento();
                //for (int i = 0; i < ConDep.Rows.Count; i++)
                //{
                //    DropDownDepartamento.Items.Add(new ListItem(ConDep.Rows[i]["DEP_DETALLE"].ToString(), ConDep.Rows[i]["IDDEPARTAMENTO"].ToString()));
                //}
            }
        }

        //Metodo de busqueda del municipio de donde vive.
        //protected void DropDownDepartamento_TextChanged(object sender, EventArgs e)
        //{
        //    DataTable ConMun = MUN.ConsultarMunicipio(DropDownDepartamento.Text);
        //    DropDownMunicipio.Items.Clear();
        //    for (int i = 0; i < ConMun.Rows.Count; i++)
        //    {
        //        DropDownMunicipio.Items.Add(new ListItem(ConMun.Rows[i]["MUN_DETALLE"].ToString(), ConMun.Rows[i]["IDMUNICIPIO"].ToString()));
        //    }
        //}

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

                if (PER.RegistrarPersona(PER))
                {
                    Usuario USU = new Usuario();
                    USU.USU_USER = TextUser.Text;
                    USU.USU_PASS = TextPass.Text;
                    USU.USU_IDROL = DropDownRol.Text;

                    if (USU.RegistrarUsuario(USU, PER.PER_IDENTIFICACION))
                    {
                        Alerta.Visible = true;
                        Alerta.CssClass = "alert alert-success";
                        Alert.Text = "Registrado Exitosamente";

                        //Direccion DER = new Direccion();
                        //DER.DIR_DETALLE = TextDireccion.Text;
                        //DER.DIR_IDMUNICIPIO = DropDownMunicipio.Text;

                        //if (DER.RegistrarDireccion(DER, PER.PER_IDENTIFICACION))
                        //{

                        //Celular CEL = new Celular();
                        //CEL.CEL_NUMERO = TextCelular.Text;
                        //if (CEL.RegistrarPersona(CEL, PER.PER_IDENTIFICACION))
                        //{
                        //    Response.Redirect("Index.aspx");
                        //}
                        //else
                        //{
                        //    Alerta.Visible = true;
                        //    Alerta.CssClass = "alert alert-danger";
                        //    Alert.Text = "El celular ingresado no cumple con los estandares requeridos,";
                        //}
                        //}
                        //else
                        //{
                        //    Alerta.Visible = true;
                        //    Alerta.CssClass = "alert alert-danger";
                        //    Alert.Text = "La dirección ingresada no cumple con los estandares requeridos";
                        //}
                    }
                    else
                    {
                        Alerta.Visible = true;
                        Alerta.CssClass = "alert alert-danger";
                        Alert.Text = "No se puedo Registrar el usuario por un dato fuera de lo requerido";
                    }
                }
                else
                {
                    Alerta.Visible = true;
                    Alerta.CssClass = "alert alert-danger";
                    Alert.Text = "No se puedo Registrar la persona por un dato fuera de lo requerido";
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