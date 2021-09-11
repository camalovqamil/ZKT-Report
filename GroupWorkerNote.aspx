<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="GroupWorkerNote.aspx.cs" Inherits="GroupWorkerNote" %>

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
        .auto-style6 {
            text-align: right;
            width: 400px;
            height: 160px;
        }
        .auto-style11 {
            text-align: right;
            height: 60px;
            width: 400px;
        }
        .auto-style12 {
            width: 400px;
        }
        .auto-style13 {
            height: 60px;
            text-align: center;
        }
        .auto-style14 {
            height: 160px;
            text-align: center;
        }
        .auto-style15 {
            width: 400px;
            height: 75px;
            text-align: right;
        }
        .auto-style16 {
            text-align: center;
            height: 75px;
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
    <asp:Panel ID="Panel2" runat="server" GroupingText="Yeni qeyd" CssClass="auto-style3">
        <table class="auto-style5">
            <tr>
                <td class="auto-style11">İcra tarixi:</td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtTimeData" runat="server" CssClass="Font" TextMode="Date" Width="90%"></asp:TextBox>
                </td>
            </tr>
            <%--<tr>
                <td class="auto-style11">İcra saatı:</td>
                <td class="auto-style13">
                    <asp:TextBox ID="TxtTimeout" runat="server" CssClass="Font" TextMode="Time" Width="90%"></asp:TextBox>
                </td>
            </tr>--%>
            <tr>
                <td class="auto-style6">Qeyd:</td>
                <td class="auto-style14">
                    <asp:TextBox ID="TxtNote" runat="server" CssClass="Font" Height="120px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Button ID="Button2" runat="server" CssClass="Font" Height="50px" OnClick="Button2_Click" Text="Yenilə" Width="90%" />
                </td>
                <td class="auto-style16">
                    <asp:Button ID="Button1" runat="server" CssClass="Font" Height="50px" OnClick="Button1_Click" Text="Əlavə et" Width="90%" />
                </td>
            </tr>
           
        </table>


    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Qeydlər" CssClass="auto-style3">
        <br />
        <div class="auto-style4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="Sil">
                            <ItemTemplate>
                                <asp:LinkButton ID="NoteDelete" runat="server" CommandArgument='<%# Eval("GroupNoteOid") %>' OnClick="OnConfirm" OnClientClick="Confirm()" Font-Size="16pt" Text='<i class="fas fa-trash-alt"></i>' ForeColor="HotPink"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    <asp:BoundField DataField="UserID" HeaderText="İşçi İD" SortExpression="UserID" />
                    <asp:BoundField DataField="NAME" HeaderText="Tam ad" SortExpression="NAME" />
                    <asp:BoundField DataField="TimeData" DataFormatString="{0:d}" HeaderText="Qeydin icra tarixi" SortExpression="TimeData" />
                    <asp:BoundField DataField="Note" HeaderText="Qeyd" SortExpression="Note" />
                    <asp:BoundField DataField="InsertData" HeaderText="Qeydin əlavə olunma tarixi" SortExpression="InsertData" />
                    <asp:BoundField DataField="GroupName" HeaderText="Qrup adı" SortExpression="GroupName" />
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [GroupNoteView] WHERE (([GroupOid] = @GroupOid) AND ([UserID] = @UserID)) ORDER BY [InsertData] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="GroupOid" SessionField="GroupsOidUpdate" Type="String" />
                <asp:SessionParameter Name="UserID" SessionField="WorkerNoteID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </asp:Panel>  
</asp:Content>

