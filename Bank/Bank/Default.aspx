<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bank.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 50px">
    
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Italic="False" Font-Names="Candara" Font-Overline="True" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" Text="Bank"></asp:Label>
        <br />
        <br />
        <br />
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:Label ID="LabelLogin" runat="server" Text="login" style="margin-left: 250px" Font-Bold="False" Font-Italic="True" Font-Names="Candara" ForeColor="#252526"></asp:Label>
        <asp:TextBox ID="TextBoxLogin" runat="server" style="margin-left: 43px" Height="20px" Width="129px" Font-Names="Candara" MaxLength="11"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLogin" runat="server" ControlToValidate="TextBoxLogin" ErrorMessage="podaj login;" Font-Bold="True" Font-Names="Candara">*</asp:RequiredFieldValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelHaslo" runat="server" Text="hasło" style="margin-left: 250px" Font-Bold="False" Font-Italic="True" Font-Names="Candara" ForeColor="#252526"></asp:Label>
        <asp:TextBox ID="TextBoxHaslo" runat="server" style="margin-left: 45px" Height="20px" Width="129px" Font-Bold="False" Font-Names="Candara"  TextMode="Password" MaxLength="20"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorHaslo" runat="server" ControlToValidate="TextBoxHaslo" ErrorMessage="podaj hasło;" Font-Bold="True" Font-Names="Candara">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="ButtonZaloguj" runat="server" ForeColor="#252526" OnClick="ButtonZaloguj_Click" Text="ZALOGUJ" Width="133px" Font-Bold="False" Font-Names="Candara" Font-Size="Medium" Height="33px" style="margin-left: 359px" />
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" Font-Italic="True" Font-Names="Candara" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#CC0000" />
    
    </div>
    </form>
</body>
</html>
