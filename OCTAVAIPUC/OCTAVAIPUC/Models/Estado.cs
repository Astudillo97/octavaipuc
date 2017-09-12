using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MerCam.Modelo
{
    public class Estado
    {
        IDatos Idato = new Datos();
        int IDESTADO{get;set;}
        string EST_DETALLE { get; set; }

        public Estado() {
        }
        public DataTable ConsultarEstado() {
            string sql = "SELECT IDESTADO,EST_DETALLE FROM mercam.estado;";
            return Idato.ConsultarDatos(sql);
        }
        public DataTable ConsultarEstado(string detalle)
        {
            string sql = "SELECT IDESTADO FROM mercam.estado where EST_DETALLE;";
            return Idato.ConsultarDatos(sql); 
        }
    }
}