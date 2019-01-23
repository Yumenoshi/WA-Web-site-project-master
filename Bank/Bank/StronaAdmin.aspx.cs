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
    public partial class StronaAdmin : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Session["IdAmin"] = "0";
                Session["IdKlient"] = "0";
                Session["IdKonta"] = "0";
                LabelLoginAdmin.Text = (string)Session["LoginAdmina"];
                if (LabelLoginAdmin.Text == "")
                {
                    Response.Redirect("Default.aspx");
                }
            }

        }

        protected void ButtonWyloguj_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ButtonDodajKlienta_Click(object sender, EventArgs e)
        {
            Response.Redirect("DodajKlienta.aspx");
        }

        protected void ButtonDodajAdmina_Click(object sender, EventArgs e)
        {
            Response.Redirect("DodajAdmina.aspx");
        }

        protected void GridViewKlient_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
                //con.Close();
                Response.Write("<script>alert ('" + GridViewKlient.SelectedRow.Cells[4].Text + "')</script>");
                string cmdSprawdzKlient = "Select id From klienci WHERE user_login='" + GridViewKlient.SelectedRow.Cells[7].Text + "';";
                con.Open();
                
                SqlCommand cmd = new SqlCommand(cmdSprawdzKlient, con);
                SqlDataReader readerKlient = cmd.ExecuteReader();

                if (readerKlient.HasRows)
                {
                    while (readerKlient.Read())
                    {
                        Session["IdKlient"] = readerKlient["id"].ToString();
                       
                    }

                }

                readerKlient.Close();
                con.Close();

                con.Open();
                string cmdSprawdzKonto = "Select idKonta From konta WHERE numer_konta='" + GridViewKlient.SelectedRow.Cells[4].Text + "';";
                SqlCommand cmd1 = new SqlCommand(cmdSprawdzKonto, con);
                SqlDataReader readerKonto = cmd1.ExecuteReader();
				if (readerKonto.HasRows)
                {
                    while (readerKonto.Read())
                    {
                        Session["IdKonta"] = readerKonto["idKonta"].ToString();
                        
                    }

                }

                readerKonto.Close();

                con.Close();
            //}
           // catch (Exception ex)
            //{
            //    Response.Write(ex.Message);
            //}
        }


        protected void GridViewAdmin_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string cmdSprawdzAdmina = "Select id From administratorzy WHERE admin_login='" + GridViewAdmin.SelectedRow.Cells[1].Text + "';";
                con.Open();
                SqlCommand cmd = new SqlCommand(cmdSprawdzAdmina, con);
                SqlDataReader readerAdmin = cmd.ExecuteReader();

                if (readerAdmin.HasRows)
                {
                    while (readerAdmin.Read())
                    {
                        Session["IdAdmin"] = readerAdmin["id"].ToString();
                    }

                }
                
                readerAdmin.Close();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void ButtonUsunAdmina_Click(object sender, EventArgs e)
        {
            int z=Convert.ToInt32(Session["IdAdmin"]);
            if (z == 0)
            {
                Response.Write("<script>alert ('NIE WYBRANO ŻADNEGO ADMINISTRATORA')</script>");
                
            }
            else
            {   
                try
                {
                    con.Open();
                
                    string cmdUsunAdmina = "DELETE FROM administratorzy WHERE id=" + (string)Session["IdAdmin"] + ";";
                    SqlCommand cmd = new SqlCommand(cmdUsunAdmina, con);
                    cmd.ExecuteNonQuery();

                    con.Close();
                    GridViewAdmin.DataBind();  

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                Session["IdAdmin"] = "0";
            }
            Session["IdAdmin"] = "0";
        }

        protected void ButtonUsunKlienta_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(Session["IdKlient"]);
			int b = Convert.ToInt32(Session["IdKonta"]);
           
            if (a == 0 || b ==0)
            {
                Response.Write("<script>alert ('NIE WYBRANO ŻADNEGO KLIENTA')</script>");

            }
            else
            {
                //try
                //{
                    con.Open();
                    string cmdUsunKlienta = "DELETE FROM klienci WHERE id=" + (string)Session["IdKlient"] + ";";
                    SqlCommand cmd = new SqlCommand(cmdUsunKlienta, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    con.Open();
                    string cmdUsunKonto = "DELETE FROM konta WHERE idKonta=" + (string)Session["IdKonta"] + ";";
					SqlCommand cmd1 = new SqlCommand(cmdUsunKonto, con);
					cmd1.ExecuteNonQuery();
                    con.Close();
                    GridViewKlient.DataBind();
                   

              //  }
             //   catch (Exception ex)
              //  {
               //     Response.Write(ex.Message);
               // }
                Session["IdKlient"] = "0";
				Session["IdKonta"] = "0";
            }
            Session["IdKlient"] = "0";
			Session["IdKonta"] = "0";
        }

    }
}