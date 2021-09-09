<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Workers.aspx.cs" Inherits="Workers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            font-size: 14pt;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style6 {
            width: 180px;
            text-align: right;
            height: 80px;
        }
        .auto-style7 {
            height: 80px;
            text-align: center;
        }
        .auto-style8 {
            text-align: center;
        }
        </style>
    <script type="text/javascript">
     function Confirm() 
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
    <div style="display:flex; justify-content:space-around;">
        <asp:Panel ID="Panel1" runat="server" GroupingText="İşçilər" CssClass="auto-style3" Width="40%">
            <br />
            <div class="auto-style8">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="SqlDataSourceWorker" OnDataBound="GridView1_DataBound" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="İşçi İD" InsertVisible="False" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="BADGENUMBER" HeaderText="Nişan nömrəsi" SortExpression="BADGENUMBER" />
                        <asp:TemplateField HeaderText="Sil">
                            <ItemTemplate>
                                <asp:LinkButton ID="WorkerEdit" runat="server" CommandArgument='<%# Eval("USERID") %>' Text='<%# Eval("NAME") %>'  OnClick="WorkerEdit_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="GENDER" HeaderText="Cinsi" SortExpression="GENDER" />

                        <asp:TemplateField HeaderText="Sil">
                            <ItemTemplate>
                                <asp:LinkButton ID="GroupDaysDelete" runat="server" CommandArgument='<%# Eval("USERID") %>' Font-Size="16pt" ForeColor="HotPink" OnClick="OnConfirm" OnClientClick="Confirm()" Text="&lt;i class=&quot;fas fa-trash-alt&quot;&gt;&lt;/i&gt;"></asp:LinkButton>
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
            <asp:SqlDataSource ID="SqlDataSourceWorker" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [USERINFO]"></asp:SqlDataSource>

        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" GroupingText="Yeni işçi (və ya düzəliş)" CssClass="auto-style3" Width="50%">
            <table class="auto-style4">
                <tr>
                    <td class="auto-style6">Tam ad:</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="Font" Width="80%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">Cinsi:</td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="Font" Width="80%">
                            <asp:ListItem Value="M">Kişi</asp:ListItem>
                            <asp:ListItem Value="F">Qadın</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Button ID="Button2" runat="server" CssClass="Font" Text="Yenilə" Width="80%" Height="50px" OnClick="Button2_Click" />
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="Button1" runat="server" CssClass="Font" Text="Əlavə et" Width="80%" Height="50px" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7" colspan="2">
                        <asp:Button ID="Button3" runat="server" CssClass="Font" Height="50px" Text="Məlumatları yenilə" Width="80%" Enabled="False" OnClick="Button3_Click" />
                    </td>
                </tr>
                
            </table>
    
           

        </asp:Panel>

    </div>
</asp:Content>

