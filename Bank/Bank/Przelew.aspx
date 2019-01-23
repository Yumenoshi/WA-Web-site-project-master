<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Przelew.aspx.cs" Inherits="Bank.Przelew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 50px">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Candara" Font-Size="Large" ForeColor="#739900" Text="WPŁAĆ / WYPŁAĆ "></asp:Label>
        <br />
        <br />
        <asp:Label ID="LabelObecny1" runat="server" Text="OBECNY STAN KONTA:" Font-Names="Candara" ForeColor="#252526"></asp:Label>
&nbsp;<asp:Label ID="LabelObecny" runat="server" Text="0.0" style="margin-left: 149px" Font-Names="Candara" ForeColor="#252526"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Label ID="LabelPrzelew" runat="server" Font-Names="Candara" ForeColor="#739900" Text="Zmiana stanu konta:" ></asp:Label>
        <asp:TextBox ID="TextBoxPrzelew" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 67px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxPrzelew" ErrorMessage="Wpisz kwotę;" Font-Names="Candara" ForeColor="#739900">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Font-Names="Candara" ForeColor="#252526" style="margin-left: 232px" Text="Zatwierdź" OnClick="Button1_Click" Width="120px" />
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" Font-Names="Candara" Font-Size="Small" ForeColor="#CC0000" />
        <br />
    
    </div>
    </form>
</body>
</html>
