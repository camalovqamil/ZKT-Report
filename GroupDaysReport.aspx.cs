using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class GroupDaysReport : System.Web.UI.Page
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

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text.Length > 9 && TextBox2.Text.Length > 9)
        {
            Button1.Enabled = true;
        }
        else
        {
            Button1.Enabled = false;
        }

        //Button1.Text = Convert.ToDateTime(TextBox1.Text).AddDays(1).ToString("dd.MM.yyyy");
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text.Length > 9 && TextBox2.Text.Length > 9)
        {
            Button1.Enabled = true;
        }
        else
        {
            Button1.Enabled = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GroupDataVoid();
        GroupDataVoid2();
        Button1.Enabled = false;
        TextBox1.Enabled = false;
        TextBox2.Enabled = false;
        DropDownList1.Enabled = false;
        DropDownList2.Enabled = false;
    }

    void GroupDataVoid()
    {
        DataTable dt = new DataTable();
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from GroupDaysReportView where DaysGroupOid='" + DropDownList1.Text + "'and GroupPlanOid='"+DropDownList2.Text+ "' and StartDays='" + TextBox1.Text + "' order by StartTime";
        SqlDataAdapter dr = new SqlDataAdapter(komut);
        dr.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    void GroupDataVoid2()
    {
        DataTable dt = new DataTable();
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from GroupDaysReportView where DaysGroupOid='" + DropDownList1.Text + "'and GroupPlanOid='" + DropDownList2.Text + "' and EndDays='" + TextBox1.Text + "' order by EndTime";
        SqlDataAdapter dr = new SqlDataAdapter(komut);
        dr.Fill(dt);
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            GridView1.Rows[i].Cells[6].Text = "";

            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Select *from UserInOutView where CHECKTIME>='" + TextBox1.Text + "' and CHECKTIME<='" + TextBox2.Text + "' and USERID='" + Convert.ToInt32(GridView1.Rows[i].Cells[0].Text) + "'";
            IDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                if (Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) >= Convert.ToDateTime(GridView1.Rows[i].Cells[4].Text) && Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) <= Convert.ToDateTime(GridView1.Rows[i].Cells[5].Text))
                {
                    GridView1.Rows[i].Cells[6].Text = Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToString("HH:mm:ss");
                }
            }


            if (GridView1.Rows[i].Cells[6].Text.Length > 0)
            {
                if (Convert.ToDateTime(GridView1.Rows[i].Cells[6].Text) <= Convert.ToDateTime(GridView1.Rows[i].Cells[3].Text))
                {
                    GridView1.Rows[i].Cells[6].BackColor = System.Drawing.Color.Green;
                }
                else
                {
                    GridView1.Rows[i].Cells[6].BackColor = System.Drawing.Color.Red;
                }

                GridView1.Rows[i].Cells[6].ForeColor = System.Drawing.Color.White;
            }

            else
            {
                GridView1.Rows[i].Cells[6].BackColor = System.Drawing.Color.Yellow;
            }

        }
        GridView1.Columns[2].Visible = false;
        GridView1.Columns[5].Visible = false;
        GridView1.Columns[4].Visible = false;

    }

    protected void GridView2_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {

            GridView2.Rows[i].Cells[6].Text = "";

            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Select *from UserInOutView where CHECKTIME>='" + TextBox1.Text + "' and CHECKTIME<='" + TextBox2.Text + "' and USERID='" + Convert.ToInt32(GridView2.Rows[i].Cells[0].Text) + "'";
            IDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                if (Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) >= Convert.ToDateTime(GridView2.Rows[i].Cells[4].Text) && Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) <= Convert.ToDateTime(GridView2.Rows[i].Cells[5].Text))
                {
                    GridView2.Rows[i].Cells[6].Text = Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToString("HH:mm:ss");
                }
            }


            if (GridView2.Rows[i].Cells[6].Text.Length > 0)
            {
                if (Convert.ToDateTime(GridView2.Rows[i].Cells[6].Text) >= Convert.ToDateTime(GridView2.Rows[i].Cells[3].Text))
                {
                    GridView2.Rows[i].Cells[6].BackColor = System.Drawing.Color.Green;
                }
                else
                {
                    GridView2.Rows[i].Cells[6].BackColor = System.Drawing.Color.Red;
                }

                GridView2.Rows[i].Cells[6].ForeColor = System.Drawing.Color.White;
            }

            else
            {
                GridView2.Rows[i].Cells[6].BackColor = System.Drawing.Color.Yellow;
            }

        }
        GridView2.Columns[2].Visible = false;
        GridView2.Columns[5].Visible = false;
        GridView2.Columns[4].Visible = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.ToString());
    }
}