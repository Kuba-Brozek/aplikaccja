<%@ Page Title="projekty wg statusu" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="projekty_wg_status.aspx.cs" Inherits="aplikaccja.projekty_wg_status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" SelectCommand="SELECT * FROM [status] ORDER BY [nazwa_status]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" SelectCommand="SELECT status.id_status, rodzaj.nazwa_rodzaj, projekt.nr_projekt, projekt.temat_projekt, 
projekt.data_rozpoczecia, projekt.data_zakonczenia, projekt.kwota, projekt.uwagi
FROM projekt INNER JOIN rodzaj ON projekt.id_rodzaj = rodzaj.id_rodzaj 
INNER JOIN status ON projekt.id_status = status.id_status
WHERE (status.id_status = @id_status)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id_status" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Status projektu:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nazwa_status" DataValueField="id_status">
        </asp:DropDownList>
    </p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id_status" DataSourceID="SqlDataSource2" EmptyDataText="Brak projektów do wyświetlenia." ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="id_status" HeaderText="id_status" InsertVisible="False" ReadOnly="True" SortExpression="id_status" Visible="False" />
            <asp:BoundField DataField="nazwa_rodzaj" HeaderText="nazwa_rodzaj" SortExpression="nazwa_rodzaj" />
            <asp:BoundField DataField="nr_projekt" HeaderText="nr_projekt" SortExpression="nr_projekt" />
            <asp:BoundField DataField="temat_projekt" HeaderText="temat_projekt" SortExpression="temat_projekt" />
            <asp:BoundField DataField="data_rozpoczecia" DataFormatString="{0:d}" HeaderText="data_rozpoczecia" SortExpression="data_rozpoczecia" />
            <asp:BoundField DataField="data_zakonczenia" HeaderText="data_zakonczenia" SortExpression="data_zakonczenia" />
            <asp:BoundField DataField="kwota" HeaderText="kwota" SortExpression="kwota" />
            <asp:BoundField DataField="uwagi" HeaderText="uwagi" SortExpression="uwagi" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
