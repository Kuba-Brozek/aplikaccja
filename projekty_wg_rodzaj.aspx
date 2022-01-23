<%@ Page Title="projekty wg rodzaju" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="projekty_wg_rodzaj.aspx.cs" Inherits="aplikaccja.projekty_wg_rodzaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" SelectCommand="SELECT * FROM [rodzaj] ORDER BY [nazwa_rodzaj]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" SelectCommand="SELECT rodzaj.id_rodzaj, status.nazwa_status, projekt.nr_projekt, projekt.temat_projekt, projekt.data_rozpoczecia, projekt.data_zakonczenia, projekt.kwota, projekt.uwagi
FROM projekt 
INNER JOIN rodzaj ON projekt.id_rodzaj = rodzaj.id_rodzaj 
INNER JOIN status ON projekt.id_status = status.id_status
where rodzaj.id_rodzaj = @id_rodzaj">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id_rodzaj" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        Rodzaj projektu:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nazwa_rodzaj" DataValueField="id_rodzaj">
        </asp:DropDownList>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id_rodzaj" DataSourceID="SqlDataSource2" EmptyDataText="Brak projektów do wyświetlenia." ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="id_rodzaj" HeaderText="id_rodzaj" InsertVisible="False" ReadOnly="True" SortExpression="id_rodzaj" Visible="False" />
                <asp:BoundField DataField="nazwa_status" HeaderText="nazwa_status" SortExpression="nazwa_status" />
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
    </p>
</asp:Content>
