<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="GroupReport.aspx.cs" Inherits="GroupReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            background-color:hotpink;
            text-align: center;
        }
        .auto-style4 {
            font-size: 14pt;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            padding: 5px;
            font-size: 18pt;
            border-radius: 15px;
            margin-top: 15px;
            color: #FFFFFF;
            margin-left: 5px;
            margin-right: 5px;
            margin-bottom: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="auto-style3">
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="Font" DataSourceID="SqlDataSourceGroup" DataTextField="GroupName" DataValueField="GroupOid" Width="20%" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceGroup" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [Groups]"></asp:SqlDataSource>
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" TextMode="Date" CssClass="Font" Width="15%"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style6" Text="-"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Width="15%" CssClass="Font" TextMode="Date" AutoPostBack="True" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="Font" Height="40px" Text="Report et" Width="15%" Enabled="False" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" CssClass="Font" Height="40px" Text="Yenilə" Width="15%" OnClick="Button2_Click" />
    </div>

    <asp:Panel ID="Panel1" runat="server" GroupingText="Məlumatlar" CssClass="auto-style4">
        <br />
        <div class="auto-style5">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnDataBound="GridView1_DataBound" Width="100%">
                <Columns>
                    <asp:BoundField DataField="UserId" HeaderText="İşçi İD" SortExpression="UserId" />
                    <asp:BoundField DataField="NAME" HeaderText="Tam ad" SortExpression="NAME" />
                    <asp:BoundField DataField="Days" HeaderText="Gün" SortExpression="Days" />
                    <asp:BoundField DataField="StartTime" HeaderText="Giriş saatı" SortExpression="StartTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="Çıxış saatı" SortExpression="EndTime" />
                    <asp:BoundField DataField="StartIn" HeaderText="Tam ad" SortExpression="StartIn" />
                    <asp:BoundField DataField="StartOut" HeaderText="Tam ad" SortExpression="NAME" />
                    <asp:BoundField DataField="EndIn" HeaderText="Tam ad" SortExpression="EndIn" />
                    <asp:BoundField DataField="EndOut" HeaderText="Tam ad" SortExpression="EndOut" />
                    <asp:BoundField DataField="ReportStart" HeaderText="Gəldiyi saat" SortExpression="ReportStart" DataFormatString="HH:mm" />
                    <asp:BoundField DataField="RepoertEnd" HeaderText="Çıxdığı saat" SortExpression="ReportEnd" DataFormatString="HH:mm" />

                    <asp:BoundField HeaderText="Giriş fərqi" />
                    <asp:BoundField HeaderText="Çıxış fərqi" />

                    <asp:BoundField HeaderText="Qeyd"  >
                    <ItemStyle Width="250px" />
                    </asp:BoundField>
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
        </div>
    </asp:Panel>
    </asp:Content>

