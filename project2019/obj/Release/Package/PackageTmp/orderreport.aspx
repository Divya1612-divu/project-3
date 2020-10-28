<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="orderreport.aspx.cs" Inherits="project2019.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
         function SetTarget() {
     document.forms[0].target = "_blank";
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div align="center">
            
            <h2 align="center"><b>Order Report</b></h2>
            <p>&nbsp;</p>
            
            <table border="0" style="width:70%">
                <tr>
                <td align="left">
                    <asp:Button ID="Button1" runat="server" Text="Download PDF" OnClick="Button1_Click" style="width:500px" OnClientClick = "SetTarget();"/><br /><br />
                </td>
            </tr>
                <tr>
                    <td>
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="White" BorderWidth="2px" CellPadding="3" GridLines="None" Width="100%" BorderStyle="Ridge" CellSpacing="1">
                  <Columns>
                      <asp:BoundField DataField="sno" HeaderText="Sr.No" SortExpression="sno" >
                      </asp:BoundField>
                      <asp:BoundField DataField="orderid" HeaderText="Order Id" SortExpression="orderid" >
                      </asp:BoundField>
                      <asp:BoundField DataField="Id" HeaderText="Flower Id" SortExpression="Id" >
                      </asp:BoundField>
                      <asp:BoundField DataField="f_name" HeaderText="Flower Name" SortExpression="f_name" >
                      </asp:BoundField>
                      <asp:BoundField DataField="f_price" HeaderText="Price" SortExpression="f_price" >
                      </asp:BoundField>
                      <asp:BoundField DataField="f_qty" HeaderText="Quantity" SortExpression="f_qty" >
                      </asp:BoundField>
                      <asp:BoundField DataField="dateoforder" HeaderText="Date Of Order" SortExpression="dateoforder" />
                      <asp:BoundField DataField="fullname" HeaderText="Customer Name" SortExpression="fullname" />
                      <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                      <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                      <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                      <asp:BoundField DataField="contactno" HeaderText="Contact no" SortExpression="contactno" />
                  </Columns>
                  <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                  <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                  <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                  <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                  <SelectedRowStyle BackColor="#9471DE" ForeColor="White" Font-Bold="True" />
                  <SortedAscendingCellStyle BackColor="#F1F1F1" />
                  <SortedAscendingHeaderStyle BackColor="#594B9C" />
                  <SortedDescendingCellStyle BackColor="#CAC9C9" />
                  <SortedDescendingHeaderStyle BackColor="#33276A" />
              </asp:GridView>
              </td>
            </tr>
            
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:divu %>" SelectCommand="SELECT * FROM [flower_order]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
