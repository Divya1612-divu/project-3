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
    public partial class WebForm12 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
        string cat2 = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_Click(object sender, EventArgs e)
        {


            var pn = f_name.Text;
            SqlConnection db1 = new SqlConnection();
            db1.ConnectionString = ConfigurationManager.ConnectionStrings["divu"].ToString();
            SqlCommand cmd1 = new SqlCommand("select * from flower_detail where f_name=@fname", db1);
            cmd1.Parameters.AddWithValue("@fname", f_name.Text.Trim());
            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.Connection = db1;
            db1.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('product name is already exist!!');window.location='addproduct.aspx';", true);
                Label1.Text = "<b>flower is already exist</b>";
                Label1.ForeColor = System.Drawing.Color.DarkSlateBlue;

            }
            else
            {

                SqlConnection con = new SqlConnection("Data Source=10.112.60.43;Initial Catalog=student;User ID=student;Password=student");
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into flower_detail (f_name,f2,f_price,f_qty,description,available,soldout) values(@fname,@f2,@fprice,@fqty,@fdes,@fqty,0)";
                cmd.Parameters.AddWithValue("@fname", f_name.Text.ToString());
                cmd.Parameters.AddWithValue("@fprice", f_price.Text.ToString());
                cmd.Parameters.AddWithValue("@fqty", f_qty.Text.ToString());
                cmd.Parameters.AddWithValue("@fdes", description.Text.ToString());


                if (f2.HasFile)
                {
                    f2.SaveAs(Server.MapPath("~/flower/" + f2.FileName));
                    cmd.Parameters.AddWithValue("@f2", "~/flower/" + f2.FileName);
                }
                else
                {
                    Label1.Text = "please upload your image";
                }
                cmd.Connection = con;
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Label1.Text = "<b>Upload Successfully</b>";
                    Label1.ForeColor = System.Drawing.Color.DarkSlateBlue;


                }

                con.Close();
            }
            }
    }
}



            //else
            //{
            //    if (f2.HasFile)
            //    {
            //        string str = f2.FileName;
            //        //f2.SaveAs(Server.MapPath("~/flower/" + f2.FileName));
            //          //  cmd2.Parameters.AddWithValue("@f2", "~/flower/" + f2.FileName);

            //        f2.PostedFile.SaveAs(Server.MapPath(".") + "//flower//" + str);
            //        string a = "~//flower//" + str.ToString();

            //        //cat = DropDownList1.SelectedValue.Trim().ToString();

            //        con.Open();
            //        SqlCommand cmd2 = con.CreateCommand();
            //        cmd2.CommandType = CommandType.Text;
            //        cmd2.CommandText = "";
            //        //object quantity = null;
            //        cmd2.CommandText = "insert into flower_detail values('" + f_name.Text + "','" + a.ToString() + "','" + f_price.Text + "','" + description.Text + "','" + f_qty.Text + "','" + f_qty.Text + "',0)";
            //        cmd2.ExecuteNonQuery();
            //        con.Close();
            //        Response.Write("upload successfully");
            //    }

            //    else
            //    {
            //        Response.Write("plz upload your image");
            //    }
            //    int row;
            //    try
            //    {

            //        row = cmd2.ExecuteNonQuery();
            //        if (row > 0)
            //        {

            //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('upload successfully');window.location='addproduct.aspx';", true);

            //        }
            //        else
            //        {
            //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('plz upload your image');window.location='addproduct.aspx';", true);

            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        throw;
            //    }
            //    finally
            //    {
            //        if (con.State == ConnectionState.Open)
            //            con.Close();
            //    }
            //    f_name.Text = string.Empty;
            //}
      


//            SqlConnection con = new SqlConnection("Data Source=10.112.60.43;Initial Catalog=student;User ID=student;Password=student");
//            SqlCommand cmd = new SqlCommand();
//            cmd.CommandText = "insert into flower_detail (f_name,f2,f_price,f_qty,description,available,soldout) values(@fname,@f2,@fprice,@fqty,@fdes,@fqty,0)";
//            cmd.Parameters.AddWithValue("@fname", f_name.Text.ToString());
//            cmd.Parameters.AddWithValue("@fprice", f_price.Text.ToString());
//            cmd.Parameters.AddWithValue("@fqty", f_qty.Text.ToString());
//            cmd.Parameters.AddWithValue("@fdes", description.Text.ToString());


//            if (f2.HasFile)
//            {
//                f2.SaveAs(Server.MapPath("~/flower/" + f2.FileName));
//                cmd.Parameters.AddWithValue("@f2", "~/flower/" + f2.FileName);
//            }
//            else
//            {
//                Label1.Text = "please upload your image";
//            }
//            cmd.Connection = con;
//            con.Open();
//            if (cmd.ExecuteNonQuery() > 0)
//            {
//                Label1.Text = "<b>Upload Successfully</b>";
//                Label1.ForeColor = System.Drawing.Color.DarkSlateBlue;


//            }

//            con.Close();


//        }
//    }
//}