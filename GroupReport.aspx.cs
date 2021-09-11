using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GroupReport : System.Web.UI.Page
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
        //TextBox2.TextMode = TextBoxMode.SingleLine;
        //TextBox2.Text = (Convert.ToDateTime(TextBox1.Text).AddDays(1)).ToShortDateString();
        if(TextBox1.Text.Length>9 && TextBox2.Text.Length > 9)
        {
            Button1.Enabled = true;
        }
        else
        {
            Button1.Enabled = false;
        }
    }

    int Days;
    protected void Button1_Click(object sender, EventArgs e)
    {
        Days = ((int)Convert.ToDateTime(TextBox1.Text).DayOfWeek);
        GroupDataVoid();
        DropDownList1.Enabled = false;
        Button1.Enabled = false;
        TextBox1.Enabled = false;
        TextBox2.Enabled = false;
    }

    void ReportData()
    {
        

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            GridView1.Rows[i].Cells[10].Text = "";
            GridView1.Rows[i].Cells[9].Text = "";

            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Select *from UserInOutView where CHECKTIME>='" + TextBox1.Text + "' and CHECKTIME<='" + TextBox2.Text + "' and USERID='" + Convert.ToInt32(GridView1.Rows[i].Cells[0].Text)+"'";
            IDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                if (Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) >= Convert.ToDateTime(GridView1.Rows[i].Cells[5].Text) && Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) <= Convert.ToDateTime(GridView1.Rows[i].Cells[6].Text))
                {
                    GridView1.Rows[i].Cells[9].Text = Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToString();
                }

                if (Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) >= Convert.ToDateTime(GridView1.Rows[i].Cells[7].Text) && Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) <= Convert.ToDateTime(GridView1.Rows[i].Cells[8].Text))
                {
                    GridView1.Rows[i].Cells[10].Text = Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToString();
                }
            }
        }
    }

    void GroupDataVoid()
    {
        DataTable dt = new DataTable();
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from GroupReportView where GroupOid='"+DropDownList1.Text+"' and Days='"+Days+"'";
        SqlDataAdapter dr = new SqlDataAdapter(komut);
        dr.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        GridView1.Columns[5].Visible = true;
        GridView1.Columns[6].Visible = true;
        GridView1.Columns[7].Visible = true;
        GridView1.Columns[8].Visible = true;

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[2].Text == "1")
            {
                GridView1.Rows[i].Cells[2].Text = "Bazar ertəsi";
            }

            if (GridView1.Rows[i].Cells[2].Text == "2")
            {
                GridView1.Rows[i].Cells[2].Text = "Çərşənbə axşamı";
            }

            if (GridView1.Rows[i].Cells[2].Text == "3")
            {
                GridView1.Rows[i].Cells[2].Text = "Çərşənbə";
            }

            if (GridView1.Rows[i].Cells[2].Text == "4")
            {
                GridView1.Rows[i].Cells[2].Text = "Cümə axşamı";
            }

            if (GridView1.Rows[i].Cells[2].Text == "5")
            {
                GridView1.Rows[i].Cells[2].Text = "Cümə";
            }

            if (GridView1.Rows[i].Cells[2].Text == "6")
            {
                GridView1.Rows[i].Cells[2].Text = "Şənbə";
            }

            if (GridView1.Rows[i].Cells[2].Text == "7")
            {
                GridView1.Rows[i].Cells[2].Text = "Bazar";
            }
        }


        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Select *from GroupNoteView where GroupOid='" + DropDownList1.Text+ "' and TimeData='"+TextBox1.Text+ "' and UserID='"+Convert.ToInt32( GridView1.Rows[i].Cells[0].Text)+"'";
            IDataReader dr2 = komut.ExecuteReader();
            while (dr2.Read())
            {
                GridView1.Rows[i].Cells[13].Text = dr2["Note"].ToString();
            }
            komut.Dispose();



            GridView1.Rows[i].Cells[10].Text = "";
            GridView1.Rows[i].Cells[9].Text = "";

            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Select *from UserInOutView where CHECKTIME>='" + TextBox1.Text + "' and CHECKTIME<='" + TextBox2.Text + "' and USERID='" + Convert.ToInt32(GridView1.Rows[i].Cells[0].Text) + "'";
            IDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                if (Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) >= Convert.ToDateTime(GridView1.Rows[i].Cells[5].Text) && Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) <= Convert.ToDateTime(GridView1.Rows[i].Cells[6].Text))
                {
                    GridView1.Rows[i].Cells[9].Text = Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToString("HH:mm:ss");
                }

                if (Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) >= Convert.ToDateTime(GridView1.Rows[i].Cells[7].Text) && Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) <= Convert.ToDateTime(GridView1.Rows[i].Cells[8].Text))
                {
                    GridView1.Rows[i].Cells[10].Text = Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToString("HH:mm:ss");
                }
            }
            

            if (GridView1.Rows[i].Cells[9].Text.Length > 0)
            {
                if (Convert.ToDateTime(GridView1.Rows[i].Cells[9].Text) <= Convert.ToDateTime(GridView1.Rows[i].Cells[3].Text))
                {
                    GridView1.Rows[i].Cells[9].BackColor = System.Drawing.Color.Green;
                }
                else
                {
                    GridView1.Rows[i].Cells[9].BackColor = System.Drawing.Color.Red;
                }

                TimeSpan StartDifference = Convert.ToDateTime(GridView1.Rows[i].Cells[3].Text) - Convert.ToDateTime(GridView1.Rows[i].Cells[9].Text);

                GridView1.Rows[i].Cells[11].Text = StartDifference.ToString();

                GridView1.Rows[i].Cells[9].ForeColor = System.Drawing.Color.White;
            }

            else
            {
                GridView1.Rows[i].Cells[9].BackColor = System.Drawing.Color.Yellow;
            }


            if (GridView1.Rows[i].Cells[10].Text.Length > 0)
            {
                if (Convert.ToDateTime(GridView1.Rows[i].Cells[10].Text) >= Convert.ToDateTime(GridView1.Rows[i].Cells[4].Text))
                {
                    GridView1.Rows[i].Cells[10].BackColor = System.Drawing.Color.Green;
                }
                else
                {
                    GridView1.Rows[i].Cells[10].BackColor = System.Drawing.Color.Red;
                }

                TimeSpan EndDifference = Convert.ToDateTime(GridView1.Rows[i].Cells[10].Text) - Convert.ToDateTime(GridView1.Rows[i].Cells[4].Text);

                GridView1.Rows[i].Cells[12].Text = EndDifference.ToString();
            }
            else
            {
                GridView1.Rows[i].Cells[10].BackColor = System.Drawing.Color.Yellow;
            }

            GridView1.Rows[i].Cells[10].ForeColor = System.Drawing.Color.White;

        }

        GridView1.Columns[5].Visible = false;
        GridView1.Columns[6].Visible = false;
        GridView1.Columns[7].Visible = false;
        GridView1.Columns[8].Visible = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.ToString());
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
}