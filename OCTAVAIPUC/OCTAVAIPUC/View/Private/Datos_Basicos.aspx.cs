using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCTAVAIPUC.Models;
using System.Data;

namespace OCTAVAIPUC.View.Private
{
    public partial class Datos_Basicos : System.Web.UI.Page
    {
        Departamento DEP = new Departamento();
        Municipio MUN = new Municipio();
        Profesion prof = new Profesion();
        Direccion Dir = new Direccion();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Listado de los departamentos
                DataTable ConDep = DEP.ConsultarDepartamento();
                for (int i = 0; i < ConDep.Rows.Count; i++)
                {
                    Departamento.Items.Add(new ListItem(ConDep.Rows[i]["DEP_DETALLE"].ToString(), ConDep.Rows[i]["IDDEPARTAMENTO"].ToString()));
                }
                DataTable ConPro = prof.ConsultarProf();
                for (int i = 0; i<ConPro.Rows.Count;  i++)
                {
                    Profesion.Items.Add(new ListItem(ConPro.Rows[i]["PRO_DETALLE"].ToString(), ConPro.Rows[i]["IDPROFESION"].ToString()));
                }
            }
        }
        protected void DropDownDepartamento_TextChanged(object sender, EventArgs e)
        {
            DataTable ConMun = MUN.ConsultarMunicipio(Departamento.Text);
            Municipio.Items.Clear();
            Municipio.Items.Add(new ListItem("Selecione", "0"));
            for (int i = 0; i < ConMun.Rows.Count; i++)
            {
                Municipio.Items.Add(new ListItem(ConMun.Rows[i]["MUN_DETALLE"].ToString(), ConMun.Rows[i]["IDMUNICIPIO"].ToString()));
            }
        }

        protected void ButtonRegistrar_Click(object sender, EventArgs e)
        {
            Persona pers = new Persona();
            pers=(Persona)Session["Persona"];
            Dir.DIR_DETALLE = TextDireccion.Text;
            Dir.DIR_IDMUNICIPIO = Municipio.SelectedItem.Value;
            Dir.DIR_IDPERSONA = pers.IDPERSONA;
            if (Dir.RegistrarDireccion(Dir))
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-success";
                Alert.Text = "Direccion Registrada Correctamente";
            }
            else
            {
                Alerta.Visible = true;

                Alert.Text = "Error al registrar la dirección";
                Alerta.CssClass = "alert alert-danger";
            }
            perpro perpr = new perpro();
            perpr.PRO_IDPROFESION = Profesion.SelectedValue;
            perpr.PER_IDPERSONA = pers.IDPERSONA;
            if (perpr.RegistrarProf(perpr))
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-success";
                Alert.Text = "Profesion Registrada Correctamente";
            }
            else
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-danger";
                Alert.Text = "Error al registrar la dirección";
            }
            Celular cel = new Celular();
            cel.CEL_NUMERO = TextCelular.Text;
            cel.CEL_IDPERSONA = pers.IDPERSONA;

            if (cel.RegistrarCelular(cel))
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-success";
                Alert.Text = "Error al registrar la dirección";
            }
            else
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-danger";
                Alert.Text = "Error al registrar la dirección";
            }
            if (CargaImagen.PostedFile !=null && CargaImagen.PostedFile.ContentLength > 0)
            {
                string fn = System.IO.Path.GetFileName(CargaImagen.PostedFile.FileName);
                string SaveLocation = Server.MapPath("../../Conten/Private/Img_User") + "\\" + fn;
                try
                {
                    CargaImagen.PostedFile.SaveAs(SaveLocation);
                    Imagen img = new Imagen();
                    img.IMG_URL = CargaImagen.FileName;
                    img.IMG_PRIVACIDAD = "Publico";
                    img.PER_IDPERSONA = pers.IDPERSONA;
                    if (img.RegistrarImagen(img))
                    {
                        Alerta.Visible = true;
                        Alerta.CssClass = "alert alert-success";
                        Alert.Text = "Imagen Guardada correctamente";
                    }
                    else
                    {
                        Alerta.Visible = true;
                        Alerta.CssClass = "alert alert-danger";
                        Alert.Text = "Error al guardar la imagen";
                    }
                }
                catch (Exception)
                {
                    Alerta.Visible = true;
                    Alerta.CssClass = "alert alert-danger";
                    Alert.Text = "Error al Guardar la Imagen en el servidor";

                }
            }
            else
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-danger";
                Alert.Text = "Selecione una imagen";
            }            
        }
    }
}