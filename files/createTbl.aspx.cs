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
    public partial class createTbl : System.Web.UI.Page
    {

        string conString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("login.aspx");
                }

                drpFills();
            }

        }

        // Multiview Create / Select Table Switches
        protected void drpCreateSelectSwt_SelectedIndexChanged(object sender, EventArgs e)
        {
            int item = Convert.ToInt32(drpCreateSelectSwt.SelectedValue);
            mltCreate_Select_Tbl.ActiveViewIndex = item;

            if (item == 0)
            {
                drpSelectTbl.SelectedIndex = 0; // 2
                drpDelTbl.SelectedIndex = 0; // 3
                gvClear();

            }
            else if (item == 1)
            {
                txtCreateTbl.Text = ""; // 1
                drpDelTbl.SelectedIndex = 0; // 3
                gvClear();
            }
            else if (item == 2)
            {
                txtCreateTbl.Text = ""; // 1 
                drpSelectTbl.SelectedIndex = 0; // 2
                gvClear();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('AN error ocuured');", true);
            }

        }

        // Multiview Col Edit Switches 
        protected void drpColEditSwt_SelectedIndexChanged(object sender, EventArgs e)
        {
            int item = Convert.ToInt32(drpColEditSwt.SelectedValue);
            mltColEdit.ActiveViewIndex = item;
            if (item == 0) 
            {
                txtDelCol.Text = ""; // 2
                
                txtDelConstrain.Text = ""; // 4
            }
            else if (item == 1)
            {
                txtColName.Text = ""; // 1
                drpColDatatype.SelectedIndex = 0; // 1
               
                txtDelConstrain.Text = ""; // 4
            }
            else if (item == 2)
            {
                txtColName.Text = ""; // 1
                drpColDatatype.SelectedIndex = 0; // 1
                txtDelCol.Text = ""; // 2
                txtDelConstrain.Text = ""; // 4
            }
            else if(item == 3)
            {
                txtColName.Text = ""; // 1
                drpColDatatype.SelectedIndex = 0; // 1
                txtDelCol.Text = ""; // 2
                
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('AN error ocuured');", true);
            }
        }

        // Multiview Select Table Preview Or Details

        protected void drpTblShow_SelectedIndexChanged(object sender, EventArgs e)
        {
            mltTbl.ActiveViewIndex = Convert.ToInt32(drpTblShow.SelectedValue);
        }


        // Create Table btn
        protected void btnCreateTbl_Click(object sender, EventArgs e)
        {
            string tblName = txtCreateTbl.Text.Trim();
            createTable(tblName);
        }

        // Select Table btn
        protected void btnSelectTbl_Click(object sender, EventArgs e)
        {
            string tblName = (drpSelectTbl.SelectedIndex != 0) ? drpSelectTbl.SelectedItem.Text.Trim() : null;
            if (tblName != null)
            {
                gvFill(tblName);
            }
            else
            {
                gvClear();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Please Select Table Name');", true);
            }
        }

        // Delete Table btn
        protected void btnDelTbl_Click(object sender, EventArgs e)
        {
            string tblName = (drpDelTbl.SelectedIndex != 0) ? drpDelTbl.SelectedItem.Text.Trim() : null;
            if (tblName != null)
            {
                delTbl(tblName);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Please Select Table Name');", true);
            }
        }

        // Add Column btn
        protected void btnAddCol_Click(object sender, EventArgs e)
        {
            string tblName = getTblName();
            string colName = txtColName.Text.Trim();
            string dataType = drpColDatatype.SelectedItem.Value.Trim();
            string constraint = drpColConstraint.SelectedItem.Value.Trim();

            addCol(tblName, colName, dataType, constraint);
        }

        // Delete Column btn
        protected void btnDelCol_Click(object sender, EventArgs e)
        {
            string tblName = getTblName();
            string colName = txtDelCol.Text.Trim();

            delCol(tblName, colName);

        }

        // Select Constrain Dropdown { Specially for primary and forigen keies }
        protected void drpColConstrain_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        // Add Constrain btn
        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }

        // SQL Cammond run btn 
        protected void sqlCommandRunBtn_Click(object sender, EventArgs e)
        {
            string query = sqlTxt.Text.Trim();
            runSqlCommand(query);
        }

        // =====================  User Define Functions =======================================

        // Get Table Name
        protected string getTblName()
        {
            string tblName;
            if (drpCreateSelectSwt.SelectedIndex == 0)
            {
                tblName = txtCreateTbl.Text.Trim();
            }
            else if (drpCreateSelectSwt.SelectedIndex == 1)
            {
                tblName = drpSelectTbl.SelectedItem.Text.Trim();
            }
            else if(drpCreateSelectSwt.SelectedIndex == 2)
            {
                tblName = drpDelTbl.SelectedItem.Text.Trim();
            }
            else
            {
                tblName = null;
            }
            return tblName;
        }

        // Create Table 
        protected void createTable(string tblName)
        {
            if (!string.IsNullOrEmpty(tblName))
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        string query = $"CREATE TABLE [{tblName}] (ID INT IDENTITY(1,1))";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.ExecuteNonQuery();
                        drpFills();
                        gvFill(tblName);

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "alert('Table Created Successfully');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('{ex.Message}');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Please Enter Table Name');", true);
            }
        }

        // Delete Table

        protected void delTbl(string tblName)
        {
            if (drpDelTbl.SelectedIndex != 0)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        string query = $"DROP TABLE [{tblName}]";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.ExecuteNonQuery();
                        drpFills();

                        gvClear();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "alert('Table Deleted Successfully');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('{ex.Message}');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Please Select Table Name');", true);
            }
        }

        // Add Column
        protected void addCol(string tblName, string colName, string dataType, string constraint)
        {
            if (!string.IsNullOrEmpty(colName) && !string.IsNullOrEmpty(dataType))
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        string query = $"ALTER TABLE [{tblName}] ADD [{colName}] {dataType} {constraint}";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.ExecuteNonQuery();
                        gvFill(tblName);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "alert('Column Added Successfully');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('{ex.Message}');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Please Enter Column Name and Select Data Type');", true);
            }
        }

        // Delete Column
        protected void delCol(string tblName, string colName)
        {
            if (!string.IsNullOrEmpty(colName) && !string.IsNullOrEmpty(tblName))
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        string query = $"ALTER TABLE [{tblName}] DROP COLUMN [{colName}]";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.ExecuteNonQuery();
                        gvFill(tblName);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "alert('Column Deleted Successfully');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('{ex.Message}');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Please Enter Column Name');", true);
            }
        }

        // Add Constrain

        // Run SQL Command 

        protected void runSqlCommand(string query)
        {
            try
            {
                if (!string.IsNullOrEmpty(query)) 
                { 
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(query, con);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        tblPreview.DataSource = dt;
                        tblPreview.DataBind();


                        ScriptManager.RegisterStartupScript(this, this.GetType(), "message", $"alert('Code run successfully');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "message", $"alert('First write command :)');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('{ex.Message}');", true);
            }
        }



        // Fill Dropdowns
        protected void drpFills()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);


                    drpSelectTbl.DataSource = dt;
                    drpSelectTbl.DataTextField = "TABLE_NAME";
                    drpSelectTbl.DataValueField = "TABLE_NAME";
                    drpSelectTbl.DataBind();

                    drpDelTbl.DataSource = dt;
                    drpDelTbl.DataTextField = "TABLE_NAME";
                    drpDelTbl.DataValueField = "TABLE_NAME";
                    drpDelTbl.DataBind();

                    drpSelectTbl.Items.Insert(0, new ListItem("-- Select --", "0"));
                    drpDelTbl.Items.Insert(0, new ListItem("-- Select --", "0"));
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
        }

        // Fill Grid View

        protected void gvFill(string tblName)
        {
            if (tblName != null)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        string query = $"SELECT * FROM [{tblName}]";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        tblPreview.DataSource = dt;
                        tblPreview.DataBind();

                        string query2 = $@"SELECT 
                                            c.COLUMN_NAME AS [Column name], 
                                            c.DATA_TYPE AS [Data type], 
                                            tc.CONSTRAINT_TYPE AS [Constraint],
                                            kcu.CONSTRAINT_NAME AS [Constraint name],
                                            c.IS_NULLABLE AS [Is null], 
                                            c.CHARACTER_MAXIMUM_LENGTH AS [Character Maximum length]
                                        FROM INFORMATION_SCHEMA.COLUMNS c
                                        LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu 
                                            ON c.TABLE_NAME = kcu.TABLE_NAME 
                                            AND c.COLUMN_NAME = kcu.COLUMN_NAME
                                        LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc 
                                            ON kcu.CONSTRAINT_NAME = tc.CONSTRAINT_NAME
                                            AND kcu.TABLE_NAME = tc.TABLE_NAME
                                        WHERE c.TABLE_NAME = '{tblName}'";

                        SqlCommand cmd2 = new SqlCommand(query2, con);
                        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                        DataTable dt2 = new DataTable();
                        da2.Fill(dt2);
                        tblSchema.DataSource = dt2;
                        tblSchema.DataBind();

                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('{ex.Message}')</script>");
                }
            }
            else
            {
                gvClear();
            }
        }

        protected void gvClear()
        {
            tblPreview.DataSource = null;
            tblPreview.DataBind();

            tblSchema.DataSource = null;
            tblSchema.DataBind();
        }

    
    }
}