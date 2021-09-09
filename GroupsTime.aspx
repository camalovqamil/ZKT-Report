<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="GroupsTime.aspx.cs" Inherits="GroupsTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            font-size: 14pt;
        }
        .auto-style4 {
            margin-top:10px;
            text-align: center;
        }
        .auto-style5 {
            margin-top:10px;
            max-height:300px;
            overflow:auto;
            text-align: center;
        }
        .auto-style6 {
            width: 100%;
        }
        .auto-style8 {
            height: 59px;
            text-align: center;
        }
        .auto-style10 {
            height: 59px;
            text-align: right;
            width: 340px;
        }
        .auto-style11 {
            height: 60px;
            text-align: right;
            width: 340px;
        }
        .auto-style12 {
            width: 340px;
        }
        .auto-style13 {
            height: 60px;
            text-align: center;
        }
    </style>

    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Seçilmiş sətri silmək istəyirsiniz?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="display: flex; justify-content: space-around;">
        <asp:Panel ID="Panel1" runat="server" GroupingText="Qruplar" Width="15%" CssClass="auto-style3">
            <div class="auto-style4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGroups" Width="100%">
                    <Columns>

                        <asp:TemplateField HeaderText="Seç">
                            <ItemTemplate>
                                <asp:CheckBox ID="GroupOid" runat="server" CommandArgument='<%# Eval("GroupOid") %>' CssClass="HiddenText" Text='<%# Bind("GroupOid") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Qrup adı">
                            <ItemTemplate>
                                <asp:LinkButton ID="Detal" runat="server" CommandArgument='<%# Eval("GroupOid") %>' Text='<%# Eval("GroupName") %>' OnClick="Detal_Click" ></asp:LinkButton>
                            </ItemTemplate>
                         </asp:TemplateField>

                        <%--<asp:BoundField DataField="GroupOid" HeaderText="GroupOid" SortExpression="GroupOid" />--%>
                        <%--<asp:BoundField DataField="GroupName" HeaderText="GroupName" SortExpression="GroupName" />--%>
                        <%--<asp:BoundField DataField="InsertDate" HeaderText="InsertDate" SortExpression="InsertDate" />--%>
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
            <asp:SqlDataSource ID="SqlDataSourceGroups" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [Groups]"></asp:SqlDataSource>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" GroupingText="Qrup parametirləri" Width="80%" CssClass="auto-style3">
            <br />
            <div class="auto-style5">

                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGroupTime" OnDataBound="GridView2_DataBound" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Sil">
                            <ItemTemplate>
                                <asp:LinkButton ID="Time_Delete" runat="server" CommandArgument='<%# Eval("TimeOid") %>' OnClick="OnConfirm" OnClientClick="Confirm()" Font-Size="16pt" Text='<i class="fas fa-trash-alt"></i>' ForeColor="HotPink"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Düzəliş">
                            <ItemTemplate>
                                <asp:LinkButton ID="Time_Edit" runat="server" CommandArgument='<%# Eval("TimeOid") %>' OnClick="Time_Edit_Click" Font-Size="16pt" Text='<i class="far fa-edit"></i>' ForeColor="HotPink"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField DataField="TimeOid" HeaderText="TimeOid" SortExpression="TimeOid" />--%>                        
                            <asp:BoundField DataField="Days" HeaderText="Gün" SortExpression="Days" />
                            <asp:BoundField DataField="StartTime" HeaderText="Gəliş saatı" SortExpression="StartTime" />
                            <asp:BoundField DataField="EndTime" HeaderText="Çıxış saatı" SortExpression="EndTime" />
                            <asp:BoundField DataField="StartIn" HeaderText="Başlamanın əvvəli" SortExpression="StartIn" />
                            <asp:BoundField DataField="StartOut" HeaderText="Başlamanın sonu" SortExpression="StartOut" />
                            <asp:BoundField DataField="EndIn" HeaderText="Bitmənin əvvəli" SortExpression="EndIn" />
                            <asp:BoundField DataField="EndOut" HeaderText="Bitmənin sonu" SortExpression="EndOut" />
                       <%-- <asp:BoundField DataField="GroupName" HeaderText="Qrup adı" SortExpression="GroupName" />--%>


                        <asp:BoundField HeaderText="İş saatı"  />
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
            <br />
            <asp:Panel ID="Panel3" runat="server" GroupingText="Yeni parametr(və ya düzəliş)">

                <table class="auto-style6">
                    <tr>
                        <td class="auto-style11">Gün:</td>
                        <td class="auto-style13">
                            <asp:DropDownList ID="DrpDays" runat="server" CssClass="Font" Width="82%">
                                <asp:ListItem Value="1">Bazar ertəsi</asp:ListItem>
                                <asp:ListItem Value="2">Çərşənbə axşamı</asp:ListItem>
                                <asp:ListItem Value="3">Çərşənbə</asp:ListItem>
                                <asp:ListItem Value="4">Cümə axşamı</asp:ListItem>
                                <asp:ListItem Value="5">Cümə </asp:ListItem>
                                <asp:ListItem Value="6">Şənbə</asp:ListItem>
                                <asp:ListItem Value="7">Bazar</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Gəliş saatı:</td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TxtStartTime" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Gediş saatı:</td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TxtEndTime" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Başlamanın əvvəli:</td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TxtSratIn" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Başlamanın sonu:</td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TxtStartOut" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Bitmənin əvvəli:</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="TxtEndIn" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Bitmənin sonu:</td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TxtEndOut" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">
                            <asp:Button ID="Button2" runat="server" CssClass="Font" Height="40px" Text="Məlumatları yenilə" Width="82%" Enabled="False" EnableTheming="True" OnClick="Button2_Click" />
                        </td>
                        <td class="auto-style13">
                            <asp:Button ID="Button1" runat="server" CssClass="Font" Height="40px" Text="Əlavə et" Width="82%" OnClick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

            </asp:Panel>
            <asp:SqlDataSource ID="SqlDataSourceGroupTime" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [GruopTimeView] WHERE ([GrupOid] = @GrupOid) ORDER BY [Days]">
                <SelectParameters>
                    <asp:SessionParameter Name="GrupOid" SessionField="GroupDetal" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>


</asp:Content>

