using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class TipoIdentificacion
    {
        private IDatos Idato = new Datos();
        public int idtidentificacion { get; set; }
        public string tid_detalle { get; set; }

        public DataTable ConsultarTipIdentificacion()
        {
            return Idato.ConsultarDatos("select * from tidentificacion;");
        }
    }
}