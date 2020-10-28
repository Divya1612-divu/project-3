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
    public partial class WebForm14 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=10.112.60.43;Initial Catalog=Student;User ID=student;Password=student");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt_6 = new DataTable();
                DataRow dr;
                dt_6.Columns.Add("sno");
                dt_6.Columns.Add("Id");
                dt_6.Columns.Add("f_name");
                dt_6.Columns.Add("f2");
                dt_6.Columns.Add("f_price");
                dt_6.Columns.Add("f_qty");
                dt_6.Columns.Add("description");
                dt_6.Columns.Add("totalprice");

                if (Request.QueryString["Id"] != null)
                {
                    if (Session["buy"] == null)
                    {

                        dr = dt_6.NewRow();
                        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());

                        String myquery = "select * from flower_detail where Id=" + Request.QueryString["Id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = con;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["Id"] = ds.Tables[0].Rows[0]["Id"].ToString();
                        dr["f2"] = ds.Tables[0].Rows[0]["f2"].ToString();

                        dr["f_name"] = ds.Tables[0].Rows[0]["f_name"].ToString();
                        dr["description"] = ds.Tables[0].Rows[0]["description"].ToString();
                        dr["f_price"] = ds.Tables[0].Rows[0]["f_price"].ToString();
                        dr["f_qty"] = Request.QueryString["f_qty"];
                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["f_price"].ToString());

                        int quantity = Convert.ToInt32(Request.QueryString["f_qty"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;

                        dt_6.Rows.Add(dr);
                        GridView1.DataSource = dt_6;
                        GridView1.DataBind();

                        Session["buy"] = dt_6;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("addtocart.aspx");

                    }

                    else
                    {

                        dt_6 = (DataTable)Session["buy"];
                        int sr;
                        sr = dt_6.Rows.Count;

                        dr = dt_6.NewRow();
                        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
                        String myquery = "select * from flower_detail where Id=" + Request.QueryString["Id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = con;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["Id"] = ds.Tables[0].Rows[0]["Id"].ToString();
                        dr["f_name"] = ds.Tables[0].Rows[0]["f_name"].ToString();
                        dr["f2"] = ds.Tables[0].Rows[0]["f2"].ToString();
                        dr["description"] = ds.Tables[0].Rows[0]["description"].ToString();
                        dr["f_qty"] = Request.QueryString["f_qty"];
                        dr["f_price"] = ds.Tables[0].Rows[0]["f_price"].ToString();
                        int price = Convert.ToInt16(ds.Tables[0].Rows[0]["f_price"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["f_qty"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;
                        dt_6.Rows.Add(dr);
                        GridView1.DataSource = dt_6;
                        GridView1.DataBind();

                        Session["buy"] = dt_6;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("addtocart.aspx");

                    }
                }
                else
                {
                    dt_6 = (DataTable)Session["buy"];
                    GridView1.DataSource = dt_6;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

                    }

                    //Label2.Text = GridView1.Rows.Count.ToString();
                }


            }
            Label2.Text = DateTime.Now.ToShortDateString();
            findorderid();
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buy"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }
        public void findorderid()
        {
            String pass = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] mypass = new char[5];
            for (int i = 0; i < 5; i++)
            {
                mypass[i] = pass[(int)(35 * r.NextDouble())];

            }
            String orderid;
            orderid = "Order" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);

            Label1.Text = orderid;


        }
        public void saveaddress()
        {
            String updatepass = "insert into order_address(orderid,fullname,address,city,email,contactno) values('" + Label1.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "'," + TextBox5.Text + ")";
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatepass;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    DataTable dt;
        //    dt = (DataTable)Session["addtocart"];



        //    for (int i = 0; i <= dt.Rows.Count - 1; i++)
        //    {

        //        String updatepass = "insert into amulorderdetails(orderid,sno,productid,productname,price,quantity,dateoforder) values('" + Label1.Text + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["productid"] + ",'" + dt.Rows[i]["productname"] + "'," + dt.Rows[i]["price"] + "," + dt.Rows[i]["quantity"] + ",'" + Label2.Text + "')";
        //        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Mycon"].ToString());
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.CommandText = updatepass;
        //        cmd.Connection = con;
        //        cmd.ExecuteNonQuery();
        //        con.Close();

        //    }
        //    saveaddress();
        //    Response.Redirect("ordersuccessfull.aspx");
        //}

        protected void Button1_Click1(object sender, EventArgs e)
        {
            DataTable dt;
            dt = (DataTable)Session["buy"];



            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {

                String updatepass = "insert into flower_order(orderid,sno,Id,f_name,f_price,f_qty,dateoforder) values('" + Label1.Text + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["Id"] + ",'" + dt.Rows[i]["f_name"] + "'," + dt.Rows[i]["f_price"] + "," + dt.Rows[i]["f_qty"] + ",'" + Label2.Text + "')";
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = updatepass;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                con.Close();

            }
            saveaddress();
            Response.Redirect("ordersuccessfull.aspx");
        }
    }
}