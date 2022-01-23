<%@ Page Title="dodaj status projektu" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="dodaj_status.aspx.cs" Inherits="aplikaccja.dodaj_status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" DeleteCommand="DELETE FROM [status] WHERE [id_status] = @id_status" InsertCommand="INSERT INTO [status] ([nazwa_status]) VALUES (@nazwa_status)" SelectCommand="SELECT * FROM [status]" UpdateCommand="UPDATE [status] SET [nazwa_status] = @nazwa_status WHERE [id_status] = @id_status">
            <DeleteParameters>
                <asp:Parameter Name="id_status" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="nazwa_status" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nazwa_status" Type="String" />
                <asp:Parameter Name="id_status" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        status projektu:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="nie wprowadzono statusu projektu!!!" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
    </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" />
    <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="Label"></asp:Label>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="zapisz" />
    </p>
</asp:Content>
