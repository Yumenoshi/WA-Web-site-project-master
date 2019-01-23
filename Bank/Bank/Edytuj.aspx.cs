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
    public partial class Edytuj : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                string cmdTakeData = "SELECT imie, nazwisko, adres, user_login, user_haslo FROM klienci where user_login='" + (string)Session["LoginUsera"] + "';";

                //try
                //{
                    con.Open();
                    SqlCommand cmd = new SqlCommand(cmdTakeData, con);
                    SqlDataReader readerDane = cmd.ExecuteReader();
                    if (readerDane.HasRows)
                    {
                        while (readerDane.Read())
                        {
                            TextBoxImie.Text = readerDane["imie"].ToString();
                            TextBoxNazwisko.Text = readerDane["nazwisko"].ToString();
                            TextBoxAdres.Text = readerDane["adres"].ToString();
                            TextBoxLogin.Text = readerDane["user_login"].ToString();
                            TextBoxHaslo.Text = readerDane["user_haslo"].ToString();

                        }
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }

                    readerDane.Close();
                    con.Close();

                //}
                //catch (Exception ex)
                //{
                //    Response.Write(ex.Message);
               // }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            string cmdUpdate = @"BEGIN TRANSACTION; 
            UPDATE klienci SET imie='" + TextBoxImie.Text +
            "', nazwisko='" + TextBoxNazwisko.Text +
            "', adres='" + TextBoxAdres.Text +
            "', user_login='" + TextBoxLogin.Text +
            "', user_haslo='" + TextBoxHaslo.Text +
            "'FROM klienci WHERE user_login='" + (string)Session["LoginUsera"] + "'; " +
            " COMMIT;";
            


                con.Open();
                SqlCommand cmd = new SqlCommand(cmdUpdate, con);
                cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("StronaKlient.aspx");
        }
    }
}