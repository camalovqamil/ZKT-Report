using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USERTIME : System.Web.UI.Page
{

    SqlConnection baglanti = new SqlConnection(ConfigurationManager.ConnectionStrings["IshCedveliConnectionString"].ConnectionString);
    SqlCommand komut = new SqlCommand();

    void baglan()
    {
        if (baglanti.State == ConnectionState.Closed)
        {
            baglanti.Open();
        }
        else
        {
            baglanti.Close();
            baglanti.Open();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.Text == "1")
        {
            NormalTimeVoid();
        }
    }

    void NormalTimeVoid()
    {
        foreach (GridViewRow gvrow in GridView1.Rows)
        {
            var checkbox = gvrow.FindControl("USERID") as CheckBox;
            if (checkbox.Checked==true)
            {
                baglan();
                komut.Connection = baglanti;
                komut.CommandText = "delete UserStartEndTime  where USERID='" + checkbox.Text + "'";
                komut.ExecuteNonQuery();
                komut.Dispose();


                baglan();
                komut.Connection = baglanti;
                komut.CommandText = "Insert into UserStartEndTime(USERID, StartTime ,EndTime) values ('" + checkbox.Text + "', '" + TxtStart.Text + "', '" + TxtEnd.Text + "')";
                komut.ExecuteNonQuery();
                komut.Dispose();
            }
        }
    }
}