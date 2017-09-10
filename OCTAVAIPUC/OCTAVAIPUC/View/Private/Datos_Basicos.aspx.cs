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
    }
}