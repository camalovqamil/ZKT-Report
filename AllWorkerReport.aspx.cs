using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AllWorkerReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        for(int i=0; i<GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[2].Text.Length < 3)
            {
                GridView1.Rows[i].Visible = false;
            }

            if(GridView1.Rows[i].Cells[4].Text=="F")
            {
                GridView1.Rows[i].Cells[4].Text = "Qadın";
            }

            if (GridView1.Rows[i].Cells[4].Text == "M")
            {
                GridView1.Rows[i].Cells[4].Text = "Kişi";
            }

            if (GridView1.Rows[i].Cells[4].Text != "Qadın" && GridView1.Rows[i].Cells[4].Text != "Kişi")
            {
                GridView1.Rows[i].Cells[4].Text = "Seçilməyib";
            }


            GridView1.Rows[i].Cells[3].Text =Convert.ToDateTime( GridView1.Rows[i].Cells[3].Text).ToString("dd.MM.yyyy hh:MM:ss");

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}