using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace project2019
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        static Boolean orderconfirm;
        static int quantityavailable;
        static Boolean availabledesignid = false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("loginpage.aspx");
            else
            {
                DropDownList qty = e.Item.FindControl("DropDownlist1") as DropDownList;
                int value = Convert.ToInt32(qty.SelectedItem.Value);

                if (e.CommandName == "buy")
                {
                    Response.Redirect("addtocart.aspx?id=" + e.CommandArgument.ToString() + "&f_qty=" + value);
                }
            }
        }




        protected void DataList1_ItemDataBound1(object sender, DataListItemEventArgs e)
        {
            Label qty = e.Item.FindControl("qty") as Label;
            Label msg = e.Item.FindControl("lblmsg") as Label;
            DropDownList ddl = e.Item.FindControl("DropDownList1") as DropDownList;
            Button btn = e.Item.FindControl("Button4") as Button;
            DataSet ds = new DataSet();
            DataTable tableqty = new DataTable("tblqty");
            tableqty.Columns.Add("qty");
            DataRow dataRow = tableqty.NewRow();
            int cnt = 1;
            int qt = Convert.ToInt32(qty.Text.ToString());
            while (qt != 0)
            {
                dataRow = tableqty.NewRow();
                dataRow["qty"] = cnt.ToString();
                tableqty.Rows.Add(dataRow);
                cnt = cnt + 1;
                qt = qt - 1;
            }
            ds.Tables.Add(tableqty);
            ddl.DataSource = ds.Tables[0];
            ddl.DataTextField = "qty";
            ddl.DataValueField = "qty";
            ddl.DataBind();

            if (qty.Text == "0")
            {
                msg.Text = "Out Of Stock";
                btn.Visible = false;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {


        }
    }
}