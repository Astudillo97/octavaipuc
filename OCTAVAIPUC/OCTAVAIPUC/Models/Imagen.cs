using OCTAVAIPUC.App_Data.Conexion;
using OCTAVAIPUC.App_Data.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OCTAVAIPUC.Models
{
    public class Imagen
    {
        private IDatos Idato = new Datos();
        public int IDIMAGEN { get; set; }
        public string IMG_URL { get; set; }
        public string IMG_PRIVACIDAD { get; set; }
        public string PER_IDPERSONA { get; set; }

        public bool RegistrarImagen(Imagen obj)
        {
            return Idato.OperarDatos("INSERT INTO imagen VALUES (default, '"+obj.IMG_URL+"', '"+obj.IMG_PRIVACIDAD+"', '"+obj.PER_IDPERSONA+"');");
        } 
    }
}