<%@ Page Language="C#" AutoEventWireup="true" CodeFile="USERTIME.aspx.cs" Inherits="USERTIME" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: 14pt;
        }
        .HiddenText label{display:none;}
        .auto-style2 {
            width: 100%;
        }

        .Font{
    padding:3px 10px;
    border-radius:20px;
    font-size: 14pt;
}
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 30%;
             text-align: right;
            text-align: right;
        }
        .auto-style5 {
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 14pt;
            color: red;
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="display:flex; justify-content:space-around;">
        <asp:Panel ID="Panel1" runat="server" GroupingText="İstifadəçilər" Width="30%" CssClass="auto-style1">
            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="User">
                <Columns>
                    <asp:TemplateField HeaderText="Seç">
                            <ItemTemplate>
                                <asp:CheckBox ID="USERID" runat="server" CommandArgument='<%# Eval("USERID") %>' CssClass="HiddenText" Text='<%# Bind("USERID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="Tam ad" SortExpression="NAME" />
                    </Columns>

                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Red" Font-Bold="True" ForeColor="White" Height="30px" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" Height="30px" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="User" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [USERINFO]"></asp:SqlDataSource>

        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" GroupingText="Saat" Width="60%" CssClass="auto-style1">
            <table class="auto-style2">
                <tr>
                    <td colspan="2" class="auto-style3">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="Font" Width="95%">
                            <asp:ListItem Value="1">Normal</asp:ListItem>
                            <asp:ListItem Value="2">Saatlıq</asp:ListItem>
                        </asp:DropDownList>
                    </td>                   
                </tr>

                 <tr>
                    <td colspan="2" class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Normal" CssClass="auto-style5" Width="95%"></asp:Label>
                    </td>                    
                </tr>
                <tr>
                    <td class="auto-style4">Gəlmə Saatı:</td>
                    <td>
                        <asp:TextBox ID="TxtStart" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Çıxma Saatı:</td>
                    <td>
                        <asp:TextBox ID="TxtEnd" runat="server" CssClass="Font" TextMode="Time" Width="80%"></asp:TextBox>
                    </td>
                </tr>

                 <tr>
                    <td colspan="2" class="auto-style3">
                        <asp:Button ID="Button1" runat="server" Text="Yadda saxla" CssClass="Font" Height="45px" OnClick="Button1_Click" Width="95%" />
                    </td>                   
                </tr>
            </table>

        </asp:Panel>
    </div>
    </form>
</body>
</html>
