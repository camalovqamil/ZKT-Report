using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class AddGraph : System.Web.UI.Page
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

    public void OnConfirm(object sender, EventArgs e)
    {
        Session["TimeDeleteOid"] = (sender as LinkButton).CommandArgument.ToString();

        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Delete GroupDaysPlanTime where GroupDaysPlanTimeOid = '" + Session["TimeDeleteOid"].ToString() + "'";
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

    protected void GridView2_DataBound(object sender, EventArgs e)
    {
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvrow in GridView1.Rows)
        {
            var checkbox = gvrow.FindControl("WorkerID") as CheckBox;
            if (checkbox.Checked)
            {
                baglan();
                komut.Connection = baglanti;
                komut.CommandText = "insert into GroupDaysPlanTime(GroupDaysPlanOid, StartDays, StartTime, EndDays, EndTime, StartIn, StartOut, EndIn, EndOut, UserId, StartNote, EndNote) values('" + Session["PlanOid"].ToString() + "', '"+TxtStartDays.Text+ "', '" + txtStartTime.Text + "', '" + TxtEndDays.Text + "', '" + TxtEndTime.Text + "', '" + TxtStartIn.Text + "', '" + TxtStartOut.Text + "', '" + TxtEndIn.Text + "', '" + TxtEndOut.Text + "', '" + Convert.ToInt32(checkbox.Text) + "', N'"+DrpStartNote.Text+"', N'"+DrpEndNote.Text+"' )";
                komut.ExecuteNonQuery();
                komut.Dispose();
            }
        }
        Button2.Enabled = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.ToString());
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Button2.Enabled = true;
    }
}