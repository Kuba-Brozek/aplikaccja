<%@ Page Title="dodaj projekt" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="dodaj_projekt.aspx.cs" Inherits="aplikaccja.dodaj_projekt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1207px;
        }
        .auto-style2 {
            width: 119px;
        }
        .auto-style3 {
            width: 100%;
            height: 297px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" SelectCommand="SELECT * FROM [rodzaj] ORDER BY [nazwa_rodzaj]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" SelectCommand="SELECT * FROM [status] ORDER BY [nazwa_status]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:polaczenie_projekty %>" DeleteCommand="DELETE FROM [projekt] WHERE [id_projekt] = @id_projekt" InsertCommand="INSERT INTO [projekt] ([id_status], [id_rodzaj], [nr_projekt], [temat_projekt], [data_rozpoczecia], [data_zakonczenia], [kwota], [uwagi]) VALUES (@id_status, @id_rodzaj, @nr_projekt, @temat_projekt, @data_rozpoczecia, @data_zakonczenia, @kwota, @uwagi)" SelectCommand="SELECT * FROM [projekt]" UpdateCommand="UPDATE [projekt] SET [id_status] = @id_status, [id_rodzaj] = @id_rodzaj, [nr_projekt] = @nr_projekt, [temat_projekt] = @temat_projekt, [data_rozpoczecia] = @data_rozpoczecia, [data_zakonczenia] = @data_zakonczenia, [kwota] = @kwota, [uwagi] = @uwagi WHERE [id_projekt] = @id_projekt">
            <DeleteParameters>
                <asp:Parameter Name="id_projekt" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DDL_rodzaj_projektu" Name="id_status" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DDL_rodzaj_projektu" Name="id_rodzaj" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TB_nr_projektu" Name="nr_projekt" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_temat_projektu" Name="temat_projekt" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_data_rozpoczecia" DbType="Date" Name="data_rozpoczecia" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_data_zakonczenia" DbType="Date" Name="data_zakonczenia" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_kwota" Name="kwota" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="TB_uwagi" Name="uwagi" PropertyName="Text" Type="String" />
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
        <br />
        <table class="auto-style3">
            <tr>
                <td class="auto-style2">rodzaj projektu:</td>
                <td>
                    <asp:DropDownList ID="DDL_rodzaj_projektu" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nazwa_rodzaj" DataValueField="id_rodzaj" Font-Italic="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">status projektu:</td>
                <td>
                    <asp:DropDownList ID="DDL_status_projektu" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="nazwa_status" DataValueField="id_status" Font-Italic="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">nr projektu:</td>
                <td>
                    <asp:TextBox ID="TB_nr_projektu" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_nr_projektu" ErrorMessage="nie podano numeru projektu!!!" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">temat projektu:</td>
                <td>
                    <asp:TextBox ID="TB_temat_projektu" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_temat_projektu" ErrorMessage="nie podano tematu projektu!!!" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">data rozpoczęcia:</td>
                <td>
                    <asp:TextBox ID="TB_data_rozpoczecia" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_data_rozpoczecia" ErrorMessage="nie podano daty rozpoczecia projektu!!!" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">data zakończenia:</td>
                <td>
                    <asp:TextBox ID="TB_data_zakonczenia" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">kwota projektu:</td>
                <td>
                    <asp:TextBox ID="TB_kwota" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_kwota" ErrorMessage="nie podano kwoty projektu!!!" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">uwagi::</td>
                <td>
                    <asp:TextBox ID="TB_uwagi" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
    </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" />
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="zapisz projekt" />
    </p>
</asp:Content>
