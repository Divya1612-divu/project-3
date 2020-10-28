using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;



namespace project2019
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lbloid.Text = Request.QueryString["orderid"];
            findorderdate(Request.QueryString["orderid"]);
            //findaddress(Request.QueryString["orderid"]);
            showgrid(Request.QueryString["orderid"]);

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText= "select *from order_address where orderid='" + Request.QueryString["orderid"] + "'";
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblname.Text = dr["fullname"].ToString();
                lbladd.Text = dr["address"].ToString();
                lblname1.Text = dr["fullname"].ToString();
                lbladd1.Text = dr["address"].ToString();
            }
            con.Close();
        }


        private void findorderdate(String Orderid)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
            String myquery = "select * from flower_order where orderid='" + Orderid + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                odate.Text = ds.Tables[0].Rows[0]["dateoforder"].ToString();

            }

            con.Close();
        }

        private void findaddress(String Orderid)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
            String myquery = "select * from order_address where orderid='" + Orderid + "'";

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lbladd.Text =ds.Tables[0].Rows[0]["address"].ToString();
               
            }

            con.Close();
        }

        private void showgrid(String orderid)
        {
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add("sno");
            dt.Columns.Add("Id");
            dt.Columns.Add("f_name");
            dt.Columns.Add("f_qty");
            dt.Columns.Add("f_price");
            dt.Columns.Add("totalprice");
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["divu"].ToString());
            String myquery = "select * from flower_order where orderid='" + orderid + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            int totalrows = ds.Tables[0].Rows.Count;
            int i = 0;
            int grandtotal = 0;
            while (i < totalrows)
            {
                dr = dt.NewRow();
                dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
                dr["Id"] = ds.Tables[0].Rows[i]["Id"].ToString();
                dr["f_name"] = ds.Tables[0].Rows[i]["f_name"].ToString();
                dr["f_qty"] = ds.Tables[0].Rows[i]["f_qty"].ToString();
                dr["f_price"] = ds.Tables[0].Rows[i]["f_price"].ToString();
                int price = Convert.ToInt32(ds.Tables[0].Rows[i]["f_price"].ToString());
                int quantity = Convert.ToInt32(ds.Tables[0].Rows[i]["f_qty"].ToString());
                int totalprice = price * quantity;
                dr["totalprice"] = totalprice;
                grandtotal = grandtotal + totalprice;
                dt.Rows.Add(dr);
                i = i + 1;
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();

            gtot.Text = grandtotal.ToString();
        }

        protected void pdf_Click(object sender, EventArgs e)
        {
            Response.Redirect("billpdf.aspx?orderid=" + Request.QueryString["orderid"]);
            //exportpdf();
        }
        //private void exportpdf()
        //{
        //    Response.ContentType = "application/pdf";
        //    Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    StringWriter sw = new StringWriter();
        //    HtmlTextWriter hw = new HtmlTextWriter(sw);
        //    Panel1.RenderControl(hw);
        //    StringReader sr = new StringReader(sw.ToString());
        //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        //    pdfDoc.Open();
        //    htmlparser.Parse(sr);
        //    pdfDoc.Close();
        //    Response.Write(pdfDoc);
        //    Response.End();
        //}
    }
}