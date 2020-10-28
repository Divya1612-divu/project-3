using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace project2019
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
        SqlCommand cmd = new SqlCommand();


        protected void Page_Load(object sender, EventArgs e)
        {
            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select Id from flowerreg where txtuname=@username and txtpwd=@password";
            cmd.Parameters.AddWithValue("@username", txtuname.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@password", txtpwd.Text.Trim().ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Session["user"] = txtuname.Text.Trim().ToString();
                Session["password"] = txtpwd.Text.Trim().ToString();
                Response.Redirect("home.aspx");

                con.Close();
            }
            else
            {
                if (txtuname.Text.ToString() == "admin" && txtpwd.Text.ToString() == "admin")
                {
                    Session["admin"] = txtuname.Text.Trim().ToString();

                    con.Close();

                    Response.Redirect("admin.aspx");
                }
                else
                {

                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
                    con.Close();
                }
            }
        }
    }
}
    