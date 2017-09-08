using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class Usuario
    {
        private IDatos CONSULTA = new Datos();
        public string IDUSUARIO { get; set; }
        public string USU_USER { get; set; }
        public string USU_PASS { get; set; }
        public string USU_IDPERSONA { get; set; }
        public string USU_IDROL { get; set; }


        //Metodo para validar el usuario para iniciar sesión
        public bool ValidarUsuario(string user_name, string user_pass)
        {
            try
            {
                if (CONSULTA.ConsultarDatos("CALL `PR_USUARIO_VALIDAR`('" + user_name + "', '" + user_pass + "')").Rows.Count > 0)
                {
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Metodo para consultar usuario por el nombre del usuario
        public DataTable ConsultarUsuario(string user)
        {
            return CONSULTA.ConsultarDatos("CALL `PR_USUARIO_CONSULTAR_USERNAME`('" + user + "')");
        }

        //Metodo para registrar usuario
        public bool RegistrarUsuario(Usuario obj,string identificacion)
        {
            return CONSULTA.OperarDatos("CALL `PR_USUARIO_REGISTRAR`('"+obj.USU_USER+"', '"+obj.USU_PASS+"', '"+identificacion+"', '"+obj.USU_IDROL+"')");
        } 
    }
}