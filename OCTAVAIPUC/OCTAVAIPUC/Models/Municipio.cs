using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class Municipio
    {
        private IDatos Idato = new Datos();
        public int IDMUNICIPIO { get; set; }
        public string MUN_DETALLE { get; set; }
        public int MUN_IDDEPARTAMENTO { get; set; }

        public DataTable ConsultarMunicipio(string departamento)
        {
            return Idato.ConsultarDatos("select * from municipio where MUN_IDDEPARTAMENTO="+departamento+";");
        }
    }
}