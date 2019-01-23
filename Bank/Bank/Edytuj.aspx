<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edytuj.aspx.cs" Inherits="Bank.Edytuj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 50px">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Candara" Font-Size="Large" ForeColor="#739900" Text="EDYTUJ DANE"></asp:Label>
        <br />
        <br />
        <asp:Label ID="LabelImie" runat="server" Font-Names="Candara" ForeColor="#252526" Text="Imię" style="margin-left: 50px"></asp:Label>
        <asp:TextBox ID="TextBoxImie" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 128px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxImie" ErrorMessage="podaj imię;" Font-Names="Candara" ForeColor="#739900">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="LabelNazwisko" runat="server" Font-Names="Candara" ForeColor="#252526" Text="Nazwisko" style="margin-left: 50px"></asp:Label>
        <asp:TextBox ID="TextBoxNazwisko" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 91px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxNazwisko" ErrorMessage="podaj nazwisko; " Font-Names="Candara" ForeColor="#739900">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="LabelAdres" runat="server" Font-Names="Candara" ForeColor="#252526" Text="Adres" style="margin-left: 50px"></asp:Label>
        <asp:TextBox ID="TextBoxAdres" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 116px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxAdres" ErrorMessage="podaj adres;" Font-Names="Candara" ForeColor="#739900">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="LabelLogin" runat="server" Font-Names="Candara" ForeColor="#739900" Text="Edytuj login" style="margin-left: 50px"></asp:Label>
        <asp:TextBox ID="TextBoxLogin" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 78px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxLogin" ErrorMessage="wpisz nowy login bądź pozostaw stare;" Font-Names="Candara" ForeColor="#739900">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="LabelHaslo" runat="server" Font-Names="Candara" ForeColor="#739900" Text="Edytuj hasło" style="margin-left: 50px"></asp:Label>
        <asp:TextBox ID="TextBoxHaslo" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 74px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxHaslo" ErrorMessage="wpisz nowe hasło bądź pozostaw stare;" Font-Names="Candara" ForeColor="#739900">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 241px" Text="Zatwierdź" OnClick="Button1_Click" Width="120px" />
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" Font-Names="Candara" Font-Size="Small" ForeColor="#CC0000" />
        <br />
    
    </div>
    </form>
</body>
</html>
