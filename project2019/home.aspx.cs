using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project2019
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //{
            //    DataList1.DataSourceID = null;

            //    DataList1.DataSource = SqlDataSource1;
            //    DataList1.DataBind();

            //}

        }

        protected void buy_click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("loginpage.aspx");
        }



        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "viewdetails")
            {
                Response.Redirect("viewdetails.aspx?id=" + e.CommandArgument.ToString());

            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {


        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataList1.DataSourceID = null;
            if (DropDownList1.SelectedValue == "1")
            {
                DataList1.DataSource = SqlDataSource2;
                DataList1.DataBind();
            }
            else if (DropDownList1.SelectedValue == "2")
            {
                DataList1.DataSource = SqlDataSource3;
                DataList1.DataBind();

            }
        }
    }
}