using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
public partial class Workers : System.Web.UI.Page
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
        Session["USERID"] = (sender as LinkButton).CommandArgument.ToString();

        string confirmValue = Request.Form["confirm_value"];

        if (confirmValue == "Yes")
        {
            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Delete USERINFO where USERID = '" + Session["USERID"].ToString() + "'";
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

    int max;
    protected void Button1_Click(object sender, EventArgs e)
    {
        max = Convert.ToInt32(GridView1.Rows[0].Cells[1].Text);

        for (int i = 1; i < GridView1.Rows.Count; i++)
        {
            if (max < Convert.ToInt32(GridView1.Rows[i].Cells[1].Text))
            {
                max = Convert.ToInt32(GridView1.Rows[i].Cells[1].Text);
            }
        }

        max++;
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Insert into USERINFO(BADGENUMBER, NAME, GENDER) values('" + max.ToString() + "', '" + TextBox1.Text + "', '" + DropDownList1.SelectedValue.ToString() + "')";
        komut.ExecuteNonQuery();
        komut.Dispose();
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            ////if (GridView1.Rows[i].Cells[2].Text.Length < 3)
            ////{
            ////    GridView1.Rows[i].Visible = false;
            ////}

            if (GridView1.Rows[i].Cells[3].Text == "F")
            {
                GridView1.Rows[i].Cells[3].Text = "Qadın";
            }

            if (GridView1.Rows[i].Cells[3].Text == "M")
            {
                GridView1.Rows[i].Cells[3].Text = "Kişi";
            }

            if (GridView1.Rows[i].Cells[3].Text != "Qadın" && GridView1.Rows[i].Cells[3].Text != "Kişi")
            {
                GridView1.Rows[i].Cells[3].Text = "Seçilməyib";
            }

        }
    }

    protected void WorkerEdit_Click(object sender, EventArgs e)
    {
        Button1.Enabled = false;
        Session["EditUserOid"] = (sender as LinkButton).CommandArgument;
        TextBox1.Text = (sender as LinkButton).Text;
        Button3.Enabled = true;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Update USERINFO set NAME=N'" + TextBox1.Text + "', GENDER='" + DropDownList1.SelectedValue.ToString() + "' where USERID='" + Convert.ToUInt32(Session["EditUserOid"].ToString()) + "' ";
        komut.ExecuteNonQuery();
        Button3.Enabled = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.ToString());
    }
}