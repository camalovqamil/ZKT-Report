<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: 14pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" GroupingText="Panel" CssClass="auto-style2">
            <div class="auto-style1">
                <asp:TextBox ID="TxtStart" runat="server" CssClass="auto-style2" TextMode="Date"></asp:TextBox>
                <strong>&nbsp;- </strong>
                <asp:TextBox ID="TxtEnd" runat="server" CssClass="auto-style2" TextMode="Date"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CssClass="auto-style2" Text="Report et" />
            </div>
        </asp:Panel>
    
    </div>
        <asp:Panel ID="Panel2" runat="server" GroupingText="Məlumatlar" CssClass="auto-style2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CHECKTIME,USERID" DataSourceID="SqlDataSourceAll" Width="100%" OnDataBound="GridView1_DataBound">
                <Columns>
                    <asp:BoundField DataField="CHECKTIME" HeaderText="Saat" ReadOnly="True" SortExpression="CHECKTIME" />
                    <asp:BoundField DataField="NAME" HeaderText="İşçi adı" SortExpression="NAME" />
                    <asp:BoundField DataField="Notes" HeaderText="Status" SortExpression="Notes" />
                    <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                    
                </Columns>

                 <FooterStyle BackColor="#CCCCCC" />
                 <HeaderStyle Height="40px" BackColor="Red" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                 <RowStyle Height="30px" BackColor="White" />
                 <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                 <SortedAscendingCellStyle BackColor="#F1F1F1" />
                 <SortedAscendingHeaderStyle BackColor="#808080" />
                 <SortedDescendingCellStyle BackColor="#CAC9C9" />
                 <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceAll" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [UserInOutView] WHERE (([CHECKTIME] &gt;= @CHECKTIME) AND ([CHECKTIME] &lt; @CHECKTIME2)) order by Name, CHECKTIME">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TxtStart" Name="CHECKTIME" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="TxtEnd" Name="CHECKTIME2" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </form>
</body>
</html>
