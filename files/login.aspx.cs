using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SQL_GUI.files
{
    public partial class login1 : System.Web.UI.Page
    {
        string conString = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string userName = txtUsername.Text.Trim();
                string password = txtPass.Text.Trim();

                if (!string.IsNullOrWhiteSpace(userName) && !string.IsNullOrWhiteSpace(password))
                {
                    SqlConnection con = new SqlConnection(conString);
                    con.Open();
                    string query = "SELECT * FROM admin WHERE user_name COLLATE Latin1_General_CS_AS = @Username  AND password COLLATE Latin1_General_CS_AS = @Password";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Username", userName);
                    cmd.Parameters.AddWithValue("@Password", password);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count == 1)
                    {
                        Session["Username"] = userName;
                        Response.Redirect("~/files/default.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password.";
                    }
                    con.Close();
                }
                else
                {
                    lblMessage.Text = "Please fill the fields.";
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}