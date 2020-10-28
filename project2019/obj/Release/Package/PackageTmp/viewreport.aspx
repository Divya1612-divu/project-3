<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewreport.aspx.cs" Inherits="project2019.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script>
         function SetTarget() {
     document.forms[0].target = "_blank";
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
            
            
            <table  align="center">
            <tr>
                <td align="center">
                    <h2 align="center"><b>Quantity Report</b></h2>
                    <asp:Button ID="Button1" runat="server" Text="Download PDF" OnClick="Button1_Click" OnClientClick = "SetTarget();" />
                </td>
            </tr>           
            </table>
            <br />
            <table border="1" style="font-size:14px"  align="center">
                <tr>
                    <td>
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="White" BorderWidth="2px" CellPadding="3" GridLines="None" Height="396px" Width="840px" BorderStyle="Ridge" CellSpacing="1">
                  <Columns>
                      <asp:BoundField DataField="Id" HeaderText="Flower Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" >
                      <HeaderStyle Font-Size="18pt" />
                      <ItemStyle Font-Size="14pt" />
                      </asp:BoundField>
                      <asp:BoundField DataField="f_name" HeaderText="Flower Name" SortExpression="f_name" >
                      <HeaderStyle Font-Size="18pt" />
                      <ItemStyle Font-Size="14pt" />
                      </asp:BoundField>
                      <asp:BoundField DataField="f_price" HeaderText="Price" SortExpression="f_price" >
                      <HeaderStyle Font-Size="18pt" />
                      <ItemStyle Font-Overline="False" Font-Size="14pt" />
                      </asp:BoundField>
                      <asp:BoundField DataField="f_qty" HeaderText="Totale Quantity" SortExpression="f_qty" >
                      <HeaderStyle Font-Size="18pt" />
                      <ItemStyle Font-Size="14pt" />
                      </asp:BoundField>
                      <asp:BoundField DataField="available" HeaderText="Available" SortExpression="available" >
                      <HeaderStyle Font-Size="18pt" />
                      <ItemStyle Font-Size="14pt" />
                      </asp:BoundField>
                      <asp:BoundField DataField="soldout" HeaderText="Sold Out" SortExpression="soldout" >
                      <HeaderStyle Font-Size="18pt" />
                      <ItemStyle Font-Size="14pt" />
                      </asp:BoundField>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:divu %>" SelectCommand="SELECT * FROM [flower_detail]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
