using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aplikaccja
{
    public partial class dodaj_status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.Insert();
                Response.Redirect("dodaj_status.aspx");
            }
            catch(System.Data.SqlClient.SqlException)
            {
                Label1.Visible = true;
                Label1.Text = "Status projektu: " + TextBox1.Text + "został już dodany!!!";
                Response.Write("Status projektu: " + TextBox1.Text + "został już dodany!!!");
            }
            
        }
    }
}