using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
public partial class GroupWorkerNote : System.Web.UI.Page
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
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "insert into GroupsNote(GroupOid, UserID, TimeData, Note) values ('" + Session["GroupsOidUpdate"].ToString() + "', '" + Convert.ToInt32(Session["WorkerNoteID"].ToString()) + "', '" + txtTimeData.Text + "', N'"+TxtNote.Text+"')";
        komut.ExecuteNonQuery();
        komut.Dispose();
        Button1.Enabled = false;
    }

    public void OnConfirm(object sender, EventArgs e)
    {
        Session["NoteDelete"] = (sender as LinkButton).CommandArgument.ToString();

        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Delete GroupsNote where GroupNoteOid = '" + Session["NoteDelete"].ToString() + "'";
            komut.ExecuteNonQuery();
            komut.Dispose();
            Page.Response.Redirect(Page.Request.Url.ToString());
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Seçilmiş sətir silindi!')", true);
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Seçilmiş sətri silməkdən imtina etdiniz!')", true);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.ToString());
    }
}