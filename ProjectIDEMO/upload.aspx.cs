using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectIDEMO
{
    public partial class upload : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentFundConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        string type;
        string filename;
        string fundtypes;
        int fsize;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                GridDisplayFile();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            fundtypes = optFundtype.SelectedValue;
            doctype();
            
            if (FileUpload1.HasFile)
            {
                try
                {
                    filename = Path.GetFileName(FileUpload1.FileName);
                    fsize = FileUpload1.PostedFile.ContentLength;
                    FileUpload1.SaveAs(Server.MapPath("~/uploadfile////" + filename));
                    //FileUpload1.SaveAs(Server.MapPath("c: \\users\\5730213008\\documents\\visual studio 2015\\Projects\\ProjectIDEMO\\ProjectIDEMO\\uploadfile\\") + filename);
                    lberror.Text = "Upload status: File uploaded!";
                    InsertFile();
                    
                }

                catch (Exception ex)
                {
                    lberror.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }

        private void InsertFile()
        {
            con.Open();
            cmd = new SqlCommand("INSERT INTO FileDetials(name,filedescription,doc_type,fund_type,size) VALUES('" + filename + "','" + txtdes.Text + "','" + type + "','" + fundtypes + "','" +fsize/1024+ "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            GridDisplayFile();
        }

        private void GridDisplayFile()
        {
            con.Open();
            cmd = new SqlCommand("SELECT * FROM FileDetials",con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            else
            {
                lberror.Text = "Nothing to availible";
            }
        }

        public void doctype()
        {

            if (ddldoctype.SelectedIndex == 1)
            {
                type = ddldoctype.SelectedItem.Text;
            }
            else if (ddldoctype.SelectedIndex == 2)
            {
                type = ddldoctype.SelectedItem.Text;
            }
        }
    }
}
