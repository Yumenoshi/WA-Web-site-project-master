using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Bank
{
    public partial class DodajKlienta : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                string cmdFindAdmin = "SELECT * FROM administratorzy WHERE admin_login='" + (string)Session["LoginAdmina"] + "';";
                con.Open();
                SqlCommand cmdAdmin = new SqlCommand(cmdFindAdmin, con);
                SqlDataAdapter sdaAdmin = new SqlDataAdapter(cmdAdmin);

                DataTable dtAdmin = new DataTable();
                sdaAdmin.Fill(dtAdmin);
                cmdAdmin.ExecuteNonQuery();
                if (dtAdmin.Rows[0][0].ToString() == "1")
                {

                    con.Close();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Redirect("Default.aspx");
                Response.Write(ex.Message);
            }


        }

        protected void ButtonAnuluj_Click(object sender, EventArgs e)
        {
            Response.Redirect("StronaAdmin.aspx");
        }


        protected void ButtonDodaj_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmdUser = new SqlCommand("select count(*) from klienci where user_login='" + TextBoxLogin.Text + "'", con);
                SqlCommand cmdKonto = new SqlCommand("select count(*) from konta where numer_konta='" + TextBoxLogin.Text + "'", con);
                SqlDataAdapter sdaUser = new SqlDataAdapter(cmdUser);
                SqlDataAdapter sdaKonto = new SqlDataAdapter(cmdKonto);

                DataTable dtUser = new DataTable();
                DataTable dtKonto = new DataTable();
                sdaUser.Fill(dtUser);
                sdaKonto.Fill(dtKonto);
                cmdUser.ExecuteNonQuery();
                cmdKonto.ExecuteNonQuery();
                if (dtUser.Rows[0][0].ToString() == "1")
                {
                    Response.Write("<script>alert ('TAKI KLIENT ISTNIEJE')</script>");
                    con.Close();
                }
                else if (dtKonto.Rows[0][0].ToString() == "1")
                {
                    Response.Write("<script>alert ('TAKI NUMER KONTA ISTNIEJE')</script>");
                    con.Close();
                }
                else
                {
                    //dodaj klienta do bazy
                    con.Close();

                    DodajKlientaDoBazy();
                    Response.Redirect("StronaAdmin.aspx");
                    con.Close();

                }
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void DodajKlientaDoBazy()
        {
            try
            {
                //dodaj do tabeli klienci
                int konto = 1;
                if (DropDownListRodzaj.Text == "Studentckie")
                {
                    konto = 1;
                } 
                else if (DropDownListRodzaj.Text == "Osobiste")
                {
                    konto = 2;
                }
                else if (DropDownListRodzaj.Text == "Oszczednosciowe")
                {
                    konto = 3;
                }
                else if (DropDownListRodzaj.Text == "Firmowe")
                {
                    konto = 4;
                }
                else if (DropDownListRodzaj.Text == "Debetowe")
                {
                    konto = 5;
                }
                else if (DropDownListRodzaj.Text == "Walutowe")
                {
                    konto = 6;
                }
                string commandKonta = "INSERT INTO konta (numer_konta,kwota,rodzaj_konta) VALUES ('" + TextBoxKonto.Text + "',0.0,'" + konto + "');";
                string command = "INSERT INTO klienci (imie, nazwisko, adres, Idkont, user_login,user_haslo) VALUES ('" + TextBoxImie.Text + "','" + TextBoxNazwisko.Text + "','" + TextBoxAdres.Text + "',SCOPE_IDENTITY(),'" + TextBoxLogin.Text + "','" + TextBoxHaslo.Text + "');";

                con.Open();
                SqlCommand cmdKonta = new SqlCommand(commandKonta, con);
                SqlCommand cmd = new SqlCommand(command, con);
                cmdKonta.ExecuteNonQuery();
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert ('DODANO NOWEGO KLIENTA')</script>");



            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
 
    }
}