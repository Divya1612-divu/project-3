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
    <div style="text-align:center">
    <asp:DataList ID="DataList1" runat="server" align="center" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="auto-style4" OnItemCommand="DataList1_ItemCommand1" >
        <ItemTemplate>
            <div class="col-sm-3">
               
            <table class="auto-style1" border="3" style="border:2px solid;border-radius:20px">
                 
                <tr>
                    <td class="auto-style2"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/viewdetails.aspx">
                        <asp:Image ID="Image1" runat="server" Height="300px" ImageUrl='<%# Eval("f2") %>' CommandArgument='<%# Eval("id")%>' CommandName="pic" Width="300px" BorderStyle="None" BorderWidth="2px" /></a>
                    </td>
                </tr></asp:HyperLink>
                <tr>
                    <td class="auto-style3" style="color:#000000; font-size: 12pt;">Flower name:<asp:Label ID="Label1" runat="server" Text='<%# Eval("f_name") %>'></asp:Label>
                        <br />
                        Price(Rs.):<asp:Label ID="Label3" runat="server">  <%# Eval("f_price") %></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="Button3" runat="server" BorderColor="Red" CssClass="btn" ForeColor="#009900" Height="31px" Text="View Details" CommandArgument='<%#Eval("id")%>' CommandName="viewdetails" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:divu %>" DeleteCommand="DELETE FROM [flower_detail] WHERE [Id] = @original_Id AND [f_name] = @original_f_name AND [f2] = @original_f2 AND [description] = @original_description AND [f_price] = @original_f_price AND [f_qty] = @original_f_qty" InsertCommand="INSERT INTO [flower_detail] ([f_name], [f2], [description], [f_price], [f_qty]) VALUES (@f_name, @f2, @description, @f_price, @f_qty)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [flower_detail]" UpdateCommand="UPDATE [flower_detail] SET [f_name] = @f_name, [f2] = @f2, [description] = @description, [f_price] = @f_price, [f_qty] = @f_qty WHERE [Id] = @original_Id AND [f_name] = @original_f_name AND [f2] = @original_f2 AND [description] = @original_description AND [f_price] = @original_f_price AND [f_qty] = @original_f_qty">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_f_name" Type="String" />
            <asp:Parameter Name="original_f2" Type="String" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_f_price" Type="Int32" />
            <asp:Parameter Name="original_f_qty" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="f_name" Type="String" />
            <asp:Parameter Name="f2" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="f_price" Type="Int32" />
            <asp:Parameter Name="f_qty" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="f_name" Type="String" />
            <asp:Parameter Name="f2" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="f_price" Type="Int32" />
            <asp:Parameter Name="f_qty" Type="Int32" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_f_name" Type="String" />
            <asp:Parameter Name="original_f2" Type="String" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_f_price" Type="Int32" />
            <asp:Parameter Name="original_f_qty" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>
