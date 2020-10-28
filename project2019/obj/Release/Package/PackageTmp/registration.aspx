<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="project2019.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <style>
   /*body {
        background-color:aquamarine;    
       }*/
          
    .box{
      /*position: absolute;*/
    /*/*top:45%;*/*/
    left:50%;
    /*transform:translate(-50%,-50%);*/

    width:400px;
    height:750px;
    padding: 0px 20px;
    box-sizing:border-box;
    border:1px solid;
    border-color:black;
    font-family:'Gill Sans MT';
    /*background:rgba(0,0,0,0.5)*/
}

/*.h2{
    margin: 0;
    padding: 0 0 0px;
    color :#efed40;
    text-align: center;

}*/
.box p{
    margin: 0;
    padding: 0;
    font-weight: bold;
    color: #000000;
    font-size:18px;
    

}
.box input
{
    margin-bottom:3px;
    color:#ff0000;
}
 
.box input[type="text"],
.box input[type="password"]
{
  margin-top:3px;
  border-bottom: 1px solid #fff;
  background: transparent;
  outline:none;
  color: #000000;
  font-size: 18px;
                border-left-style: none;
                border-left-color: inherit;
                border-left-width: medium;
                border-right-style: none;
                border-right-color: inherit;
                border-right-width: medium;
                border-top-style: none;
                border-top-color: inherit;
                border-top-width: medium;
            }
.placeholder
{
    color: rgba(250,250,250,0.5);
}
.box input[type="submit"],
.box input[type="submit"]
{
            border-style: none;
                border-color:black;
                border-width: medium;
                outline: none;
                color:#663300;
                font-size: 16px;
                background:gray;
                cursor: pointer;
                border-radius:15px;
                width:45%;
                left:10px;

}
.box input[type="submit"]:hover,
.box input[type="subcnc"]:hover
 {
     background:#CCFFCC;
     color:darkgray;

 }
.box a{
    color:#000000;
    font-size:14px;
    font-weight:bold;
    text-decoration-color:none;
}
</style>

       <div class="well well-lg"   style="margin-left:450px;margin-bottom:20px; background-color:lightblue;width:500px;padding: 16px; ">                 
             
                         
                    <p>FirstName:</p>
                    <asp:TextBox ID="txtfname" CssClass="well well-sm" Height="40px" Width="465px"  runat="server" BorderWidth="0px" BorderStyle="Groove" BackColor="White"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfname" ErrorMessage="please enter name" ForeColor="Red"></asp:RequiredFieldValidator>
               
                    <p>LastName:</p>
                    <asp:TextBox ID="txtlname" CssClass="well well-sm" Height="40px" Width="465px" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlname" ErrorMessage="please enter lastname" ForeColor="Red"></asp:RequiredFieldValidator>
                
             <p>E-mail:</p>
                      <asp:TextBox ID="txteid" Height="40px" Width="465px" CssClass="well well-sm" runat="server" BorderStyle="Groove" BackColor="white" BorderWidth="0px"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required" ControlToValidate="txteid" ForeColor="Red"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="enter a valid Email id" ControlToValidate="txteid" BorderStyle="NotSet" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             
             <p> Address:</p>
                      <asp:TextBox ID="txtadd" Width="465px" CssClass="well well-sm" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" TextMode="MultiLine"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="txtadd" ForeColor="Red"></asp:RequiredFieldValidator>
                       
           <p> City :</p>
                      <asp:TextBox ID="txtcity" Width="465px" CssClass="well well-sm" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="txtcity" ForeColor="Red"></asp:RequiredFieldValidator>
                       
            <p>Contact no:</p>
                      <asp:TextBox ID="txtcno" CssClass="well well-sm" Height="40px" Width="465px" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" MaxLength="10"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required" ControlToValidate="txtcno" ForeColor="Red"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Not valid" ControlToValidate="txtcno" ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                    
            
                     <p>Username:</p>
                    <asp:TextBox ID="txtuname" Height="40px" CssClass="well well-sm" Width="465px" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" TextMode="SingleLine"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ControlToValidate="txtuname" ForeColor="Red"></asp:RequiredFieldValidator>
                      
                                 
                     <p>Password:</p>
                    <asp:TextBox ID="txtpwd" Height="40px" CssClass="well well-sm" Width="465px"  runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" TextMode="Password" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="enter your password" ControlToValidate="txtpwd" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number" ForeColor="Red" ControlToValidate="txtpwd" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
                
                     <p>Conform Password:</p>             
                    <asp:TextBox ID="txtcpwd" Height="40px" Width="465px" CssClass="well well-sm" runat="server" BorderWidth="0px" BackColor="White" BorderStyle="Groove" TextMode="Password">*</asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtcpwd"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="comparevalidator2" runat="server" ControlToCompare="txtpwd" ControlToValidate="txtcpwd" ErrorMessage="Password does not match" Font-Bold="True" SetFocusOnError="True" ForeColor="Red"></asp:CompareValidator>
            
                    <br />
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
            
                    <table style="width: 465px; height: 45px">
                        <tr>
                            <td><asp:Button CssClass="btn" ID="Button1" runat="server" Text="SUBMIT" OnClick="SUBMIT_Click"   />&nbsp;&nbsp;</td>
                            <td> <asp:Button CssClass="btn" ID="Button2" runat="server" Text="CANCEL" OnClick="CANCEL_click"  /></td>

                        </tr>
                          
                          
                         

                    </table>
                      
           </div>
        </div>
</asp:Content>
