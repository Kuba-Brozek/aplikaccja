<%@ Page Title="dodaj rodzaj projektu" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="dodaj_rodzaj.aspx.cs" Inherits="aplikaccja.dodaj_rodzaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" DeleteCommand="DELETE FROM [rodzaj] WHERE [id_rodzaj] = @id_rodzaj" InsertCommand="INSERT INTO [rodzaj] ([nazwa_rodzaj]) VALUES (@nazwa_rodzaj)" SelectCommand="SELECT * FROM [rodzaj]" UpdateCommand="UPDATE [rodzaj] SET [nazwa_rodzaj] = @nazwa_rodzaj WHERE [id_rodzaj] = @id_rodzaj">
    <DeleteParameters>
        <asp:Parameter Name="id_rodzaj" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="nazwa_rodzaj" PropertyName="Text" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="nazwa_rodzaj" Type="String" />
        <asp:Parameter Name="id_rodzaj" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
        <br />
    </p>
    <p>
        rodzaj projektu:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="nie wprowadzono nazwy rodzaju projektu!!!" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
    </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" Width="1227px" />
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="zapisz" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
