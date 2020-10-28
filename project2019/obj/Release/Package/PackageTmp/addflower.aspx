<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addflower.aspx.cs" Inherits="project2019.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body table tr td{
            padding-left:10px;
            padding-right:10px
        }
       
    </style>
<div class="row">
    <div class="col-12">
        <table style=" background-color:lightblue;width:500pt;margin-top:30px;margin-bottom:30px;border-radius:10px" align="center" class="table-hover">
            <tr>
                <td>
                    &nbsp;<br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
            </tr>
        <tr>
            <td>
                <label>flower NAME</label>
            </td>
            <td>
                <asp:TextBox ID="f_name" runat="server" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <label>IMAGE</label>
            </td>
            <td>
                <asp:FileUpload ID="f2" runat="server" class="form-control" />
            </td>
        </tr>
        <tr>
            <td>
              
                <label>DESCRIPTION</label>
            </td>
            <td>
                <asp:TextBox ID="description" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                
                <label>PRICE (Rs.) </label>
            </td>
            <td>
                <asp:TextBox ID="f_price" runat="server" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
               
                    <label>QUANTITY</label>
        
            </td>
            <td>
                <asp:TextBox ID="f_qty" runat="server" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">        
                <br />
                    <asp:Button ID="Button1" runat="server" Text="ADD" OnClick="add_Click" class="btn btn-success" style="width:200px" />                
                <br /><br />
            </td>
        </tr>
    </table>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:divu %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [flower_details]">
                    </asp:SqlDataSource>
    </div>
</div>
</asp:Content>
