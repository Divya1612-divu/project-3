using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Collections.Specialized;


namespace project2019
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=10.112.60.43;Initial Catalog=Student;User ID=student;Password=student");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SUBMIT_Click(object sender, EventArgs e)
        {
            var pn = txtlname.Text;
            SqlConnection db1 = new SqlConnection();
            db1.ConnectionString = ConfigurationManager.ConnectionStrings["divu"].ToString();
            //try
            //{
            SqlCommand cmd1 = new SqlCommand("select * from flowerreg where txtuname=@username ", db1);
            cmd1.Parameters.AddWithValue("@username", txtuname.Text.Trim());
            //cmd1.Parameters.AddWithValue("mailid", mailid.Text.Trim());
            //cmd1.Parameters.AddWithValue("@F_name", Textfn.Text.Trim());
            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.Connection = db1;
            db1.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                //Response.Redirect("managehouse.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('username is already exist!!');window.location='registration.aspx';", true);

            }
            else
            {
                var pnn = txteid.Text;
                SqlConnection db11 = new SqlConnection();
                db11.ConnectionString = ConfigurationManager.ConnectionStrings["divu"].ToString();
                //try
                //{
                SqlCommand cmd3 = new SqlCommand("select * from flowerreg where txteid=@mailid", db11);
                cmd3.Parameters.AddWithValue("@mailid", txteid.Text.Trim());

                cmd3.CommandType = System.Data.CommandType.Text;
                cmd3.Connection = db11;
                db11.Open();
                SqlDataReader dr1 = cmd3.ExecuteReader();
                if (dr1.HasRows)
                {
                    //Response.Redirect("managehouse.aspx");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('email is already exist!!');window.location='registration.aspx';", true);

                }

                else
                {
                    dr.Close();


                    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
                    SqlCommand cmd = new SqlCommand("insert into flowerreg(txtfname,txtlname,txteid,txtadd,txtcity,txtcno,txtuname,txtpwd) values(@fname,@lname,@mailid,@address,@city,@contact,@username,@password)");
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@fname", txtfname.Text.Trim().ToString());
                    cmd.Parameters.AddWithValue("@lname", txtlname.Text.Trim().ToString());
                    cmd.Parameters.AddWithValue("@username", txtuname.Text.Trim().ToString());
                    cmd.Parameters.AddWithValue("@password", txtpwd.Text.Trim().ToString());
                    cmd.Parameters.AddWithValue("@address", txtadd.Text.Trim().ToString());
                    cmd.Parameters.AddWithValue("@city", txtcity.Text.Trim().ToString());
                    cmd.Parameters.AddWithValue("@contact", txtcno.Text.Trim().ToString());
                    cmd.Parameters.AddWithValue("@mailid", txteid.Text.Trim().ToString());

                    int row;
                    try
                    {
                        row = cmd.ExecuteNonQuery();
                        if (row > 0)
                        {


                            if (cmd.ExecuteNonQuery() > 0)
                            {
                                MailMessage msg = new MailMessage();
                                msg.From = new MailAddress("divyabenpatel1999@gmail.com");
                                msg.To.Add(txteid.Text);
                                msg.Subject = "WELCOME to Online flower shop";
                                msg.Body = ("Registration Successfully");
                                msg.IsBodyHtml = true;

                                SmtpClient smt = new SmtpClient();
                                smt.Host = "smtp.gmail.com";
                                System.Net.NetworkCredential ntwd = new NetworkCredential();
                                ntwd.UserName = "divyabenpatel1999@gmail.com";
                                ntwd.Password = "9081754979";
                                smt.UseDefaultCredentials = true;
                                smt.Credentials = ntwd;
                                smt.Port = 587;
                                smt.EnableSsl = true;
                                smt.Send(msg);
                                lblmsg.Text = "<b>Registration Successfully</b>";
                                lblmsg.ForeColor = System.Drawing.Color.DarkSlateBlue;
                            }
                            else
                            {
                                lblmsg.Text = "<b>Invalid of EmailId</b>";
                                lblmsg.ForeColor = System.Drawing.Color.DarkSlateBlue;
                            }
                        }

                        else
                        {
                            Response.Write("data not insert");
                        }
                    }

                    catch (Exception)
                    {
                        throw;

                    }
                    finally
                    {
                        if (con.State == ConnectionState.Open)
                            con.Close();
                    }
                    txtadd.Text = string.Empty;
                    txtcno.Text = string.Empty;
                    txteid.Text = string.Empty;
                    txtfname.Text = string.Empty;
                    txtlname.Text = string.Empty;
                    txtuname.Text = string.Empty;
                    txtpwd.Text = string.Empty;
                    txtcpwd.Text = string.Empty;

                }

            }
        }

        protected void CANCEL_click(object sender, EventArgs e)
        {
            Response.Redirect("registration.aspx");
        }


    }
}