<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manageflower.aspx.cs" Inherits="project2019.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    <table align="center">
        <tr>
            <td style="text-align:center">
                <br />
                <asp:Button ID="addflower" runat="server" Text="Add Flower" OnClick="addflower_Click" Width="50%" style="height:50px;margin-bottom:20px" />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                 <asp:GridView ID="GridView1" runat="server" align="center" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="118px" Width="90%" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                   <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                    <HeaderStyle ForeColor="Red" />
                    </asp:CommandField>
                    <asp:BoundField DataField="Id" HeaderText="Flower Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" >
                       <ControlStyle Width="400pt" />
                       <HeaderStyle HorizontalAlign="Center" Width="200px" />
                       <ItemStyle HorizontalAlign="Center" Width="200px" />
                       </asp:BoundField>
                    <asp:BoundField DataField="f_name" HeaderText="Flower Name" SortExpression="f_name" >
                       <HeaderStyle HorizontalAlign="Center" />
                       </asp:BoundField>
                    <asp:ImageField DataImageUrlField="f2" HeaderText="Flower Image2" ControlStyle-Height="200">
                    <ControlStyle Height="200px"></ControlStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:ImageField>
                    <asp:BoundField DataField="f_price" HeaderText="Flower Price" SortExpression="f_price" >
                       <HeaderStyle HorizontalAlign="Center" />
                       </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" >
                       <HeaderStyle HorizontalAlign="Center" />
                       </asp:BoundField>
                    <asp:BoundField DataField="f_qty" HeaderText="Flower Quantity" SortExpression="f_qty" >
                       <HeaderStyle HorizontalAlign="Center" />
                       </asp:BoundField>
                    <asp:BoundField DataField="available" HeaderText="Available" SortExpression="available" >
                       <HeaderStyle HorizontalAlign="Center" />
                       </asp:BoundField>
                    <asp:BoundField DataField="soldout" HeaderText="Soldout" SortExpression="soldout" >
            
                       <HeaderStyle HorizontalAlign="Center" />
                       </asp:BoundField>
            
                    </Columns>
                     <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                     <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                     <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                     <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                     <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#594B9C" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:divu %>" DeleteCommand="DELETE FROM [flower_detail] WHERE [Id] = @original_Id AND [f_name] = @original_f_name AND [f_price] = @original_f_price AND [f_qty] = @original_f_qty AND [description] = @original_description AND [f2] = @original_f2 AND [available] = @original_available AND [soldout] = @original_soldout" InsertCommand="INSERT INTO [flower_detail] ([f_name], [f_price], [f_qty], [description], [f2], [available], [soldout]) VALUES (@f_name, @f_price, @f_qty, @description, @f2, @available, @soldout)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [flower_detail]" UpdateCommand="UPDATE [flower_detail] SET [f_name] = @f_name, [f_price] = @f_price, [f_qty] = @f_qty, [description] = @description, [f2] = @f2, [available] = @available, [soldout] = @soldout WHERE [Id] = @original_Id AND [f_name] = @original_f_name AND [f_price] = @original_f_price AND [f_qty] = @original_f_qty AND [description] = @original_description AND [f2] = @original_f2 AND [available] = @original_available AND [soldout] = @original_soldout">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_f_name" Type="String" />
            <asp:Parameter Name="original_f_price" Type="Int32" />
            <asp:Parameter Name="original_f_qty" Type="Int32" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_f2" Type="String" />
            <asp:Parameter Name="original_available" Type="Int32" />
            <asp:Parameter Name="original_soldout" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="f_name" Type="String" />
            <asp:Parameter Name="f_price" Type="Int32" />
            <asp:Parameter Name="f_qty" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="f2" Type="String" />
            <asp:Parameter Name="available" Type="Int32" />
            <asp:Parameter Name="soldout" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="f_name" Type="String" />
            <asp:Parameter Name="f_price" Type="Int32" />
            <asp:Parameter Name="f_qty" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="f2" Type="String" />
            <asp:Parameter Name="available" Type="Int32" />
            <asp:Parameter Name="soldout" Type="Int32" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_f_name" Type="String" />
            <asp:Parameter Name="original_f_price" Type="Int32" />
            <asp:Parameter Name="original_f_qty" Type="Int32" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_f2" Type="String" />
            <asp:Parameter Name="original_available" Type="Int32" />
            <asp:Parameter Name="original_soldout" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>
