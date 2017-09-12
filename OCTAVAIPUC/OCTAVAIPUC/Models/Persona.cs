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
            return CONSULTA.OperarDatos("INSERT INTO persona VALUES (default, '"+obj.PER_IDENTIFICACION+ "',upper( '" + obj.PER_NOMBRE+ "'), upper('" + obj.PER_APELLIDO+"'), '"+obj.PER_IDTIDENTIFICACION+"', '"+obj.PER_CORREO+"', '1');");
        }

        //Metodo para consultar la persona con el id
        public DataTable ConsultarPersonaId(string id)
        {
            return CONSULTA.ConsultarDatos("select * from persona where IDPERSONA='"+id+"';");
        }

        //Metodo para consultar la persona con el numero de identificaciòn
        public DataTable ConsultarPersona(string identificacion)
        {
            return CONSULTA.ConsultarDatos("select * from persona where PER_IDENTIFICACION='"+identificacion+"';");
        }
    }
}