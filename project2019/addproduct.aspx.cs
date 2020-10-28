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
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
        string cat2 = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (f2.HasFile)
            {
                string str = f2.FileName;
                f2.PostedFile.SaveAs(Server.MapPath(".") + "//flower shop//" + str);
                string a = "~//flower shop//" + str.ToString();
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "";
                cmd.CommandText = "insert into flower_details(f_name,f2,f_price,f_qty,description) values('" + f_name.Text + "','" + a.ToString() + "'," + f_price.Text + ",'" + f_qty.Text + "','" + description.Text + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                lblmsg.Text = "Upload Sucessfully";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblmsg.Text = "plz Upload image";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}