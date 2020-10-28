<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ordersuccessfull.aspx.cs" Inherits="project2019.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body table td{
           padding-left:2px;
           padding-bottom:0px;
        }
      
       
        </style>
<script type = "text/javascript">
    function SetTarget() {
     document.forms[0].target = "_blank";
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="col-12">
    <table align="center">
        <tr>
            <td>
        <table style="width:100%;border-style: groove;border-color:blueviolet">
            <tr>
                <td colspan="2">
                    <h3 style="text-align:center;border-bottom:1px solid;font-weight:bold;color:darkblue;font-family:'Times New Roman', Times, serif"><img src="flower/1529216473DSC_2344-600x600.jpg" style="width:50px;height:50px;float:left" />Online Flower Shop<img src="flower/1529216473DSC_2344-600x600.jpg" style="width:50px;height:50px;float:right" /></h3>
                </td>
            </tr>
            <tr>
                <td style="padding-left:10px;padding-right:10px">
                    <p style="color:red">
                        Online Flower shop<br />
                        Anand Agrricultural University,<br />
                        Anand - 388 110.
                    </p>
                </td>
                <td>
                    <h4 style="background-color:blueviolet;color:white;font-weight:bold;text-align:center">Order Date</h4>
                    <asp:Label ID="odate" runat="server"></asp:Label>
                    <h4 style="background-color:blueviolet;color:white;font-weight:bold;text-align:center">Order No</h4>
                    <asp:Label ID="lbloid" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding:0px 5px 0px 0px">
                    <h4 style="background-color:blueviolet;color:white;font-weight:bold;text-align:center">Bill To</h4>
                    <asp:Label ID="lblname" runat="server" style="margin:5px"></asp:Label><br />
                    <asp:Label ID="lbladd" runat="server" style="margin:5px"></asp:Label>
                </td>
                <td> 
                    <h4 style="background-color:blueviolet;color:white;font-weight:bold;text-align:center">Ship To</h4>
                    <asp:Label ID="lblname1" runat="server"></asp:Label><br />
                    <asp:Label ID="lbladd1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="sno" HeaderText="Sr. No" >
                            <HeaderStyle BackColor="#9933FF" Font-Size="12pt" ForeColor="White" HorizontalAlign="Center" />
                            <ItemStyle Font-Size="10pt" />
                            </asp:BoundField>
                            <asp:BoundField DataField="f_name" HeaderText="Flower Name" >
                            <HeaderStyle BackColor="#9933FF" Font-Size="12pt" ForeColor="White" HorizontalAlign="Center" />
                            <ItemStyle Font-Size="10pt" />
                            </asp:BoundField>
                            <asp:BoundField DataField="f_qty" HeaderText="Quantity" >
                            <HeaderStyle BackColor="#9933FF" Font-Size="12pt" ForeColor="White" HorizontalAlign="Center" />
                            <ItemStyle Font-Size="10pt" />
                            </asp:BoundField>
                            <asp:BoundField DataField="f_price" HeaderText="Price" >
                            <HeaderStyle BackColor="#9933FF" ForeColor="White" Font-Size="12pt" />
                            <ItemStyle Font-Size="10pt" />
                            </asp:BoundField>
                            <asp:BoundField DataField="totalprice" HeaderText="Total Price" >
                            <HeaderStyle BackColor="#9933FF" Font-Size="12pt" ForeColor="White" HorizontalAlign="Center" />
                            <ItemStyle Font-Size="10pt" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                
                <td colspan="2" style="text-align:center;font-size:15pt;color:red">
                    <h4 style="background-color:blueviolet;color:white;font-weight:bold;text-align:center">Total Payment</h4>
                     Rs. <asp:Label ID="gtot" runat="server"></asp:Label> 

                </td>
            </tr>
            <tr>
                <td style="text-align:right" colspan="2">
                    Thank you for shopping...
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="pdf" runat="server" Text="Downloas as PDF" OnClick="pdf_Click" class="btn btn-block" OnClientClick = "SetTarget();"/>
        <br />
        <br />
    </td>
        </tr>
    </table>
    </div>
</div>
</asp:Content>
