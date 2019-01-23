<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DodajAdmina.aspx.cs" Inherits="Bank.DodajAdmina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Candara" Font-Size="Large" ForeColor="#739900" Text="DODAJ ADMINISTRATORA"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Font-Names="Candara" ForeColor="#739900" Text="WPROWADŹ DANE"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Names="Candara" ForeColor="#252526" Text="LOGIN" style="margin-left: 50px"></asp:Label>
        <asp:TextBox ID="TextBoxLogin" runat="server" style="margin-left: 21px" Font-Names="Candara" ForeColor="#252526" MaxLength="15"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLogin" ErrorMessage="podaj login;">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Names="Candara" ForeColor="#252526" Text="HASŁO" style="margin-left: 50px"></asp:Label>
        <asp:TextBox ID="TextBoxHaslo" runat="server" style="margin-left: 18px" Font-Names="Candara" ForeColor="#252526" TextMode="Password" MaxLength="20"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxHaslo" ErrorMessage="podaj hasło">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Button ID="ButtonAnuluj" runat="server" OnClick="ButtonAnuluj_Click" Text="Anuluj" Width="115px" Font-Names="Candara" ForeColor="#252526" style="margin-left: 47px" CausesValidation="False" />
        <asp:Button ID="ButtonPotwierdzDodawanie" runat="server" OnClick="ButtonPotwierdzDodawanie_Click" Text="Dodaj" Width="116px" Font-Names="Candara" ForeColor="#252526" style="margin-left: 46px" />
        <br />
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" Font-Italic="True" Font-Names="Candara" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#CC0000" />
    
        <br />
    </form>
</body>
</html>
