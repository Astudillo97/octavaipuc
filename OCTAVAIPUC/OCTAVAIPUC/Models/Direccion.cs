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
        public bool RegistrarDireccion(Direccion obj)
        {
            return Idato.OperarDatos("INSERT INTO direccion VALUES(default, '"+DIR_DETALLE+"', "+DIR_IDPERSONA+", "+DIR_IDMUNICIPIO+"); ");
        }
    }
}