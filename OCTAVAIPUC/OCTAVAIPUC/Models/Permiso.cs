using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class Permiso
    {
        App_Data.Interface.IDatos Idato = new App_Data.Conexion.Datos();
        public int idpermiso { get; set; }
        public int perm_idrol { get; set; }
        public int perm_idmenu { get; set; }

        public DataTable ConsultarIdrol(Permiso per)
        {
            string sql = "select * from rol r inner join permiso p on r.IDROL=p.PERM_IDROL inner join menu m on p.PERM_IDMENU=m.IDMENU where p.PERM_IDROL="+per.perm_idrol+";";
            return Idato.ConsultarDatos(sql); 
        }
    }
}