<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="GroupDaysReport.aspx.cs" Inherits="GroupDaysReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style3 {
            background-color: hotpink;
            text-align: center;
        }
        .auto-style4 {
            font-size: 14pt;
        }
        .auto-style5 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="auto-style3">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="Font" DataSourceID="SqlDataSourceGroup" DataTextField="GroupName" DataValueField="DaysGroupOid" Width="15%"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceGroup" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [GroupDays]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" CssClass="Font" DataSourceID="SqlDataSourcePlan" DataTextField="PlanName" DataValueField="GroupPlanOid" Width="15%"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourcePlan" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [GroupDaysPlan] WHERE ([GroupDaysOid] = @GroupDaysOid) ORDER BY [InsertData] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="GroupDaysOid" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" CssClass="Font" OnTextChanged="TextBox1_TextChanged" TextMode="Date" Width="15%"></asp:TextBox>
        <font size="5">-</font><asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" CssClass="Font" OnTextChanged="TextBox2_TextChanged" TextMode="Date" Width="15%"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Report et" CssClass="Font" Enabled="False" Width="15%" OnClick="Button1_Click" Height="40px" />
        <asp:Button ID="Button2" runat="server" CssClass="Font" Height="40px" Text="Yenilə" Width="15%" OnClick="Button2_Click" />
    </div>
    <br />
    <div style="display:flex; justify-content:space-around">
        <asp:Panel ID="Panel1" runat="server" GroupingText="İşə gələnlər" CssClass="auto-style4" Width="45%">
            <br />
            <div class="auto-style5">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnDataBound="GridView1_DataBound" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="İşçi İD" SortExpression="UserId" />
                        <asp:BoundField DataField="NAME" HeaderText="Tam ad" SortExpression="NAME" />
                        <asp:BoundField DataField="StartDays" HeaderText="Gəlmə günü" SortExpression="StartDays" />
                        <asp:BoundField DataField="StartTime" HeaderText="Giriş saatı" SortExpression="StartTime" />
                        <asp:BoundField DataField="StartIn" HeaderText="Tam ad" SortExpression="StartIn" />
                        <asp:BoundField DataField="StartOut" HeaderText="Tam ad" SortExpression="NAME" />
                        <asp:BoundField HeaderText="Gəldiyi saat" />

                        <asp:BoundField DataField="StartNote" HeaderText="Qeyd"/>
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

        <asp:Panel ID="Panel2" runat="server" GroupingText="İşdən çıxanlar" CssClass="auto-style4" Width="45%">
            <br />
            <div class="auto-style5">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnDataBound="GridView2_DataBound" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="İşçi İD" SortExpression="UserId" />
                        <asp:BoundField DataField="NAME" HeaderText="Tam ad" SortExpression="NAME" />
                        <asp:BoundField DataField="EndDays" HeaderText="Gəlmə günü" SortExpression="EndDays" />
                        <asp:BoundField DataField="EndTime" HeaderText="Çıxış saatı" SortExpression="StartTime" />
                        <asp:BoundField DataField="EndIn" HeaderText="Tam ad" SortExpression="EndIn" />
                        <asp:BoundField DataField="EndOut" HeaderText="Tam ad" SortExpression="EndOut" />
                        <asp:BoundField HeaderText="Çıxdığı saat" />
                        <asp:BoundField DataField="EndNote" HeaderText="Qeyd"/>
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
    </div>
</asp:Content>

