<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AddGraph.aspx.cs" Inherits="AddGraph" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            font-size: 14pt;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            font-size: 12pt;
        }
        .auto-style6 {
            padding: 5px;
            font-size: 12pt;
            border-radius: 15px;
            margin-top: 15px;
            margin-left: 5px;
            margin-right: 5px;
            margin-bottom: 5px;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div style="display: flex; justify-content: space-around;">
        <asp:Panel ID="Panel1" runat="server" GroupingText="Qrup işçiləri" CssClass="auto-style3" Width="20%">
            <br />
            <div class="auto-style4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceWorker" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="İşçi İD">
                            <ItemTemplate>
                                <asp:CheckBox ID="WorkerID" runat="server" CommandArgument='<%# Eval("USERID") %>' Text='<%# Bind("USERID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="NAME" HeaderText="Tam Ad" SortExpression="NAME" />
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
            <asp:SqlDataSource ID="SqlDataSourceWorker" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [GroupDayWorkerView] WHERE ([GroupDayOid] = @GroupDayOid)">
                <SelectParameters>
                    <asp:SessionParameter Name="GroupDayOid" SessionField="GroupsOidUpdate" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>

        <asp:Panel ID="Panel3" runat="server" GroupingText="Parametrlər" CssClass="auto-style3" Width="75%">
            <br />
            <asp:Panel ID="Panel2" runat="server" GroupingText="Yeni qrafik parametri">
                <br />
                <div style="display: flex; justify-content: space-around;" class="auto-style4">
                    <asp:Panel ID="Panel4" runat="server" GroupingText="Gəliş tarixi" Width="22%">
                        <asp:TextBox ID="TxtStartDays" runat="server" CssClass="Font" TextMode="Date" Width="80%"></asp:TextBox>
                    </asp:Panel>

                    <asp:Panel ID="Panel5" runat="server" GroupingText="Gəliş saatı" Width="22%">
                        <asp:TextBox ID="txtStartTime" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                    </asp:Panel>

                    <asp:Panel ID="Panel6" runat="server" GroupingText="Başalamanın əvvəli" Width="22%">
                        <asp:TextBox ID="TxtStartIn" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                    </asp:Panel>

                    <asp:Panel ID="Panel7" runat="server" GroupingText="Başlamanın sonu" Width="22%">
                        <asp:TextBox ID="TxtStartOut" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                    </asp:Panel>

                    
                </div>
                <br />
                <div style="display: flex; justify-content: space-around;" class="auto-style4">
                    <asp:Panel ID="Panel8" runat="server" GroupingText="Çıxış tarixi" Width="22%">
                        <asp:TextBox ID="TxtEndDays" runat="server" CssClass="Font" TextMode="Date" Width="80%"></asp:TextBox>
                    </asp:Panel>

                    <asp:Panel ID="Panel9" runat="server" GroupingText="Çıxış saatı" Width="22%">
                        <asp:TextBox ID="TxtEndTime" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                    </asp:Panel>

                    <asp:Panel ID="Panel10" runat="server" GroupingText="Bitmənin əvvəli" Width="22%">
                        <asp:TextBox ID="TxtEndIn" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                    </asp:Panel>

                    <asp:Panel ID="Panel11" runat="server" GroupingText="Bitmənin sonu" Width="22%">
                        <asp:TextBox ID="TxtEndOut" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                    </asp:Panel>

                    
                </div>
                <br />
                <div style="display: flex; justify-content: space-around;" class="auto-style4">
                    <asp:Panel ID="Panel15" runat="server" GroupingText="Giriş qeydi" Width="22%" BorderColor="HotPink">
                        <asp:TextBox ID="DrpStartNote" runat="server" CssClass="Font"></asp:TextBox>
                    </asp:Panel>

                    <asp:Panel ID="Panel16" runat="server" GroupingText="Çıxış qeydi" Width="22%" BorderColor="HotPink">
                        <asp:TextBox ID="DrpEndNote" runat="server" CssClass="Font"></asp:TextBox>
                    </asp:Panel>

                    <asp:Panel ID="Panel14" runat="server" GroupingText="Yeni Məlumat" Width="32%" BorderColor="HotPink">
                        <asp:Button ID="Button2" runat="server" Text="Əlavə et" CssClass="auto-style6" Height="40px" Width="40%" OnClick="Button2_Click" />
                        <asp:Button ID="Button3" runat="server" CssClass="auto-style6" Height="40px" OnClick="Button3_Click" Text="Yeni qrafik" Width="40%" />
                    </asp:Panel>

                    <asp:Panel ID="Panel13" runat="server" GroupingText="Yenilə" Width="12%" BorderColor="HotPink">
                        <asp:Button ID="Button1" runat="server" Text="Yenilə" CssClass="auto-style6" Height="40px" Width="90%" OnClick="Button1_Click" />
                    </asp:Panel>
                </div>

            </asp:Panel>

            <br />
<%--            <div style="width: 100%; overflow: auto;">--%>
                <asp:Panel ID="Panel12" runat="server" GroupingText="Parametrlər">
                    <div class="auto-style4">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="auto-style5" DataSourceID="SqlDataSourcePlan" Width="100%" OnDataBound="GridView2_DataBound">
                            <Columns>
                               <asp:TemplateField HeaderText="Sil">
                            <ItemTemplate>
                                <asp:LinkButton ID="Time_Delete" runat="server" CommandArgument='<%# Eval("GroupDaysPlanTimeOid") %>' OnClick="OnConfirm" OnClientClick="Confirm()" Font-Size="16pt" Text='<i class="fas fa-trash-alt"></i>' ForeColor="HotPink"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                                <asp:BoundField DataField="NAME" HeaderText="İşçi" SortExpression="NAME" />
                                <asp:BoundField DataField="StartDays" DataFormatString="{0:d}" HeaderText="Gəliş tarixi" SortExpression="StartDays" />
                                <asp:BoundField DataField="StartTime" HeaderText="Gəliş saatı" SortExpression="StartTime" />
                                <asp:BoundField DataField="StartNote" HeaderText="Gəl. qeyd" >
                                <ItemStyle BackColor="#CCCCCC" />
                                </asp:BoundField>
                                <asp:BoundField DataField="EndDays" DataFormatString="{0:d}" HeaderText="Çıxış tarixi" SortExpression="EndDays" />
                                <asp:BoundField DataField="EndTime" HeaderText="Çıxış saatı" SortExpression="EndTime" />
                                <asp:BoundField DataField="EndNote" HeaderText="Çıx. qeyd" >
                                <ItemStyle BackColor="#CCCCCC" />
                                </asp:BoundField>
                                <asp:BoundField DataField="StartIn" HeaderText="Baş. Əvvəli" SortExpression="StartIn" />
                                <asp:BoundField DataField="StartOut" HeaderText="Baş. Sonu" SortExpression="StartOut" />
                                <asp:BoundField DataField="EndIn" HeaderText="Bit. Əvvəli" SortExpression="EndIn" />
                                <asp:BoundField DataField="EndOut" HeaderText="Bit. Sonu" SortExpression="EndOut" />
                                
                               
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
                <asp:SqlDataSource ID="SqlDataSourcePlan" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [PlanView] WHERE ([GroupDaysPlanOid] = @GroupDaysPlanOid) ORDER BY [NAME], [StartDays] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="GroupDaysPlanOid" SessionField="PlanOid" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </asp:Panel>
        </asp:Panel>
        <%-- <asp:TemplateField HeaderText="Gəliş tarixi">
                                    <ItemTemplate>
                                        <asp:TextBox ID="SartDay" runat="server" CssClass="Font1" Text='<%# Bind("StartDays") %>' DataFormatString="{0:d}"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gəliş saatı">
                                    <ItemTemplate>
                                        <asp:TextBox ID="SarTime" runat="server" CssClass="Font1" Text='<%# Bind("StartTime") %>' TextMode="Time"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Başlamanın əvvəli">
                                    <ItemTemplate>
                                        <asp:TextBox ID="SartIn" runat="server" CssClass="Font1" Text='<%# Bind("StartIn") %>' TextMode="Time"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Başlamanın sonu">
                                    <ItemTemplate>
                                        <asp:TextBox ID="SartOut" runat="server" CssClass="Font1" Text='<%# Bind("StartOut") %>' TextMode="Time"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Başlamanın sonu">
                                    <ItemTemplate>
                                        <asp:TextBox ID="UserID" runat="server" CssClass="Font1" Text='<%# Bind("Name") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
    </div>
</asp:Content>

