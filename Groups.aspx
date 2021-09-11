<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Groups.aspx.cs" Inherits="Groups" %>

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
    <div style="display:flex; justify-content:space-around;">
        <asp:Panel ID="Panel1" runat="server" GroupingText="Qruplar" Width="45%" CssClass="auto-style3">
            <div class="auto-style4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGroups" Width="100%">
                    <Columns>
                        <%--Sil--%>
                        <asp:TemplateField HeaderText="Sil">
                            <ItemTemplate>
                                <asp:LinkButton ID="GroupDelete" runat="server" CommandArgument='<%# Eval("GroupOid") %>' OnClick="OnConfirm" OnClientClick="Confirm()" Font-Size="16pt" Text='<i class="fas fa-trash-alt"></i>' ForeColor="HotPink"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--Duzelis--%>
                        <asp:TemplateField HeaderText="Qrup adı">
                            <ItemTemplate>
                                <asp:LinkButton ID="Detal" runat="server" CommandArgument='<%# Eval("GroupOid") %>' Text='<%# Eval("GroupName") %>' OnClick="Detal_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--Isci elave et--%>
                        <asp:TemplateField HeaderText="İşçi əlavə et">
                            <ItemTemplate>
                                <asp:LinkButton ID="GroupAddWorker" runat="server" CommandArgument='<%# Eval("GroupOid") %>' Font-Size="18pt" ForeColor="HotPink" Text='<i class="fas fa-user-plus"></i>' OnClick="GroupAddWorker_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Parametr">
                            <ItemTemplate>
                                <asp:LinkButton ID="GroupParametr" runat="server" CommandArgument='<%# Eval("GroupOid") %>' Font-Size="18pt" ForeColor="HotPink" Text='<i class="fas fa-users-cog"></i>' OnClick="GroupParametr_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:BoundField DataField="GroupOid" HeaderText="GroupOid" SortExpression="GroupOid" />
                        <asp:BoundField DataField="GroupName" HeaderText="GroupName" SortExpression="GroupName" />
                        <asp:BoundField DataField="InsertDate" HeaderText="InsertDate" SortExpression="InsertDate" />--%>
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

        <asp:Panel ID="Panel2" runat="server" GroupingText="Məlumatlar" Width="45%" CssClass="auto-style3">
            <table class="auto-style5">
                <tr>
                    <td class="auto-style7">Qrup adı:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="Font" Width="80%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="Button2" runat="server" CssClass="Font" Text="Yenilə" Width="80%" Height="45px" OnClick="Button2_Click" />
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

<br />
            <br />
            <div style="max-height: 300px; overflow: auto;">
                <asp:Panel ID="Panel3" runat="server" GroupingText="Qrup işçiləri">
                    <br />
                    <div class="auto-style10">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGroupWorker" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="UserId" HeaderText="İşçi Id" SortExpression="UserId" />
                                <asp:BoundField DataField="NAME" HeaderText="Tam ad" SortExpression="NAME" />


                                <asp:TemplateField HeaderText="Qeydlər">
                            <ItemTemplate>
                                <asp:LinkButton ID="WorkerNote" runat="server" CommandArgument='<%# Eval("UserId") %>' Font-Size="18pt" ForeColor="HotPink" Text='<i class="fas fa-comments"></i>' OnClick="WorkerNote_Click"></asp:LinkButton>
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
                    <asp:SqlDataSource ID="SqlDataSourceGroupWorker" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [GroupWorkerView_1] WHERE ([GroupOid] = @GroupOid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="GroupOid" SessionField="GroupsOidUpdate" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </div>
                </asp:Panel>
    </div>
</asp:Content>

