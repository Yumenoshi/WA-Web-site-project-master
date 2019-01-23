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
    public partial class DodajAdmina : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAnuluj_Click(object sender, EventArgs e)
        {
            Response.Redirect("StronaAdmin.aspx");
        }

        protected void ButtonPotwierdzDodawanie_Click(object sender, EventArgs e)
        {

            //sprawdz tabele czy taki login istnieje
            try
            {
                con.Open();
                SqlCommand cmdAdmin = new SqlCommand("select count(*) from administratorzy where admin_login='" + TextBoxLogin.Text + "'", con);
                SqlDataAdapter sdaAdmin = new SqlDataAdapter(cmdAdmin);

                DataTable dtAdmin = new DataTable();
                //DataTable dtUser = new DataTable();
                sdaAdmin.Fill(dtAdmin);
                cmdAdmin.ExecuteNonQuery();
                if (dtAdmin.Rows[0][0].ToString() == "1")
                {
                    Response.Write("<script>alert ('TAKI UŻYTKOWNIK ISTNIEJE')</script>");
                    con.Close();
                }
                else
                {
                    //dodaj admina do bazy
                    con.Close();
                    DodajAdminaDoBazy();
                }


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void DodajAdminaDoBazy()
        {

            try
            {
                string command = "INSERT INTO administratorzy (admin_login, admin_haslo) VALUES ('" + TextBoxLogin.Text + "','" + TextBoxHaslo.Text + "');";
                con.Open();
                SqlCommand cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert ('DODANO NOWEGO ADMINISTRATORA')</script>");
                Response.Redirect("StronaAdmin.aspx");

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}