using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class Celular
    {
        private IDatos Idato = new Datos();
        public string IDCELULAR { get; set; }
        public string CEL_IDPERSONA { get; set; }
        public string CEL_NUMERO { get; set; }

        public bool RegistrarPersona(Celular obj,string identificacion)
        {
            return Idato.OperarDatos("CALL `PR_CELULAR_REGISTRAR`('"+identificacion+"', '"+obj.CEL_NUMERO+"');");
        }

    }
}