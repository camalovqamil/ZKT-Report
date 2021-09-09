<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AllWorkerReport.aspx.cs" Inherits="AllWorkerReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            font-size: 16pt;
        }
        .auto-style5 {
            margin-top:10px;
            font-size: 14pt;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="auto-style3">
    <asp:Panel ID="Panel1" runat="server" GroupingText="Tarix intervalı" CssClass="auto-style4">
        
        <asp:TextBox ID="TextBox1" runat="server" CssClass="Font" TextMode="Date" Width="15%"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="-" Width="30px"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="Font" TextMode="Date" Width="15%"></asp:TextBox>
        &nbsp;
        <asp:Button ID="Button1" runat="server" CssClass="Font" Height="40px" Text="Report Et" Width="20%" />
        </asp:Panel>
    </div>
    <br />
    <div class="auto-style3">
        <asp:Panel ID="Panel2" runat="server" GroupingText="Hesabat" CssClass="auto-style4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CHECKTIME,USERID" DataSourceID="SqlDataSourceAllReport" Width="100%" CssClass="auto-style5" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnDataBound="GridView1_DataBound">

                <AlternatingRowStyle BackColor="White" />

                <Columns>
                    <asp:CommandField SelectText='<i class="far fa-hand-pointer" style="font-size:18pt;" ></i>' ShowSelectButton="True" HeaderText="Seçim" />
                    <asp:BoundField DataField="USERID" HeaderText="İşçi İD" ReadOnly="True" SortExpression="USERID" />
                    <asp:BoundField DataField="NAME" HeaderText="Tam ad" SortExpression="NAME" />
                    <asp:BoundField DataField="CHECKTIME" HeaderText="Saat" SortExpression="CHECKTIME" ReadOnly="True" />
                    <asp:BoundField DataField="GENDER" HeaderText="Cinsi" SortExpression="GENDER" />
                </Columns>

                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="HotPink" Font-Bold="True" ForeColor="White" Height="50px" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle Height="35px" />
                <SelectedRowStyle BackColor="HotPink" Font-Bold="False" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceAllReport" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [UserInOutView] WHERE (([CHECKTIME] &gt;= @CHECKTIME) AND ([CHECKTIME] &lt;= @CHECKTIME2)) ORDER BY [CHECKTIME], [NAME]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="CHECKTIME" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="TextBox2" Name="CHECKTIME2" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
</asp:Content>

