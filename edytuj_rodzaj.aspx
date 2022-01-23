<%@ Page Title="edytuj rodzaj projektu" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="edytuj_rodzaj.aspx.cs" Inherits="aplikaccja.edytuj_rodzaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" DeleteCommand="DELETE FROM [rodzaj] WHERE [id_rodzaj] = @id_rodzaj" InsertCommand="INSERT INTO [rodzaj] ([nazwa_rodzaj]) VALUES (@nazwa_rodzaj)" SelectCommand="SELECT * FROM [rodzaj]" UpdateCommand="UPDATE [rodzaj] SET [nazwa_rodzaj] = @nazwa_rodzaj WHERE [id_rodzaj] = @id_rodzaj">
            <DeleteParameters>
                <asp:Parameter Name="id_rodzaj" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nazwa_rodzaj" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nazwa_rodzaj" Type="String" />
                <asp:Parameter Name="id_rodzaj" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id_rodzaj" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id_rodzaj" HeaderText="id_rodzaj" InsertVisible="False" ReadOnly="True" SortExpression="id_rodzaj" Visible="False" />
                <asp:BoundField DataField="nazwa_rodzaj" HeaderText="rodzaj projektu" SortExpression="nazwa_rodzaj" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
