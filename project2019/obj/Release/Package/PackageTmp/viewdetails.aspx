<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewdetails.aspx.cs" Inherits="project2019.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table align="center">
            <tr>
                <td>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" CssClass="auto-style5" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound1" >
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td>
        <asp:Image ID="Image2" runat="server" BorderStyle="None" BorderWidth="2px" Height="527px" ImageUrl='<%# Eval("f2") %>' Width="560px" />
        
     </td>
                    <td class="auto-style4">
                        <br />
                        &nbsp;&nbsp;<table style="margin:50px">
                            <tr>
                                <td style="text-align:left;"><b>Flower name : </b><asp:Label ID="Label1" runat="server" Text='<%# Eval("f_name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left;"><b>Price (Rs.)  : </b><asp:Label ID="Label3" runat="server" Text='<%# Eval("f_price") %>'></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left;"><b>Description :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left;">
                       
                                   <b> Available Uantity :</b> &nbsp;&nbsp;&nbsp;
                                  <asp:Label ID="qty" runat="server" Text='<%# Eval("available") %>'></asp:Label>
                                   
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left;"><br /><b>Quantity :
                                    <asp:DropDownList ID="DropDownList1" runat="server"  >                           
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <th style="text-align:left;">
                                    <asp:Button ID="Button4" runat="server" BorderColor="Red" CommandArgument='<%# Eval("id")%>' CommandName="buy" CssClass="btn" ForeColor="#009900" Height="32px" Text="Add to Cart" Width="106px" OnClick="Button4_Click"  />
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Label ID="lblmsg" runat="server" style="color:red;font-size:18pt"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:divu %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [flower_detail] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                    </td>
            </tr>
        </table>
        </div>
</asp:Content>
