using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
public partial class GroupWorker : System.Web.UI.Page
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

        Panel2.GroupingText = "Qrup: " + Session["SelectGroupname"].ToString();
     }

    protected void GridView2_DataBound(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            if (GridView2.Rows[i].Cells[0].Text == "1")
            {
                GridView2.Rows[i].Cells[0].Text = "Bazar ertəsi";
            }

            if (GridView2.Rows[i].Cells[0].Text == "2")
            {
                GridView2.Rows[i].Cells[0].Text = "Çərşənbə axşamı";
            }

            if (GridView2.Rows[i].Cells[0].Text == "3")
            {
                GridView2.Rows[i].Cells[0].Text = "Çərşənbə";
            }

            if (GridView2.Rows[i].Cells[0].Text == "4")
            {
                GridView2.Rows[i].Cells[0].Text = "Cümə axşamı";
            }

            if (GridView2.Rows[i].Cells[0].Text == "5")
            {
                GridView2.Rows[i].Cells[0].Text = "Cümə";
            }

            if (GridView2.Rows[i].Cells[0].Text == "6")
            {
                GridView2.Rows[i].Cells[0].Text = "Şənbə";
            }

            if (GridView2.Rows[i].Cells[0].Text == "7")
            {
                GridView2.Rows[i].Cells[0].Text = "Bazar";
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        WorkerDeleteVoid();
        WorkerAddVoid();
        Button1.Enabled = false;
    }

    void WorkerDeleteVoid()
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Delete GroupWorker where GroupOid = '" + Session["GroupAddWorker"].ToString() + "'";
        komut.ExecuteNonQuery();
        komut.Dispose();
    }

    void WorderSelectedVoid()
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from GroupWorker where GroupOid = '" + Session["GroupAddWorker"].ToString() + "'";
        IDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("WorkerID") as CheckBox;
                if (checkbox.Text==dr["UserId"].ToString())
                {
                    checkbox.Checked = true;
                }
            }
        }
    }

    void WorkerAddVoid()
    {
        foreach (GridViewRow gvrow in GridView1.Rows)
        {
            var checkbox = gvrow.FindControl("WorkerID") as CheckBox;
            if (checkbox.Checked)
            {
                baglan();
                komut.Connection = baglanti;
                komut.CommandText = "insert into GroupWorker(GroupOid, UserId) values('" + Session["GroupAddWorker"].ToString()+"', '" +Convert.ToInt32( checkbox.Text) + "' )";
                komut.ExecuteNonQuery();
                komut.Dispose();
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        WorderSelectedVoid();
        Button1.Enabled = true;
    }
}