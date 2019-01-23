using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Globalization;

namespace Bank
{
    public partial class StronaKlient : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = Session["LoginUsera"];

            try
            {
                //wczytaj klienta 
                string cmdKlient = "SELECT klienci.imie, klienci.nazwisko, klienci.adres, konta.numer_konta, konta.kwota, rodzaj_konta.rodzaj, klienci.user_login, klienci.user_haslo FROM klienci INNER JOIN konta ON klienci.idkont = konta.idKonta INNER JOIN rodzaj_konta ON konta.rodzaj_konta = rodzaj_konta.idRodzaj WHERE klienci.user_login='" + (string)Session["LoginUsera"] + "';";
                con.Open();
                SqlCommand cmd = new SqlCommand(cmdKlient, con);
                SqlDataReader readerKlient = cmd.ExecuteReader();
                if (readerKlient.HasRows)
                {
                    while (readerKlient.Read())
                    {

                        LabelImie.Text = readerKlient["imie"].ToString();
                        LabelNazwisko.Text = readerKlient["nazwisko"].ToString();
                        LabelAdres.Text = readerKlient["adres"].ToString();
                        LabelLogin.Text = readerKlient["user_login"].ToString();
                        LabelHaslo.Text = readerKlient["user_haslo"].ToString();

                        LabelKonto.Text = readerKlient["numer_konta"].ToString();
                        LabelKwota.Text = readerKlient["kwota"].ToString();
                        LabelRodzaj.Text = readerKlient["rodzaj"].ToString();

                    }

                }
                else
                {
                    Response.Redirect("Default.aspx");

                }




                readerKlient.Close();

                con.Close();


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void ButtonWyloguj_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }



        protected void ButtonEdytuj_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edytuj.aspx");
        }

        protected void ButtonPrzelew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Przelew.aspx");
        }
    }
}