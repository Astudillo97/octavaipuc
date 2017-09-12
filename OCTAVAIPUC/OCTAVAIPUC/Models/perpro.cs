using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System.Data;

namespace OCTAVAIPUC.Models
{
    public class perpro
    {
        private IDatos CONSULTA = new Datos();
        public string IDPERPRO { get; set; }
        public string PER_IDPERSONA { get; set; }
        public string PRO_IDPROFESION { get; set; }

        public bool RegistrarProf(perpro prof)
        {
            return CONSULTA.OperarDatos("insert into perpro values (default, '" + prof.PER_IDPERSONA + "','" + prof.PRO_IDPROFESION + "');");
        }
    }
}