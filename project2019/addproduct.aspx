<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="project2019.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 610px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div >
    <table style="border:2px solid black; width: 360px; height: 360px; background-color:lightblue;margin-left:500px">
        <tr>
            <td>
                <b>flower NAME:</b>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="f_name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>IMAGE</b>
            </td>
            <td class="auto-style3">
                <asp:FileUpload ID="f2" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <b>DESCRIPTION</b>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="description" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>PRICE:</b>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="f_price" runat="server"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td>
                <b>QUANTITY:<br />
        </b>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="f_qty" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-size:18px">
                <b>
                    <asp:Button ID="Button1" runat="server" Text="ADD" OnClick="Button1_Click" /></b>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
        <table>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:divu %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [flower_details]">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</div>
    <div>
    </div>

</asp:Content>
