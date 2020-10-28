<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="placeorder1.aspx.cs" Inherits="project2019.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin:100px;">
    <tr>
        <td>
            <table class="table" align="center">
                <tr>
                    <td colspan="2">
                        <table>
                            <tr>
                                <td class="auto-style3">Order Id:</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Order Date:</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" CssClass="auto-style4" Height="232px" ShowFooter="True" Width="801px" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="sno" HeaderText="S.No" />
                                <asp:BoundField DataField="Id" HeaderText="Product Id" />
                                <asp:BoundField DataField="f_name" HeaderText="Product Name" />
                                <asp:BoundField DataField="description" HeaderText="Description" />
                                <asp:BoundField DataField="f_qty" HeaderText="Quantity" />
                                <asp:ImageField DataImageUrlField="f2" HeaderText="Product Image" ControlStyle-Height="200">
                                <ControlStyle Height="200px"></ControlStyle>
                                </asp:ImageField>
                                <asp:BoundField DataField="f_price" HeaderText="Price" />
                                <asp:BoundField DataField="totalprice" HeaderText="Total Price" />
                            </Columns>
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" Height="40px" />
                            <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                        </asp:GridView>
                    </td>
                    <td>
                        <table style="margin-top:0px;" class="table-responsive;">
                            <tr>
                                <td>
                                <label> NAME </label>
                                    <asp:TextBox ID="TextBox1" runat="server" Height="36px" Width="307px"  required="required" class="form-control"></asp:TextBox>
                                    <br />
                                </td>
                            </tr>
                            <tr>                            
                                <td>
                                    <label>YOUR ADDRESS </label>
                                    <asp:TextBox ID="TextBox2" runat="server" Height="36px" TextMode="MultiLine" Width="307px"  required="required" class="form-control"></asp:TextBox>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>CITY</label>
                                    <asp:TextBox ID="TextBox3" runat="server" Height="36px" Width="307px"  required="required" class="form-control"></asp:TextBox>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>E-MAIL</label>
                                    <asp:TextBox ID="TextBox4" runat="server" Height="36px" Width="307px"  required="required" class="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="plz enter valid email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>CONTACT NO</label>
                                    <asp:TextBox ID="TextBox5" runat="server" Height="36px" Width="307px"  required="required" class="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="plz enter valid phone no." ValidationExpression="[0-9]{10}" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                                    <br />
                                </td>
                            </tr><br />
                            <tr>
                                <td colspan="2" style="text-align:center">

                                        <br />

                                        <asp:Label ID="Label3" runat="server" Text="Payment Mode : Only cash on delevery accepted" ForeColor="#FF3300"></asp:Label>
                                        <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Place Order" Height="47px" Width="181px" OnClick="Button1_Click1" style="color:white;font-weight:bold;font-size:14pt" class="btn btn-primary" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>
