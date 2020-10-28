
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addtocart.aspx.cs" Inherits="project2019.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table align="center">
        <tr>
            <td>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/home.aspx">Continue Shooping</asp:HyperLink>&nbsp;
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" Height="194px" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" Width="860px" CellSpacing="1" GridLines="None">
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="sno" />
            <asp:BoundField DataField="Id" HeaderText="Flower Id" />
            <asp:ImageField DataImageUrlField="f2" HeaderText="Flower Image" ControlStyle-Height="200">
<ControlStyle Height="200px"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField DataField="f_name" HeaderText="Flower Name" />
            <asp:BoundField DataField="description" HeaderText="Descripton" />
            <asp:BoundField DataField="f_price" HeaderText="Flower Price(Rs.)" />
            <asp:BoundField DataField="f_qty" HeaderText="Flower Quantity" />
            <asp:BoundField DataField="totalprice" HeaderText="Total Price(Rs.)" />
            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" Height="40px" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <br />
                    <asp:Button CssClass="btn" ID="Button1" runat="server" Text="BUY" OnClick="Button1_Click" Height="38px" Width="103px" />
    <br />
    <br />
                </td>
        </tr>
    </table>
</asp:Content>
