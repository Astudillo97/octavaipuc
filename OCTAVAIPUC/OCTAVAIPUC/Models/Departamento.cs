using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class Departamento
    {
        private IDatos Idato = new Datos();
        public int IDDEPARTAMENTO { get; set; }
        public int DEP_DETALLE { get; set; }

        public DataTable ConsultarDepartamento()
        {
            return Idato.ConsultarDatos("CALL `PR_DEPARTAMENTO_CONSULTAR_G`()");
        }
    }
}