using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class GroupDayAddWorker : System.Web.UI.Page
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
        Label1.Text = "Qrup: " + Session["SelectGroupname"].ToString();
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
        komut.CommandText = "Delete GroupDayWorker where GroupDayOid = '" + Session["GroupAddWorker"].ToString() + "'";
        komut.ExecuteNonQuery();
        komut.Dispose();
    }

    void WorderSelectedVoid()
    {
        baglan();
        komut.Connection = baglanti;
        komut.CommandText = "Select *from GroupDayWorker where GroupDayOid = '" + Session["GroupAddWorker"].ToString() + "'";
        IDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("WorkerID") as CheckBox;
                if (checkbox.Text == dr["UserId"].ToString())
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
                komut.CommandText = "insert into GroupDayWorker(GroupDayOid, UserId) values('" + Session["GroupAddWorker"].ToString() + "', '" + Convert.ToInt32(checkbox.Text) + "' )";
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