<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="project2019.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
            padding-right:15px;
            padding-left :15px;
            padding-top:15px;
            padding-bottom:15px;
        }
        .auto-style3 {
            text-align: center;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
                        <asp:ListItem Value="1">Low to High </asp:ListItem>
                        <asp:ListItem Value="2">High to Low</asp:ListItem>
                    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="Apply" OnClick="Button1_Click" />
    <div style="text-align:center">
    <asp:DataList ID="DataList1" runat="server" align="center" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="auto-style4" OnItemCommand="DataList1_ItemCommand1" >
        <ItemTemplate>
            <div class="col-sm-3">

       
            <table class="auto-style1" border="3" style="border:2px solid;border-radius:20px">
                 
                <tr>
                    <td class="auto-style2"><a href="viewdetails.aspx?id="'<%# Eval("id")%>'">
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="viewdetails"  Height="300px" ImageUrl='<%# Eval("f2") %>' CommandArgument='<%# Eval("id")%>'  Width="300px" BorderStyle="None" BorderWidth="2px" style="border-radius:20%" />

                        <%--<asp:Image ID="Image1" runat="server"  Height="300px" ImageUrl='<%# Eval("f2") %>' CommandArgument='<%# Eval("id")%>' CommandName="pic" Width="300px" BorderStyle="None" BorderWidth="2px" style="border-radius:20%" />--%>
                   </a> </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="color:#000000; font-size: 12pt;">
                        <br />
                        Flower name:<asp:Label ID="Label1" runat="server" Text='<%# Eval("f_name") %>'></asp:Label>
                        <br />
                        <br />
                        Price(Rs.):<asp:Label ID="Label3" runat="server">  <%# Eval("f_price") %></asp:Label>
                        <br />
                        <br />
                        <%--<asp:Button ID="Button3" runat="server" BorderColor="Red" CssClass="btn" ForeColor="#009900" Height="31px" Text="View Details" CommandArgument='<%#Eval("id")%>' CommandName="viewdetails" OnClick="Button3_Click" />--%>
                        &nbsp;&nbsp;
                        <br />
                        <br />
                        </td>
                </tr>
            </table>
            <br />
            <br />
           </div>    

        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:divu %>"  SelectCommand="SELECT * FROM [flower_detail]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:divu %>" SelectCommand="SELECT * FROM [flower_detail] ORDER BY [f_price]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:divu %>" SelectCommand="SELECT * FROM [flower_detail] ORDER BY [f_price] DESC"></asp:SqlDataSource>
        
        <br />
        </div>
</asp:Content>
