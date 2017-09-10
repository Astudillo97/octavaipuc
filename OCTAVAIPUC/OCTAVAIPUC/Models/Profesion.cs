using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System.Data;

namespace OCTAVAIPUC.Models
{
    public class Profesion
    {
        public int IDPROFESION { get; set; }
        public string PRO_DETALLE { get; set; }
        private IDatos CONSULTA = new Datos();

        public DataTable ConsultarProf()
        {
            return CONSULTA.ConsultarDatos("CALL `PR_PROFESION_CONSULTAR`()");
        }
    }
}