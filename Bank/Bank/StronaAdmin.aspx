<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StronaAdmin.aspx.cs" Inherits="Bank.StronaAdmin" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 50px">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Italic="True" Font-Names="Candara" Font-Overline="False" Font-Size="X-Large" ForeColor="#739900" Text="Witaj, "></asp:Label>
        <asp:Label ID="LabelLoginAdmin" runat="server" Text="TWÓJ LOGIN" Font-Bold="True" Font-Italic="True" Font-Names="Candara" Font-Overline="False" Font-Size="X-Large" ForeColor="#739900"></asp:Label>
        <asp:Button ID="ButtonWyloguj" runat="server" OnClick="ButtonWyloguj_Click" 
            Text="Wyloguj" Width="131px" Font-Names="Candara" ForeColor="#252526" 
            style="margin-left: 23px; margin-bottom: 0px;" />
        <br />
        <br />
        <asp:Label ID="LabelKlienci" runat="server" Text="KLIENCI" Font-Names="Candara" ForeColor="#739900"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridViewKlient" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="429px" Font-Names="Candara" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Vertical" OnSelectedIndexChanged="GridViewKlient_SelectedIndexChanged" Height="292px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField HeaderText="Wybór" SelectText="Wybierz" ShowSelectButton="True" />
                <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
                <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" 
                    SortExpression="nazwisko" />
                <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
                <asp:BoundField DataField="numer_konta" HeaderText="numer_konta" 
                    SortExpression="numer_konta" />
                <asp:BoundField DataField="kwota" HeaderText="kwota" SortExpression="kwota" />
                <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" 
                    SortExpression="rodzaj" />
                <asp:BoundField DataField="user_login" HeaderText="user_login" 
                    SortExpression="user_login" />
                <asp:BoundField DataField="user_haslo" HeaderText="user_haslo" 
                    SortExpression="user_haslo" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT klienci.imie, klienci.nazwisko, klienci.adres, konta.numer_konta, konta.kwota, rodzaj_konta.rodzaj, klienci.user_login, klienci.user_haslo FROM klienci INNER JOIN konta ON klienci.idkont = konta.idKonta INNER JOIN rodzaj_konta ON konta.rodzaj_konta = rodzaj_konta.idRodzaj">
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="ButtonDodajKlienta" runat="server" Text="Dodaj nowego klienta" 
            OnClick="ButtonDodajKlienta_Click" Font-Names="Candara" 
            ForeColor="#252526" style="margin-left: 0px" Width="213px" />

        <asp:Button ID="ButtonUsunKlienta" runat="server" 
            OnClick="ButtonUsunKlienta_Click" Text="Usuń klienta" Width="186px" 
            Font-Names="Candara" ForeColor="#252526" style="margin-left: 28px" />

        <br />
        <br />
        <br />
        <asp:Label ID="LabelAdministratorzy" runat="server" Text="ADMINISTRATORZY" 
            Font-Names="Candara" ForeColor="#739900"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridViewAdmin" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="429px" Font-Names="Candara" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Vertical" OnSelectedIndexChanged="GridViewAdmin_SelectedIndexChanged" Height="292px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField HeaderText="Wybór" SelectText="Wybierz" ShowSelectButton="True" />
                <asp:BoundField DataField="admin_login" HeaderText="LOGIN" 
                    SortExpression="admin_login" />
                <asp:BoundField DataField="admin_haslo" HeaderText="HASŁO" 
                    SortExpression="admin_haslo" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [admin_login], [admin_haslo] FROM [administratorzy]">
        </asp:SqlDataSource>
        <br />
        <br />
       
        <asp:Button ID="ButtonDodajAdmina" runat="server" 
            OnClick="ButtonDodajAdmina_Click" Text="Dodaj administratora" Width="186px" 
            Font-Names="Candara" ForeColor="#252526" style="margin-left: 17px" />

        <asp:Button ID="ButtonUsunAdmina" runat="server" 
            OnClick="ButtonUsunAdmina_Click" Text="Usuń administratora" Width="186px" 
            Font-Names="Candara" ForeColor="#252526" style="margin-left: 28px" />

        <br />
    
    </div>
    </form>
</body>
</html>
