<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="project2019.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .container5 {
            background-image : url("/flower shop/flr.jpg");
            width: 400px;
            padding: 16px;
            /*background-color: #CCCCCC;*/
            border: 1px solid;
            margin-left: 480px;
            font-family: 'Gill Sans MT';
            font-size: 20px;
        }
        


    </style>
 <div class="well well-lg"  style="margin-left:450px;margin-bottom:20px; background-color:lightblue;width:400px;padding: 16px">

        <table class="nav-justified" align="center">
            
            <tr>
                <td>Username :</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox CssClass="well well-sm" ID="txtuname" BackColor="White" Height="40px" Width="360px" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Username" ControlToValidate="txtuname" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Password:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox CssClass="well well-sm" ID="txtpwd" BackColor="White" Height="40px" Width="360px" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  runat="server" ErrorMessage="Enter password" ControlToValidate="txtpwd" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/forgotpwd.aspx">forgot password?</asp:HyperLink>
                    <br />
                     <br />               
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Button CssClass="btn" ID="Button1" runat="server" Text="LOGIN" OnClick="Button1_Click" />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/registration.aspx">sign up?</asp:HyperLink>

                </td>
            </tr>
        </table>

    </div>

    </asp:Content>
