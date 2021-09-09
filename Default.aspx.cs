using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    DateTime Ferq;
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        for(int i=0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[1].Text.Length < 3)
            {
                GridView1.Rows[i].Visible = false;
            }

            if (i < GridView1.Rows.Count-1)
            {
                if (GridView1.Rows[i].Cells[3].Text == GridView1.Rows[i + 1].Cells[3].Text)
                {
                    //GridView1.Rows[i].BackColor = System.Drawing.Color.Green;
                    //GridView1.Rows[i + 1].BackColor = System.Drawing.Color.Red;

                    //GridView1.Rows[i].ForeColor = System.Drawing.Color.White;
                    //GridView1.Rows[i + 1].ForeColor = System.Drawing.Color.White;

                    DateTime bTarih = Convert.ToDateTime(GridView1.Rows[i+1].Cells[0].Text);
                    DateTime kTarih = Convert.ToDateTime(GridView1.Rows[i].Cells[0].Text);
                    TimeSpan Sonuc = bTarih - kTarih;
                    GridView1.Rows[i + 1].Cells[2].Text = "İş müddəti: " + Sonuc.ToString();
                    //Sonuc.TotalHours.ToString().Substring(0,1) + " saat - " + Sonuc.TotalMinutes.ToString().Substring(0, 1) + " dəq - " + Sonuc.TotalSeconds.ToString().Substring(0, 1)+" san";


                    if (Sonuc.TotalMinutes > 2)
                    {
                        GridView1.Rows[i].BackColor = System.Drawing.Color.Green;
                        GridView1.Rows[i + 1].BackColor = System.Drawing.Color.Red;

                        GridView1.Rows[i].ForeColor = System.Drawing.Color.White;
                        GridView1.Rows[i + 1].ForeColor = System.Drawing.Color.White;
                    }

                    if (Sonuc.TotalMinutes<=2)
                    {
                        
                        GridView1.Rows[i+1].BackColor = System.Drawing.Color.Yellow;
                        GridView1.Rows[i+1].ForeColor = System.Drawing.Color.Black;
                    }

                    
                }
            }
        }
    }
}