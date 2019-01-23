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
    public partial class Default : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonZaloguj_Click(object sender, EventArgs e)
        {

            string constr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                SqlCommand cmdAdmin = new SqlCommand("select count(*) from administratorzy where admin_login='" + TextBoxLogin.Text + "' AND admin_haslo='" + TextBoxHaslo.Text + "'", con);
                SqlCommand cmdUser = new SqlCommand("select count(*) from klienci where user_login='" + TextBoxLogin.Text + "' AND user_haslo='" + TextBoxHaslo.Text + "'", con);
                SqlDataAdapter sdaAdmin = new SqlDataAdapter(cmdAdmin);
                SqlDataAdapter sdaUser = new SqlDataAdapter(cmdUser);

                DataTable dtAdmin = new DataTable();
                DataTable dtUser = new DataTable();
                sdaAdmin.Fill(dtAdmin);
                sdaUser.Fill(dtUser);
                cmdAdmin.ExecuteNonQuery();
                cmdUser.ExecuteNonQuery();
                if (dtAdmin.Rows[0][0].ToString() == "1")
                {

                    Session["LoginAdmina"] = TextBoxLogin.Text;
                    Response.Redirect("StronaAdmin.aspx");

                }
                else if (dtUser.Rows[0][0].ToString() == "1")
                {
                    Session["LoginUsera"] = TextBoxLogin.Text;
                    Response.Redirect("StronaKlient.aspx");

                }
                else
                {
                    Response.Write("<script>alert ('BŁĄD LOGOWANIA')</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

    }
}