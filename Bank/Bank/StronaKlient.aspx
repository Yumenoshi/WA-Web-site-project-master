<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StronaKlient.aspx.cs" Inherits="Bank.StronaKlient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 50px">
    
        <br />
    
        <asp:Label ID="LabelImie" runat="server" Text="IMIĘ" Font-Bold="True" Font-Italic="False" Font-Names="Candara" ForeColor="#739900"></asp:Label>
&nbsp;<asp:Label ID="LabelNazwisko" runat="server" Text="NAZWISKO" Font-Bold="True" Font-Italic="False" Font-Names="Candara" ForeColor="#739900"></asp:Label>
&nbsp;&nbsp;&nbsp;
            
        <asp:Button ID="ButtonWyloguj" runat="server" OnClick="ButtonWyloguj_Click" 
            Text="Wyloguj" style="margin-left: 168px" Font-Names="Candara" 
            ForeColor="#252526" Width="80px" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="ADRES:" Font-Names="Candara" ForeColor="#252526"></asp:Label>
&nbsp;<asp:Label ID="LabelAdres" runat="server" Text="Adres" style="margin-left: 149px" Font-Names="Candara" ForeColor="#252526"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="LOGIN:" Font-Names="Candara" ForeColor="#252526"></asp:Label>
&nbsp;<asp:Label ID="LabelLogin" runat="server" Text="Login" style="margin-left: 149px" Font-Names="Candara" ForeColor="#252526"></asp:Label>
&nbsp;
        <br />
        <asp:Label ID="Label3" runat="server" Text="HASŁO:" Font-Names="Candara" ForeColor="#252526"></asp:Label>
&nbsp;<asp:Label ID="LabelHaslo" runat="server" Text="Hasło" style="margin-left: 147px" Font-Names="Candara" ForeColor="#252526"></asp:Label>
        <br />
&nbsp;<br />
        <asp:Button ID="ButtonEdytuj" runat="server" Text="Edytuj" 
            style="margin-left: 294px" Width="80px" Font-Names="Candara" 
            ForeColor="#252526" OnClick="ButtonEdytuj_Click" />
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="DANE KONTA" Font-Names="Candara" ForeColor="#739900"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="NUMER KONTA: " Font-Names="Candara" ForeColor="#252526"></asp:Label>
&nbsp;<asp:Label ID="LabelKonto" runat="server" Text="00000000000000000000000000" style="margin-left: 63px" Font-Names="Candara" ForeColor="#252526"></asp:Label>
        <br />
        <asp:Label ID="Label7" runat="server" Text="KWOTA:" Font-Names="Candara" ForeColor="#252526"></asp:Label>
&nbsp;<asp:Label ID="LabelKwota" runat="server" Text="0.0" style="margin-left: 125px" Font-Names="Candara" ForeColor="#252526"></asp:Label>
        <br />
        <asp:Label ID="Label8" runat="server" Text="RODZAJ KONTA:" Font-Names="Candara" ForeColor="#252526"></asp:Label>
&nbsp;<asp:Label ID="LabelRodzaj" runat="server" Text="Rodzaj" style="margin-left: 59px" Font-Names="Candara" ForeColor="#252526"></asp:Label>
        <br />
        <br />
&nbsp;<asp:Button ID="Button" runat="server" Text="Zmiana Stanu Konta" 
            style="margin-left: 209px; height: 27px;" Width="159px" Font-Names="Candara" 
            ForeColor="#252526" OnClick="ButtonPrzelew_Click" />
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
