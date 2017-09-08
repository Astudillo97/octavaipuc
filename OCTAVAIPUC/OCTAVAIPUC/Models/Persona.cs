using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class Persona
    {
        private IDatos CONSULTA = new Datos();
        public string IDPERSONA { get; set; }
        public string PER_IDENTIFICACION { get; set; }
        public string PER_NOMBRE { get; set; }
        public string PER_APELLIDO { get; set; }
        public string PER_IDTIDENTIFICACION { get; set; }
        public string PER_CORREO { get; set; }
        public string PER_IDESTADO { get; set; }

        //Metodo Para registrar Persona.
       public bool RegistrarPersona(Persona obj)
        {
            return CONSULTA.OperarDatos("CALL `PR_PERSONA_REGISTRAR`('"+obj.PER_IDENTIFICACION+"', '"+obj.PER_NOMBRE+"', '"+obj.PER_APELLIDO+"', '"+obj.PER_IDTIDENTIFICACION+ "', '" + obj.PER_CORREO + "');");
        }

        //Metodo para consultar la persona con el id
        public DataTable ConsultarPersonaId(string id)
        {
            return CONSULTA.ConsultarDatos("CALL `PR_PERSONA_CONSULTAR_ID`('"+id+"')");
        }

        //Metodo para consultar la persona con el numero de identificaciòn
        public DataTable ConsultarPersona(string identificacion)
        {
            return CONSULTA.ConsultarDatos("CALL `PR_PERSONA_CONSULTAR_IDENTIFICACION`('"+identificacion+"')");
        }
    }
}