<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="DaysWorker.aspx.cs" Inherits="DaysWorker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            font-size: 14pt;
        }
        .auto-style4 {
            text-align: center;
        }


        .auto-style5 {
            width: 100%;
        }
        .auto-style7 {
            width: 30%;
            height: 80px;
            text-align: right;
        }
        .auto-style9 {
            text-align: center;
            height: 80px;
        }
        .auto-style10 {
            padding: 5px;
            font-size: 12pt;
            border-radius: 15px;
            margin-top: 15px;
            margin-left: 5px;
            margin-right: 5px;
            margin-bottom: 5px;
        }
    </style>

    <script type="text/javascript">
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

            function Confirm2() 
            {
                var confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                if (confirm("Seçilmiş sətri silmək istəyirsiniz?")) 
                {
                    confirm_value.value = "Yes";
                } else

                {
                    confirm_value.value = "No";
                }
                document.forms[0].appendChild(confirm_value);
            }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="display:flex; justify-content:space-around; height:100%; overflow:auto;">
        <asp:Panel ID="Panel1" runat="server" GroupingText="Digər - Qrup adı" CssClass="auto-style3" Width="40%">
            <br />
            <div class="auto-style4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDaysgroup" Width="100%" OnDataBound="GridView1_DataBound">
                    <Columns>

                        <asp:TemplateField HeaderText="Sil">
                            <ItemTemplate>
                                <asp:LinkButton ID="GroupDaysDelete" runat="server" CommandArgument='<%# Eval("DaysGroupOid") %>' OnClick="OnConfirm"  OnClientClick="Confirm()"   ForeColor="HotPink"  Font-Size="16pt" Text='<i class="fas fa-trash-alt"></i>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Qrup adı">
                            <ItemTemplate>
                                <asp:LinkButton ID="GroupDaysDetal" runat="server" CommandArgument='<%# Eval("DaysGroupOid") %>' Text='<%# Eval("GroupName") %>' OnClick="GroupDaysDetal_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Plan əlavə et">
                            <ItemTemplate>
                                <asp:LinkButton ID="GroupDaysAddPlan" runat="server" CommandArgument='<%# Eval("DaysGroupOid") %>' OnClick="GroupDaysAddPlan_Click" Font-Size="18pt" ForeColor="HotPink" Text='<i class="fas fa-calendar-plus"></i>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="İşçi əlavə et (Bax)">
                            <ItemTemplate>
                                <asp:LinkButton ID="GroupDaysAddWorker" runat="server" CommandArgument='<%# Eval("DaysGroupOid") %>' Font-Size="18pt" ForeColor="HotPink" Text='<i class="fas fa-user-plus"></i>' OnClick="GroupDaysAddWorker_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                         

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
            <asp:SqlDataSource ID="SqlDataSourceDaysgroup" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [GroupDays]"></asp:SqlDataSource>
        </asp:Panel>

        

        <asp:Panel ID="Panel3" runat="server" GroupingText="Qrup planları" CssClass="auto-style3" Width="30%">
            <br />
            <div class="auto-style4">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePlan" OnDataBound="GridView3_DataBound" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Sil">
                            <ItemTemplate>
                                <asp:LinkButton ID="PlanDelete" runat="server" CommandArgument='<%# Eval("GroupPlanOid") %>' OnClick="OnConfirm2"  OnClientClick="Confirm2()"   ForeColor="HotPink"  Font-Size="16pt" Text='<i class="fas fa-trash-alt"></i>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Qrafik əlavə et">
                            <ItemTemplate>
                                <asp:LinkButton ID="GroupDaysPlanDelete" runat="server" CommandArgument='<%# Eval("GroupPlanOid") %>' Font-Size="18pt" ForeColor="HotPink" OnClick="GroupDaysPlanGraph_Click" Text='<i class="far fa-calendar-plus"></i>'> </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Plan adı">
                            <ItemTemplate>
                                <asp:LinkButton ID="PlanEdit" runat="server" CommandArgument='<%# Eval("GroupPlanOid") %>' Text='<%# Eval("PlanName") %>' OnClick="PlanEdit_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
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
            <asp:SqlDataSource ID="SqlDataSourcePlan" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [GroupDaysPlanView] WHERE ([GroupDaysOid] LIKE '%' + @GroupDaysOid + '%') ORDER BY [InsertData] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="GroupDaysOid" SessionField="GroupsOidUpdate" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" GroupingText="Qrup məlumatları" CssClass="auto-style3" Width="25%">
 
            <table class="auto-style5">
                <tr>
                    <td class="auto-style7">Qrup adı:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style10" Width="80%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="Button2" runat="server" CssClass="Font" Text="Yenilə" Width="80%" Height="45px" OnClick="Button2_Click"  />
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="Button1" runat="server" CssClass="Font" Text="Əlavə et" Width="80%" Height="45px" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2">
                        <asp:Button ID="Button3" runat="server" CssClass="Font" Text="Məlumatı yenilə" Width="80%" Enabled="False" Height="45px" OnClick="Button3_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="Label1" runat="server" BackColor="HotPink" Height="10px" Width="100%"></asp:Label>
            <asp:Panel ID="Panel4" runat="server" GroupingText="Yeni plan">
                <table class="auto-style5">
                    <tr>
                        <td class="auto-style7">Plan adı:</td>
                        <td class="auto-style9">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style10" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9" colspan="2">
                            <asp:Button ID="Button4" runat="server" Text="Məlumatı yenilə" CssClass="Font" Width="50%" Enabled="False" Height="45px" OnClick="Button4_Click" />
                            <asp:Button ID="Button5" runat="server" CssClass="Font" Text="Əlavə et" Width="40%" Height="45px" OnClick="Button5_Click" Enabled="False" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:Panel>
    </div>
</asp:Content>

