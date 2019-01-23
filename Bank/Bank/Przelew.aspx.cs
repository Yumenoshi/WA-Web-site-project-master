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
    public partial class Przelew : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string obecnakwota="";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                string cmdTakeData = "SELECT kwota FROM konta LEFT JOIN klienci ON konta.idKonta=klienci.idkont where klienci.user_login='" + (string)Session["LoginUsera"] + "';";

                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(cmdTakeData, con);
                    SqlDataReader readerDane = cmd.ExecuteReader();
                    if (readerDane.HasRows)
                    {
                        while (readerDane.Read())
                        {
                            LabelObecny.Text = readerDane["kwota"].ToString();
                            obecnakwota = readerDane["kwota"].ToString();
                        }
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }

                    readerDane.Close();
                    con.Close();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            double a = Convert.ToDouble(TextBoxPrzelew.Text);
            double b = Convert.ToDouble(LabelObecny.Text);
            double nowakwota = a + b;
            string cmdUpdate = @"BEGIN TRANSACTION; 
            UPDATE konta SET kwota='" +nowakwota.ToString() +
            "'FROM konta LEFT JOIN klienci ON konta.idKonta=klienci.idkont where klienci.user_login='" + (string)Session["LoginUsera"] + "'; " +
            "COMMIT;";


            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(cmdUpdate, con);
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            con.Close();

            Response.Redirect("StronaKlient.aspx");
        }
    }
}