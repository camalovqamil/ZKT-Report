using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Groups : System.Web.UI.Page
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
        Session["GroupDeleteOid"] = (sender as LinkButton).CommandArgument.ToString();

        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Delete GroupS where GroupOid = '" + Session["GroupDeleteOid"].ToString() + "'";
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
    protected void Detal_Click(object sender, EventArgs e)
    {
        Session["GroupsOidUpdate"] = (sender as LinkButton).CommandArgument.ToString();
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from Groups where GroupOid='" + (sender as LinkButton).CommandArgument.ToString() + "'";
        IDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            TextBox1.Text = dr["GroupName"].ToString();
            Button3.Enabled = true;
            Button1.Enabled = false;
            
        }
        Panel2.GroupingText = "Qrup: " + (sender as LinkButton).Text + " - Məlumatları";
        Panel3.GroupingText = "Qrup: " + (sender as LinkButton).Text + " - İşçiləri";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "insert into Groups (GroupName) values(N'" + TextBox1.Text + "')";
        komut.ExecuteNonQuery();
        komut.Dispose();
        Button1.Enabled = false;
        Page.Response.Redirect(Page.Request.Url.ToString());
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.ToString());
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Update Groups set GroupName =N'" + TextBox1.Text + "' where GroupOid ='"+ Session["GroupsOidUpdate"].ToString()+"'";
        komut.ExecuteNonQuery();
        komut.Dispose();
        Button3.Enabled = false;
    }

    protected void GroupAddWorker_Click(object sender, EventArgs e)
    {
        Session["GroupAddWorker"] = (sender as LinkButton).CommandArgument;
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from Groups where GroupOid='" + (sender as LinkButton).CommandArgument + "'";
        IDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            Session["SelectGroupname"] = dr["GroupName"].ToString();
        }
        Response.Redirect("GroupWorker.aspx");
    }

    protected void GroupParametr_Click(object sender, EventArgs e)
    {
        Response.Redirect("GroupsTime.aspx");
    }

    protected void WorkerNote_Click(object sender, EventArgs e)
    {
        Session["WorkerNoteID"] = (sender as LinkButton).CommandArgument;
        Response.Redirect("GroupWorkerNote.aspx");
    }
}