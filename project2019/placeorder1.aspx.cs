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
        static Boolean orderconfirm;
        static int quantityavailable;
        static Boolean availabledesignid = false;
        SqlConnection con = new SqlConnection("Data Source=10.112.60.43;Initial Catalog=Student;User ID=student;Password=student");
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "select *from flowerreg where txtuname=@uname";
            cmd3.Parameters.AddWithValue("@uname", Session["user"].ToString());

            cmd3.Connection = con;
            con.Open();
            SqlDataReader dr3 = cmd3.ExecuteReader();
            while (dr3.Read())
            {
                TextBox1.Text = dr3["txtfname"].ToString() + " " + dr3["txtlname"].ToString();
                TextBox2.Text = dr3["txtadd"].ToString();
                TextBox3.Text = dr3["txtcity"].ToString();
                TextBox4.Text = dr3["txteid"].ToString();
                TextBox5.Text = dr3["txtcno"].ToString();
            }

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
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
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
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
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

            //SqlCommand cmd2 = new SqlCommand();
            //cmd2.Connection = con;
            //con.Open();
            //cmd2.CommandText = "select *from flowerreg where txtuname=@username and txtpwd=@password";
            //cmd2.Parameters.AddWithValue("@username", Session["user"].ToString());
            //cmd2.Parameters.AddWithValue("@password", Session["password"].ToString());
            //SqlDataReader dr1 = cmd2.ExecuteReader();
            //TextBox1.Text = dr1["txtfname"].ToString() + dr1["txtlname"].ToString();
            //TextBox2.Text = dr1["txtadd"].ToString();
            //TextBox4.Text = dr1["txteid"].ToString();
            //TextBox5.Text = dr1["txtcno"].ToString();
            //con.Close();
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

        protected void Button1_Click1(object sender, EventArgs e)
        {
            DataTable dt;
            dt = (DataTable)Session["buy"];



            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {


                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into flower_order(sno,orderid,Id,f_name,f_price,f_qty,dateoforder,fullname,address,city,email,contactno) values(@sno,@oid,@id,@fname,@price,@qty,@date,@name,@add,@city,@mail,@number)";
                cmd.Parameters.AddWithValue("@sno", dt.Rows[i]["sno"].ToString());
                cmd.Parameters.AddWithValue("@oid", Label1.Text.ToString());
                cmd.Parameters.AddWithValue("@id", dt.Rows[i]["Id"].ToString());
                cmd.Parameters.AddWithValue("@fname", dt.Rows[i]["f_name"].ToString());
                cmd.Parameters.AddWithValue("@price", dt.Rows[i]["f_price"].ToString());
                cmd.Parameters.AddWithValue("@qty", dt.Rows[i]["f_qty"].ToString());
                cmd.Parameters.AddWithValue("@date", Label2.Text.ToString());
                cmd.Parameters.AddWithValue("@name", TextBox1.Text.ToString());
                cmd.Parameters.AddWithValue("@add", TextBox2.Text.ToString());
                cmd.Parameters.AddWithValue("@city", TextBox3.Text.ToString());
                cmd.Parameters.AddWithValue("@mail", TextBox4.Text.ToString());
                cmd.Parameters.AddWithValue("@number", TextBox5.Text.ToString());
                cmd.Connection = con;
                cmd.ExecuteNonQuery();



                con.Close();

            }

            DataTable dt1;
            dt1 = (DataTable)Session["buy"];
            int designid;
            int quantity;
            foreach (DataRow row in dt1.Rows)
            {
                designid = Convert.ToInt16(row["Id"].ToString());
                quantity = Convert.ToInt16(row["f_qty"].ToString());
                checkavailability(designid, quantity);
                if (orderconfirm == false)
                {
                    break;
                }
            }
            if (orderconfirm == true)
            {
                foreach (DataRow row in dt1.Rows)
                {
                    designid = Convert.ToInt16(row["Id"].ToString());
                    quantity = Convert.ToInt16(row["f_qty"].ToString());
                    updatestock(designid, quantity);
                }

            }
            Session["buy"] = null;
            Response.Redirect("ordersuccessfull.aspx?orderid=" + Label1.Text);

        }

        private void checkavailability(int designid, int numbersold)
        {
            int pavailable = 0;
            int psold = 0;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
            String myquery = "Select * from flower_detail where Id=" + designid;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                pavailable = Convert.ToInt16(ds.Tables[0].Rows[0]["available"].ToString());

                psold = Convert.ToInt16(ds.Tables[0].Rows[0]["soldout"].ToString());

            }
            con.Close();

            if (pavailable >= numbersold)
            {
                orderconfirm = true;
            }
            else
            {
                orderconfirm = false;
                //Label3.Text = "Design ID " + designid + " Quantity " + pavailable + " only Available. Order Could Not Be Placed";
            }
        }
        private void updatestock(int designid, int numbersold)
        {
            int pavailable = 0;
            int psold = 0;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
            String myquery = "Select * from flower_detail where Id=" + designid;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                pavailable = Convert.ToInt16(ds.Tables[0].Rows[0]["available"].ToString());
                psold = Convert.ToInt16(ds.Tables[0].Rows[0]["soldout"].ToString());

            }
            con.Close();

            int newavailable;
            int newsold;
            if (pavailable >= numbersold)
            {
                newavailable = pavailable - numbersold;
                newsold = psold + numbersold;
                String updatedata = "Update flower_detail set available=" + newavailable + ", soldout=" + newsold + " where Id=" + designid;

                con.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatedata;
                cmd1.Connection = con;
                cmd1.ExecuteNonQuery();

            }
            else
            {
                //Label3.Text = "Design ID " + designid + " Quantity " + pavailable + " only Available. Order Could Not Be Placed";

            }

        }

    }
}
