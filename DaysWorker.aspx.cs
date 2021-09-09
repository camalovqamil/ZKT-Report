using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class DaysWorker : System.Web.UI.Page
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
            komut.CommandText = "Delete GroupDays where DaysGroupOid = '" + Session["GroupDeleteOid"].ToString() + "'";
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

    public void OnConfirm2(object sender, EventArgs e)
    {
        Session["GroupPlanOid"] = (sender as LinkButton).CommandArgument.ToString();

        string confirmValue = Request.Form["confirm_value"];

        if (confirmValue == "Yes")
        {
            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Delete GroupDaysPlan where GroupPlanOid = '" + Session["GroupPlanOid"].ToString() + "'";
            komut.ExecuteNonQuery();
            komut.Dispose();
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Seçilmiş sətir silindi!')", true);
            Page.Response.Redirect(Page.Request.Url.ToString());
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Seçilmiş sətri silməkdən imtina etdiniz!')", true);
        }
    }

    protected void GroupDaysDetal_Click(object sender, EventArgs e)
    {
        Session["GroupsOidUpdate"] = (sender as LinkButton).CommandArgument.ToString();
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from GroupDays where DaysGroupOid='" + (sender as LinkButton).CommandArgument.ToString() + "'";
        IDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            TextBox1.Text = dr["GroupName"].ToString();
            Button3.Enabled = true;
            Button1.Enabled = false;
        }

        Panel3.GroupingText = (sender as LinkButton).Text + " -Qrupunun planları";
        Panel2.GroupingText = (sender as LinkButton).Text + " - Qrupunun məlumatları";
        Panel4.GroupingText = (sender as LinkButton).Text + " -Qrupuna yeni plan";
    }

    protected void PlanEdit_Click(object sender, EventArgs e)
    {
        Session["PlanEdit"] = (sender as LinkButton).CommandArgument.ToString();
        TextBox2.Text = (sender as LinkButton).Text;
        Button5.Enabled = false;
        Button4.Enabled = true;
        Panel4.GroupingText = (sender as LinkButton).Text + " - Planına düzəliş";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "insert into GroupDays (GroupName) values(N'" + TextBox1.Text + "')";
        komut.ExecuteNonQuery();
        komut.Dispose();
        Button1.Enabled = false;
        Page.Response.Redirect(Page.Request.Url.ToString());
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Update GroupDays set GroupName =N'" + TextBox1.Text + "' where DaysGroupOid ='" + Session["GroupsOidUpdate"].ToString() + "'";
        komut.ExecuteNonQuery();
        komut.Dispose();
        Button3.Enabled = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.ToString());
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        
    }

    protected void GridView3_DataBound(object sender, EventArgs e)
    {
        
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "insert into GroupDaysPlan (PlanName, GroupDaysOid) values(N'" + TextBox2.Text + "','"+ Session["GroupDaysAddPlan"].ToString() + "' )";
        komut.ExecuteNonQuery();
        komut.Dispose();
        Page.Response.Redirect(Page.Request.Url.ToString());
    }

    protected void GroupDaysAddPlan_Click(object sender, EventArgs e)
    {
       
        Session["GroupDaysAddPlan"] = (sender as LinkButton).CommandArgument;
        Button5.Enabled = true;
    }

    protected void GroupDaysPlanDelete_Click(object sender, EventArgs e)
    {

    }

    protected void GroupDaysAddWorker_Click(object sender, EventArgs e)
    {
        Session["GroupAddWorker"] = (sender as LinkButton).CommandArgument;
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from GroupDays where DaysGroupOid='" + (sender as LinkButton).CommandArgument + "'";
        IDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            Session["SelectGroupname"] = dr["GroupName"].ToString();
        }
        Response.Redirect("GroupDayAddWorker.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Update GroupDaysPlan set PlanName =N'" + TextBox2.Text + "' where GroupPlanOid ='" + Session["PlanEdit"].ToString() + "'";
        komut.ExecuteNonQuery();
        komut.Dispose();
        Button4.Enabled = false;
        Page.Response.Redirect(Page.Request.Url.ToString());
    }

    protected void GroupDaysPlanGraph_Click(object sender, EventArgs e)
    {
        Session["PlanOid"] = (sender as LinkButton).CommandArgument;
        Response.Redirect("AddGraph.aspx");
    }
    }