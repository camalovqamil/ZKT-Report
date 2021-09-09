using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NormalUser : System.Web.UI.Page
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
        //Button1.Text = GridView1.Rows[0].Cells[0].Text + " " + Convert.ToDateTime(TextBox1.Text) + "-----" + Convert.ToDateTime(TextBox1.Text).AddDays(1);
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            GridView1.Rows[i].Cells[5].Text = "";
            GridView1.Rows[i].Cells[6].Text = "";
            GridView1.Rows[i].Cells[5].BackColor = System.Drawing.Color.White;
            GridView1.Rows[i].Cells[6].BackColor = System.Drawing.Color.White;

            baglan();
            komut.Connection = baglanti;
            komut.CommandText = "Select *from CHECKINOUT where USERID='" + Convert.ToInt32(GridView1.Rows[i].Cells[0].Text) + "' and CHECKTIME >= '"+(TextBox1.Text).ToString()+ "' and  CHECKTIME < '" + TextBox2.Text.ToString()+ "'";
            IDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                //Button1.Text =Convert.ToDateTime( Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()).ToString();



                if (Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) <= Convert.ToDateTime(GridView1.Rows[i].Cells[3].Text).AddMinutes(120))
                {
                    GridView1.Rows[i].Cells[5].Text = Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString();
                    //GridView1.Rows[i].Cells[5].Text = dr["CHECKTIME"].ToString();
                }

                if (Convert.ToDateTime(Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString()) >= Convert.ToDateTime(GridView1.Rows[i].Cells[4].Text).AddMinutes(-360))
                {
                    GridView1.Rows[i].Cells[6].Text = Convert.ToDateTime(dr["CHECKTIME"].ToString()).ToLongTimeString();
                    //GridView1.Rows[i].Cells[6].Text = dr["CHECKTIME"].ToString();
                }

                if (GridView1.Rows[i].Cells[5].Text.Length > 0)
                { 
                    if (Convert.ToDateTime(GridView1.Rows[i].Cells[3].Text) > Convert.ToDateTime(GridView1.Rows[i].Cells[5].Text))
                    {
                        GridView1.Rows[i].Cells[5].BackColor = System.Drawing.Color.Green;
                        GridView1.Rows[i].Cells[5].ForeColor = System.Drawing.Color.White;

                    }
                    else
                    {
                        GridView1.Rows[i].Cells[5].ForeColor = System.Drawing.Color.White;
                        GridView1.Rows[i].Cells[5].BackColor = System.Drawing.Color.Red;
                    }
            }


                if (GridView1.Rows[i].Cells[6].Text.Length > 0)
                {
                    if (Convert.ToDateTime(GridView1.Rows[i].Cells[4].Text) < Convert.ToDateTime(GridView1.Rows[i].Cells[6].Text))
                    {
                        GridView1.Rows[i].Cells[6].BackColor = System.Drawing.Color.Green;
                        GridView1.Rows[i].Cells[6].ForeColor = System.Drawing.Color.White;

                    }
                    else
                    {
                        GridView1.Rows[i].Cells[6].ForeColor = System.Drawing.Color.White;
                        GridView1.Rows[i].Cells[6].BackColor = System.Drawing.Color.Red;
                    }
                }

            }

        }
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        for (int i=0; i<GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[2].Text == "M")
            {
                GridView1.Rows[i].Cells[2].Text = "Kişi";
            }
            if (GridView1.Rows[i].Cells[2].Text == "F")
            {
                GridView1.Rows[i].Cells[2].Text = "Qadın";
            }


        }
    }
}