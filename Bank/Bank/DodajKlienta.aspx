<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DodajKlienta.aspx.cs" Inherits="Bank.DodajKlienta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 50px">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Candara" Font-Size="Large" ForeColor="#739900" Text="DODAJ KLIENTA"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Names="Candara" ForeColor="#739900" Text="WPROWADŹ DANE"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Names="Candara" ForeColor="#252526" Text="IMIĘ" style="margin-left: 50px"></asp:Label>
        &nbsp;
        <asp:TextBox ID="TextBoxImie" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 76px" Width="153px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxImie" ErrorMessage="podaj imię;" Font-Names="Candara">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label4" runat="server" Font-Names="Candara" ForeColor="#252526" Text="NAZWISKO" style="margin-left: 50px"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxNazwisko" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 34px" Width="152px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxNazwisko" ErrorMessage="podaj nazwisko;" Font-Names="Candara">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label5" runat="server" Font-Names="Candara" ForeColor="#252526" Text="ADRES" style="margin-left: 50px"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxAdres" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 63px" Width="152px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxAdres" ErrorMessage="podaj adres;" Font-Names="Candara">*</asp:RequiredFieldValidator>
        <br />
         <asp:Label ID="Label6" runat="server" Font-Names="Candara" ForeColor="#252526" Text="LOGIN" style="margin-left: 50px"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxLogin" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 65px" Width="152px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxLogin" ErrorMessage="podaj login;" Font-Names="Candara">*</asp:RequiredFieldValidator>
         <br />
         <asp:Label ID="Label7" runat="server" Font-Names="Candara" ForeColor="#252526" Text="HASŁO" style="margin-left: 50px"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxHaslo" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 61px" Width="152px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxHaslo" ErrorMessage="podaj haslo;" Font-Names="Candara">*</asp:RequiredFieldValidator>
         <br />
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Font-Names="Candara" ForeColor="#739900" Text="ZRÓB KONTO"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label9" runat="server" Font-Names="Candara" ForeColor="#252526" Text="NUMER KONTA" style="margin-left: 50px"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxKonto" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 66px" Width="152px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxKonto" ErrorMessage="podaj numer konta;" Font-Names="Candara">*</asp:RequiredFieldValidator>
        <br />
         <asp:Label ID="Label10" runat="server" Font-Names="Candara" ForeColor="#252526" Text="RODZAJ KONTA" style="margin-left: 50px"></asp:Label>
        &nbsp;
        <asp:DropDownList ID="DropDownListRodzaj" runat="server" 
            DataSourceID="SqlDataSourceRodzaj" DataTextField="rodzaj" 
            DataValueField="rodzaj" Font-Names="Candara" ForeColor="#252526" 
            style="margin-left: 63px" Width="156px" >
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceRodzaj" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [rodzaj] FROM [rodzaj_konta]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="ButtonDodaj" runat="server" Text="Dodaj" Width="113px" Font-Names="Candara" ForeColor="#252526" OnClick="ButtonDodaj_Click" style="margin-left: 150px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonAnuluj" runat="server" Text="Anuluj" Width="109px" OnClick="ButtonAnuluj_Click" Font-Names="Candara" ForeColor="#252526" CausesValidation="False" />
    
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" Font-Names="Candara" Font-Size="Small" ForeColor="#CC0000" />
    
    </div>
    </form>
</body>
</html>
