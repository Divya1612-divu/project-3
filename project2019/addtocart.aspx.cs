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
    public partial class WebForm13 : System.Web.UI.Page
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
                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
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
                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();

                    }

                    //Label2.Text = GridView1.Rows.Count.ToString();

                }
                dt_6 = (DataTable)Session["buy"];
                if (dt_6 != null)
                {
                    Button1.Visible = true;

                }
                else
                {
                    Button1.Visible = false;
                }

            }
        }

        private object grandtotal()
        {
            DataTable dt_6 = new DataTable();
            dt_6 = (DataTable)Session["buy"];
            int nrow = dt_6.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt_6.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buy"];


            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    //Label1.Text = "Item Has Been Deleted From Shopping Cart";
                    break;

                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }

            Session["buy"] = dt;
            Response.Redirect("addtocart.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("placeorder1.aspx");
        }
    }
}


