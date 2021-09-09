<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="GroupWorker.aspx.cs" Inherits="GroupWorker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            font-size: 14pt;
        }
        .auto-style5 {
            color:white;
            background-color:HotPink;
            text-align: center;
        }
        .auto-style6 {
            padding: 5px;
            font-size: 18pt;
            border-radius: 15px;
            margin-top: 15px;
            margin-left: 5px;
            margin-right: 5px;
            margin-bottom: 5px;
        }
        .auto-style7 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
        <div class="auto-style5">
            <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style6" Width="25%"></asp:Label></strong><asp:Button ID="Button1" runat="server" Text="Əlavə et" CssClass="Font" Width="20%" OnClick="Button1_Click" Height="45px" Enabled="False" />
            <asp:Button ID="Button2" runat="server" Text="Qrupa daxil olan işçiləri gör" CssClass="Font" Width="20%" OnClick="Button2_Click" Height="45px" />
        </div>
       <div style="display:flex; justify-content:space-around;">
    <asp:Panel ID="Panel1" runat="server" GroupingText="İşçilər" CssClass="auto-style4" Width="30%">
        <br />
            <div class="auto-style7">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="SqlDataSourceWorker" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="İşçi İD">
                            <ItemTemplate>
                                <asp:CheckBox ID="WorkerID" runat="server" CommandArgument='<%# Eval("USERID") %>' Text='<%# Bind("USERID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BADGENUMBER" HeaderText="Nişan nömrəsi" SortExpression="BADGENUMBER" />
                        <asp:BoundField DataField="NAME" HeaderText="Tam ad" SortExpression="NAME" />
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

           <asp:Panel ID="Panel2" runat="server" GroupingText="Qrup parametrləri" CssClass="auto-style4" Width="60%">
               <br />
               <div class="auto-style7">
                   <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGroupTime" OnDataBound="GridView2_DataBound" Width="100%">
                       <Columns>
                           <%--<asp:BoundField DataField="TimeOid" HeaderText="TimeOid" SortExpression="TimeOid" />--%>
                           <asp:BoundField DataField="Days" HeaderText="Gün" SortExpression="Days" />
                           <asp:BoundField DataField="StartTime" HeaderText="Gəliş saatı" SortExpression="StartTime" />
                           <asp:BoundField DataField="EndTime" HeaderText="Çıxış saatı" SortExpression="EndTime" />
                           <asp:BoundField DataField="StartIn" HeaderText="Başlamanın əvvəli" SortExpression="StartIn" />
                           <asp:BoundField DataField="StartOut" HeaderText="Başlamanın sonu" SortExpression="StartOut" />
                           <asp:BoundField DataField="EndIn" HeaderText="Birmənin əvvəli" SortExpression="EndIn" />
                           <asp:BoundField DataField="EndOut" HeaderText="Bitmənin sonu" SortExpression="EndOut" />
                           <%--                        <asp:BoundField DataField="GroupName" HeaderText="Qrup adı" SortExpression="GroupName" />--%>
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
               <asp:SqlDataSource ID="SqlDataSourceGroupTime" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [GruopTimeView] WHERE ([GrupOid] = @GrupOid) ORDER BY [Days]">
                   <SelectParameters>
                       <asp:SessionParameter Name="GrupOid" SessionField="GroupAddWorker" Type="String" />
                   </SelectParameters>
               </asp:SqlDataSource>
           </asp:Panel>
           </div> 
    <asp:SqlDataSource ID="SqlDataSourceWorker" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [USERINFO]"></asp:SqlDataSource>
</asp:Content>

