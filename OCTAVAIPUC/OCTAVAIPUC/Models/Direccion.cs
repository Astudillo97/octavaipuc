using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class Direccion
    {
        private IDatos Idato = new Datos();
        public string IDDIRECCION { get; set; }
        public string DIR_DETALLE { get; set; }
        public string DIR_IDPERSONA { get; set; }
        public string DIR_IDMUNICIPIO { get; set; }

        //Metodo Para registrar direcciòn
        public bool RegistrarDireccion(Direccion obj,string identificacion)
        {
            return Idato.OperarDatos("CALL `PR_DIRECCION_REGISTRAR`('"+obj.DIR_DETALLE+"', '"+identificacion+"', '"+obj.DIR_IDMUNICIPIO+"');");
        }
    }
}