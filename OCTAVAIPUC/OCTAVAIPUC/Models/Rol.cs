using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class Rol
    {
        private IDatos CONSULTA = new Datos();
        public string IDROL { get; set; }
        public string ROL_DETALLE { get; set; }

        //Metodo de consulta de todos los roles.
        public DataTable ConsultarRol()
        {
            return CONSULTA.ConsultarDatos("CALL `PR_ROL_CONSULTAR_G`()");
        }
         
    }
}