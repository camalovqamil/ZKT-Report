<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="GroupDayAddWorker.aspx.cs" Inherits="GroupDayAddWorker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            text-align: center;
        }
         .auto-style5 {
            color:white;
            background-color:HotPink;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
        <div class="auto-style5">
            <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style6" Width="25%" style="font-size: 18pt"></asp:Label></strong><asp:Button ID="Button1" runat="server" Text="Əlavə et" CssClass="Font" Width="20%" Height="45px" OnClick="Button1_Click" Enabled="False" />
            <asp:Button ID="Button2" runat="server" Text="Qrupa daxil olan işçiləri gör" CssClass="Font" Width="20%" Height="45px" OnClick="Button2_Click" />
        </div>
    <br />
    <div style="display:flex; justify-content:space-around;">
       <asp:Panel ID="Panel1" runat="server" GroupingText="İşçilər" CssClass="auto-style4" Width="30%" style="font-size: 14pt">
        <br />
            <div class="auto-style3">
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
        <asp:SqlDataSource ID="SqlDataSourceWorker" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [USERINFO]"></asp:SqlDataSource>
    </div>
</asp:Content>

