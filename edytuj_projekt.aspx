<%@ Page Title="edytuj projekt" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="edytuj_projekt.aspx.cs" Inherits="aplikaccja.edytuj_projekt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" DeleteCommand="DELETE FROM [projekt] WHERE [id_projekt] = @id_projekt" InsertCommand="INSERT INTO [projekt] ([id_status], [id_rodzaj], [nr_projekt], [temat_projekt], [data_rozpoczecia], [data_zakonczenia], [kwota], [uwagi]) VALUES (@id_status, @id_rodzaj, @nr_projekt, @temat_projekt, @data_rozpoczecia, @data_zakonczenia, @kwota, @uwagi)" SelectCommand="SELECT projekt.id_projekt, projekt.id_rodzaj, rodzaj.nazwa_rodzaj, projekt.id_status, 
status.nazwa_status, projekt.nr_projekt, projekt.temat_projekt, projekt.data_rozpoczecia, 
projekt.data_zakonczenia, projekt.kwota, projekt.uwagi 
FROM projekt INNER JOIN rodzaj ON projekt.id_rodzaj = rodzaj.id_rodzaj 
INNER JOIN status ON projekt.id_status = status.id_status" UpdateCommand="UPDATE [projekt] SET [id_status] = @id_status, [id_rodzaj] = @id_rodzaj, [nr_projekt] = @nr_projekt, [temat_projekt] = @temat_projekt, [data_rozpoczecia] = @data_rozpoczecia, [data_zakonczenia] = @data_zakonczenia, [kwota] = @kwota, [uwagi] = @uwagi WHERE [id_projekt] = @id_projekt">
            <DeleteParameters>
                <asp:Parameter Name="id_projekt" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_status" Type="Int32" />
                <asp:Parameter Name="id_rodzaj" Type="Int32" />
                <asp:Parameter Name="nr_projekt" Type="String" />
                <asp:Parameter Name="temat_projekt" Type="String" />
                <asp:Parameter DbType="Date" Name="data_rozpoczecia" />
                <asp:Parameter DbType="Date" Name="data_zakonczenia" />
                <asp:Parameter Name="kwota" Type="Decimal" />
                <asp:Parameter Name="uwagi" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_status" Type="Int32" />
                <asp:Parameter Name="id_rodzaj" Type="Int32" />
                <asp:Parameter Name="nr_projekt" Type="String" />
                <asp:Parameter Name="temat_projekt" Type="String" />
                <asp:Parameter DbType="Date" Name="data_rozpoczecia" />
                <asp:Parameter DbType="Date" Name="data_zakonczenia" />
                <asp:Parameter Name="kwota" Type="Decimal" />
                <asp:Parameter Name="uwagi" Type="String" />
                <asp:Parameter Name="id_projekt" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" SelectCommand="SELECT * FROM [rodzaj] 

where nazwa_rodzaj &lt;&gt; '-wybierz rodzaj-'

ORDER BY [nazwa_rodzaj]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id_projekt" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id_projekt" HeaderText="id_projekt" InsertVisible="False" ReadOnly="True" SortExpression="id_projekt" Visible="False" />
                <asp:BoundField DataField="id_rodzaj" HeaderText="id_rodzaj" SortExpression="id_rodzaj" Visible="False" />
                <asp:BoundField DataField="nazwa_rodzaj" HeaderText="nazwa_rodzaj" SortExpression="nazwa_rodzaj" Visible="False" />
                <asp:TemplateField HeaderText="rodzaj projektu">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="nazwa_rodzaj" DataValueField="id_rodzaj" SelectedValue='<%# Bind("id_rodzaj") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("nazwa_rodzaj") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="status projektu" SortExpression="nazwa_status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nazwa_status" DataValueField="id_status" SelectedValue='<%# Bind("id_status") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("nazwa_status") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id_status" HeaderText="id_status" SortExpression="id_status" Visible="False" />
                <asp:BoundField DataField="nr_projekt" HeaderText="nr_projekt" SortExpression="nr_projekt" />
                <asp:BoundField DataField="temat_projekt" HeaderText="temat_projekt" SortExpression="temat_projekt" />
                <asp:BoundField DataField="data_rozpoczecia" HeaderText="data_rozpoczecia" SortExpression="data_rozpoczecia" DataFormatString="{0:d}" />
                <asp:BoundField DataField="data_zakonczenia" HeaderText="data_zakonczenia" SortExpression="data_zakonczenia" />
                <asp:BoundField DataField="kwota" HeaderText="kwota" SortExpression="kwota" />
                <asp:BoundField DataField="uwagi" HeaderText="uwagi" SortExpression="uwagi" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Right" BackColor="#E7E7FF" />
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
</asp:Content>