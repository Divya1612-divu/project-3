<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userdetails.aspx.cs" Inherits="project2019.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" align="center" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="3" CssClass="auto-style1" Height="239px" Width="80%" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" GridLines="None">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" >
        <ControlStyle Width="100px" />
        <HeaderStyle Width="100px" HorizontalAlign="Center" />
        <ItemStyle HorizontalAlign="Center" Width="100px" />
        </asp:BoundField>
        <asp:BoundField DataField="txtfname" HeaderText="FirstName" SortExpression="txtfname" />
        <asp:BoundField DataField="txtlname" HeaderText="LastName" SortExpression="txtlname" />
        <asp:BoundField DataField="txteid" HeaderText="EmailId" SortExpression="txteid" />
        <asp:BoundField DataField="txtadd" HeaderText="Address" SortExpression="txtadd" />
        <asp:BoundField DataField="txtcno" HeaderText="ContactNo" SortExpression="txtcno" />
        <asp:BoundField DataField="txtuname" HeaderText="UserName" SortExpression="txtuname" />
        <asp:BoundField DataField="txtpwd" HeaderText="Password" SortExpression="txtpwd" />
    </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:divu %>" DeleteCommand="DELETE FROM [flowerreg] WHERE [Id] = @original_Id AND [txtfname] = @original_txtfname AND [txtlname] = @original_txtlname AND [txteid] = @original_txteid AND [txtadd] = @original_txtadd AND [txtcno] = @original_txtcno AND [txtuname] = @original_txtuname AND [txtpwd] = @original_txtpwd" InsertCommand="INSERT INTO [flowerreg] ([txtfname], [txtlname], [txteid], [txtadd], [txtcno], [txtuname], [txtpwd]) VALUES (@txtfname, @txtlname, @txteid, @txtadd, @txtcno, @txtuname, @txtpwd)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [flowerreg]" UpdateCommand="UPDATE [flowerreg] SET [txtfname] = @txtfname, [txtlname] = @txtlname, [txteid] = @txteid, [txtadd] = @txtadd, [txtcno] = @txtcno, [txtuname] = @txtuname, [txtpwd] = @txtpwd WHERE [Id] = @original_Id AND [txtfname] = @original_txtfname AND [txtlname] = @original_txtlname AND [txteid] = @original_txteid AND [txtadd] = @original_txtadd AND [txtcno] = @original_txtcno AND [txtuname] = @original_txtuname AND [txtpwd] = @original_txtpwd">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_txtfname" Type="String" />
        <asp:Parameter Name="original_txtlname" Type="String" />
        <asp:Parameter Name="original_txteid" Type="String" />
        <asp:Parameter Name="original_txtadd" Type="String" />
        <asp:Parameter Name="original_txtcno" Type="String" />
        <asp:Parameter Name="original_txtuname" Type="String" />
        <asp:Parameter Name="original_txtpwd" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="txtfname" Type="String" />
        <asp:Parameter Name="txtlname" Type="String" />
        <asp:Parameter Name="txteid" Type="String" />
        <asp:Parameter Name="txtadd" Type="String" />
        <asp:Parameter Name="txtcno" Type="String" />
        <asp:Parameter Name="txtuname" Type="String" />
        <asp:Parameter Name="txtpwd" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="txtfname" Type="String" />
        <asp:Parameter Name="txtlname" Type="String" />
        <asp:Parameter Name="txteid" Type="String" />
        <asp:Parameter Name="txtadd" Type="String" />
        <asp:Parameter Name="txtcno" Type="String" />
        <asp:Parameter Name="txtuname" Type="String" />
        <asp:Parameter Name="txtpwd" Type="String" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_txtfname" Type="String" />
        <asp:Parameter Name="original_txtlname" Type="String" />
        <asp:Parameter Name="original_txteid" Type="String" />
        <asp:Parameter Name="original_txtadd" Type="String" />
        <asp:Parameter Name="original_txtcno" Type="String" />
        <asp:Parameter Name="original_txtuname" Type="String" />
        <asp:Parameter Name="original_txtpwd" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
</asp:Content>
