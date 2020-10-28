using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace project2019
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            uname.Visible = false;
           
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buy"];
            if (dt != null)
            {

                Labelitem.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Labelitem.Text = "0";
            }

            if (Session["admin"] != null)
            {
                home.Visible = false;
                //pro.Visible = false;
                //product1.Visible = false;
                //product.Visible = false;
                contact.Visible = false;
                //reg.Visible = false;
                login.Visible = false;
                home2.Visible = true;
                home1.Visible = true;
                lnk1.Visible = true;
                Li1.Visible = true;
                Li2.Visible = true;
                //lnk2.Visible = true;
                logout.Visible = true;
                uname.Visible = true;
                lbluname.Text = "WelCome Admin";


            }
            if (Session["user"] != null)
            {

                home.Visible = true;
                login.Visible = false;
                logout.Visible = true;
                //reg.Visible = false;
                u_n.Visible = true;
                //product1.Visible = false;
                //product.Visible = false;
                cart.Visible = true;
                uname.Visible = true;
                SqlCommand cmd = new SqlCommand("select *from flowerreg where txtuname=@uname");
                cmd.Parameters.AddWithValue("@uname", Session["user"].ToString());
                cmd.Connection = con;
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if(dr.Read())
                {
                    lbluname.Text = "WelCome "+ dr["txtfname"].ToString()+" "+ dr["txtlname"].ToString();
                }



            }
            if (Session["home"] != null)
            {
               
                //product.Visible = false;
                //product1.Visible = true;
                cart.Visible = false;



            }






        }
    }
}