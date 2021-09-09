using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class GroupsTime : System.Web.UI.Page
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

    protected void Detal_Click(object sender, EventArgs e)
    {
        Session["GroupDetal"] = (sender as LinkButton).CommandArgument;
        Panel2.GroupingText= "Qrup: "+(sender as LinkButton).Text;

        Panel3.GroupingText = "Qrup: " + (sender as LinkButton).Text+" - Yeni parametr(və ya düzəliş)";
    }

    protected void GridView2_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            if (GridView2.Rows[i].Cells[2].Text == "1")
            {
                GridView2.Rows[i].Cells[2].Text = "Bazar ertəsi";
            }

            if (GridView2.Rows[i].Cells[2].Text == "2")
            {
                GridView2.Rows[i].Cells[2].Text = "Çərşənbə axşamı";
            }

            if (GridView2.Rows[i].Cells[2].Text == "3")
            {
                GridView2.Rows[i].Cells[2].Text = "Çərşənbə";
            }

            if (GridView2.Rows[i].Cells[2].Text == "4")
            {
                GridView2.Rows[i].Cells[2].Text = "Cümə axşamı";
            }

            if (GridView2.Rows[i].Cells[2].Text == "5")
            {
                GridView2.Rows[i].Cells[2].Text = "Cümə";
            }

            if (GridView2.Rows[i].Cells[2].Text == "6")
            {
                GridView2.Rows[i].Cells[2].Text = "Şənbə";
            }

            if (GridView2.Rows[i].Cells[2].Text == "7")
            {
                GridView2.Rows[i].Cells[2].Text = "Bazar";
            }

            DateTime bTarih = Convert.ToDateTime(GridView2.Rows[i].Cells[4].Text);
            DateTime kTarih = Convert.ToDateTime(GridView2.Rows[i].Cells[3].Text);
            TimeSpan Sonuc = bTarih - kTarih;

            GridView2.Rows[i].Cells[9].Text = Sonuc.ToString();

        }
    }

    protected void Time_Edit_Click(object sender, EventArgs e)
    {
        Session["TimeEditOid"] = (sender as LinkButton).CommandArgument;
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from GroupTime where Timeoid='" + (sender as LinkButton).CommandArgument + "'";
        IDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            DrpDays.SelectedValue = dr["Days"].ToString();
            TxtStartTime.Text = dr["StartTime"].ToString();
            TxtEndTime.Text = dr["EndTime"].ToString();
            TxtSratIn.Text = dr["StartIn"].ToString();
            TxtStartOut.Text = dr["StartOut"].ToString();
            TxtEndTime.Text = dr["EndTime"].ToString();
            TxtEndIn.Text = dr["EndIn"].ToString();
            TxtEndOut.Text = dr["EndOut"].ToString();
            Button1.Enabled = false;
            Button2.Enabled = true;
        }
    }

    protected void Time_Delete_Click(object sender, EventArgs e)
    {

        //OnClientClick = "Confirm()" />

        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked YES!')", true);
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked NO!')", true);
        }
    }

    public void OnConfirm(object sender, EventArgs e)
    {
        Session["TimeDeleteOid"] = (sender as LinkButton).CommandArgument.ToString();

        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Delete GroupTime where TimeOid = '" + Session["TimeDeleteOid"].ToString() + "'";
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

    int SecectGroup;
    protected void Button1_Click(object sender, EventArgs e)
    {
        SecectGroup = 0;
        foreach (GridViewRow gvrow in GridView1.Rows)
        {
            var checkbox = gvrow.FindControl("GroupOid") as CheckBox;
            if (checkbox.Checked)
            {
                SecectGroup++;
            }
        }

        if (SecectGroup > 0 && TxtStartTime.Text.Length > 2 && TxtEndTime.Text.Length > 2 && TxtSratIn.Text.Length > 2 && TxtStartOut.Text.Length > 2 && TxtEndIn.Text.Length > 2 && TxtEndOut.Text.Length > 2)
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("GroupOid") as CheckBox;
                if (checkbox.Checked)
                {
                    baglan();
                    komut.Connection = baglanti;
                    //komut.CommandText = "insert into GroupTime(GrupOid, Days) values('" + checkbox.Text + "', '" + DrpDays.SelectedIndex+1 + "')";
                    komut.CommandText = "insert into GroupTime(GrupOid, Days, StartTime, EndTime, StartIn, StartOut, EndIn, EndOut) values('" + checkbox.Text + "', '" + DrpDays.SelectedValue + "', '" + Convert.ToDateTime(TxtStartTime.Text).ToShortTimeString() + "', '" + Convert.ToDateTime(TxtEndTime.Text).ToShortTimeString() + "', '" + Convert.ToDateTime(TxtSratIn.Text).ToShortTimeString() + "', '" + Convert.ToDateTime(TxtStartOut.Text).ToShortTimeString() + "', '" + Convert.ToDateTime(TxtEndIn.Text).ToShortTimeString() + "', '" + Convert.ToDateTime(TxtEndOut.Text).ToShortTimeString() + "')";
                    komut.ExecuteNonQuery();
                    komut.Dispose();
                }
            }
            Page.Response.Redirect(Page.Request.Url.ToString());
        }
        else
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Bütün xanalrı doldurun (Qrup seçin)')</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Update GroupTime set Days='" + DrpDays.SelectedValue + "', StartTime= '" + Convert.ToDateTime(TxtStartTime.Text).ToShortTimeString() + "', EndTime='" + Convert.ToDateTime(TxtEndTime.Text).ToShortTimeString() + "', StartIn='" + Convert.ToDateTime(TxtSratIn.Text).ToShortTimeString() + "', StartOut='" + Convert.ToDateTime(TxtStartOut.Text).ToShortTimeString() + "', EndIn='" + Convert.ToDateTime(TxtEndIn.Text).ToShortTimeString() + "', EndOut= '" + Convert.ToDateTime(TxtEndOut.Text).ToShortTimeString() + "' where TimeOid='" + Session["TimeEditOid"] .ToString()+ "'";
        komut.ExecuteNonQuery();
        komut.Dispose();
        Page.Response.Redirect(Page.Request.Url.ToString());
    }
}
