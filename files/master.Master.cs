using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQL_GUI.files
{
    public partial class master : System.Web.UI.MasterPage
    {

        string conString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            tblRpt_fill();
        }

        protected void tblRpt_fill()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = $"SELECT name AS [Table Name] FROM sys.tables ORDER BY name;";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                tblRpt.DataSource = dt;
                tblRpt.DataBind();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("~/files/default.aspx"  );
        }
    }
}