using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCTAVAIPUC
{
    public partial class PAGEMASTER : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Persona"] != null && Session["Usuario"]!=null)
                {
                    Models.Persona pers_session = (Models.Persona)Session["Persona"];
                    Models.Usuario usua_session = (Models.Usuario)Session["Usuario"];
                    this.nombre.InnerHtml = pers_session.PER_NOMBRE + " " + pers_session.PER_APELLIDO;
                    Cargar_Menu(Convert.ToInt32(usua_session.USU_IDROL));
                    //Modelo.Pedido ped = new Modelo.Pedido();
                    //notificaciones.InnerHtml = Modelo.Pedidos.ContarActivosPedidos("Activo").Rows[0]["contador"].ToString();
                }
                else
                {
                    Response.Redirect("../Publico/index.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("../Publico/Login.aspx");
            }

        }

        protected void Cerrar(object sender, EventArgs e)
        {
            Session["Persona"] = null;
            Session["Usuario"] = null;
            Response.Redirect("../Public/login.aspx");
        }
        
        protected void RedNotificaciones(object sender, EventArgs e)
        {
            Response.Redirect("Notificaciones.aspx");
        }
        public void Cargar_Menu(int iduser)
        {
            DataTable permiso;
            DataTable menu;
            Models.Permiso perm = new Models.Permiso();
            perm.perm_idrol = iduser;
            if (perm.ConsultarIdrol(perm)!=null)
            {
                permiso = perm.ConsultarIdrol(perm);
                foreach (DataRow item in permiso.Rows)
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl nav_item1 = new System.Web.UI.HtmlControls.HtmlGenericControl("li");
                    nav_item1.Attributes.Add("class", "nav-item");

                    System.Web.UI.HtmlControls.HtmlAnchor link1 = new System.Web.UI.HtmlControls.HtmlAnchor();
                    link1.HRef = item["men_url"].ToString();
                    link1.Attributes.Add("class", "nav-link ripple");
                    nav_item1.Controls.Add(link1);

                    System.Web.UI.HtmlControls.HtmlGenericControl iclass = new System.Web.UI.HtmlControls.HtmlGenericControl("i");
                    iclass.Attributes.Add("class", item["men_icon"].ToString());
                    link1.Controls.Add(iclass);

                    System.Web.UI.HtmlControls.HtmlGenericControl span = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
                    span.InnerText = item["men_detalle"].ToString();
                    link1.Controls.Add(span);

                    string dat = item["men_url"].ToString();
                    Models.Menu men = new Models.Menu();
                    men.men_idmenu = Convert.ToInt32( item["idmenu"].ToString());
                    if (men.ConsultarPKID(men).Rows.Count>0)
                    {
                        nav_item1.Attributes.Add("role", "tab");
                        nav_item1.ID = Convert.ToString(item["idmenu"].ToString()+"sss");
                        link1.Attributes.Add("class", "nav-link ripple with-arrow collapsed");
                        link1.Attributes.Add("data-toggle", "collapse");
                        link1.Attributes.Add("data-target", Convert.ToString("#"+item["idmenu"].ToString()+"kkk"));
                        link1.Attributes.Add("aria-expanded", "false");
                        link1.HRef = "#";
                        link1.Attributes.Add("aria-controls", Convert.ToString("" + item["idmenu"].ToString() + "kkk"));

                        System.Web.UI.HtmlControls.HtmlGenericControl collapse_show = new System.Web.UI.HtmlControls.HtmlGenericControl("ul");
                        collapse_show.Attributes.Add("class", "collapse");
                        collapse_show.ID = Convert.ToString("" + item["idmenu"].ToString() + "kkk");
                        collapse_show.Attributes.Add("role", "tabpanel");
                        collapse_show.Attributes.Add("aria-labelledby", Convert.ToString(item["idmenu"].ToString() + "sss"));
                        collapse_show.Attributes.Add("data-children", ".nav-item");
                        nav_item1.Controls.Add(link1);
                        menu = men.ConsultarPKID(men);
                        foreach (DataRow item1 in menu.Rows)
                        {

                            System.Web.UI.HtmlControls.HtmlGenericControl nav_item2 = new System.Web.UI.HtmlControls.HtmlGenericControl("li");
                            nav_item2.Attributes.Add("class", "nav-item");

                            System.Web.UI.HtmlControls.HtmlAnchor link2 = new System.Web.UI.HtmlControls.HtmlAnchor();
                            link2.HRef = item1["men_url"].ToString();
                            link2.Attributes.Add("class", "nav-link ripple");
                            nav_item2.Controls.Add(link2);

                            System.Web.UI.HtmlControls.HtmlGenericControl span1 = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
                            span1.InnerText = item1["men_detalle"].ToString();
                            link2.Controls.Add(span1);
                            nav_item2.Controls.Add(link2);
                            collapse_show.Controls.Add(nav_item2);
                        }
                        nav_item1.Controls.Add(collapse_show);
                    }
                    sidenav.Controls.Add(nav_item1);
                }
            }
        }
    }
}