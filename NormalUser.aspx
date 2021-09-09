<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NormalUser.aspx.cs" Inherits="NormalUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color:black;
            text-align: center;
        }
        *{
            margin:0;
            padding:0;
        }
        .Font{
            margin:10px 0;
    padding:3px 10px;
    border-radius:20px;
    font-size: 14pt;
}
        .auto-style2 {
            color: #FFFFFF;
            font-size: 18pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <asp:TextBox ID="TextBox1" runat="server" CssClass="Font" TextMode="Date" Width="15%"></asp:TextBox>
        &nbsp;<span class="auto-style2">-
    
        <asp:TextBox ID="TextBox2" runat="server" CssClass="Font" TextMode="Date" Width="15%"></asp:TextBox>
        &nbsp;</span><asp:Button ID="Button1" runat="server" CssClass="Font" Text="Report et" Height="40px" Width="35%" OnClick="Button1_Click" />
    
    </div>
        <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%">
            <Columns>
                <asp:BoundField DataField="CHECKTIME" HeaderText="CHECKTIME" SortExpression="CHECKTIME" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="BADGENUMBER" HeaderText="BADGENUMBER" SortExpression="BADGENUMBER" />
                <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" />
                <asp:BoundField DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER" />
                <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
                <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                <asp:BoundField DataField="ChckIn" HeaderText="ChckIn" SortExpression="ChckIn" />
                <asp:BoundField DataField="ChckOut" HeaderText="ChckOut" SortExpression="ChckOut" />
            </Columns>

        </asp:GridView>--%>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="SqlDataSource1" OnDataBound="GridView1_DataBound" Width="100%">
            <Columns>
                <asp:BoundField DataField="USERID" HeaderText="İD" ReadOnly="True" SortExpression="USERID" />
<%--                <asp:BoundField DataField="BADGENUMBER" HeaderText="BADGENUMBER" SortExpression="BADGENUMBER" />
                <asp:BoundField DataField="SSN" HeaderText="SSN" SortExpression="SSN" />--%>
                <asp:BoundField DataField="NAME" HeaderText="Tam ad" SortExpression="NAME" />
                <asp:BoundField DataField="GENDER" HeaderText="Cins" SortExpression="GENDER" />
<%--                <asp:BoundField DataField="TITLE" HeaderText="TITLE" SortExpression="TITLE" />
                <asp:BoundField DataField="PAGER" HeaderText="PAGER" SortExpression="PAGER" />
                <asp:BoundField DataField="BIRTHDAY" HeaderText="BIRTHDAY" SortExpression="BIRTHDAY" />
                <asp:BoundField DataField="HIREDDAY" HeaderText="HIREDDAY" SortExpression="HIREDDAY" />
                <asp:BoundField DataField="STREET" HeaderText="STREET" SortExpression="STREET" />
                <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                <asp:BoundField DataField="STATE" HeaderText="STATE" SortExpression="STATE" />
                <asp:BoundField DataField="ZIP" HeaderText="ZIP" SortExpression="ZIP" />
                <asp:BoundField DataField="OPHONE" HeaderText="OPHONE" SortExpression="OPHONE" />
                <asp:BoundField DataField="FPHONE" HeaderText="FPHONE" SortExpression="FPHONE" />
                <asp:BoundField DataField="VERIFICATIONMETHOD" HeaderText="VERIFICATIONMETHOD" SortExpression="VERIFICATIONMETHOD" />
                <asp:BoundField DataField="DEFAULTDEPTID" HeaderText="DEFAULTDEPTID" SortExpression="DEFAULTDEPTID" />
                <asp:BoundField DataField="SECURITYFLAGS" HeaderText="SECURITYFLAGS" SortExpression="SECURITYFLAGS" />
                <asp:BoundField DataField="ATT" HeaderText="ATT" SortExpression="ATT" />
                <asp:BoundField DataField="INLATE" HeaderText="INLATE" SortExpression="INLATE" />
                <asp:BoundField DataField="OUTEARLY" HeaderText="OUTEARLY" SortExpression="OUTEARLY" />
                <asp:BoundField DataField="OVERTIME" HeaderText="OVERTIME" SortExpression="OVERTIME" />
                <asp:BoundField DataField="SEP" HeaderText="SEP" SortExpression="SEP" />
                <asp:BoundField DataField="HOLIDAY" HeaderText="HOLIDAY" SortExpression="HOLIDAY" />
                <asp:BoundField DataField="MINZU" HeaderText="MINZU" SortExpression="MINZU" />
                <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" SortExpression="PASSWORD" />
                <asp:BoundField DataField="LUNCHDURATION" HeaderText="LUNCHDURATION" SortExpression="LUNCHDURATION" />
                <asp:BoundField DataField="MVerifyPass" HeaderText="MVerifyPass" SortExpression="MVerifyPass" />
                <asp:BoundField DataField="privilege" HeaderText="privilege" SortExpression="privilege" />
                <asp:BoundField DataField="InheritDeptSch" HeaderText="InheritDeptSch" SortExpression="InheritDeptSch" />
                <asp:BoundField DataField="InheritDeptSchClass" HeaderText="InheritDeptSchClass" SortExpression="InheritDeptSchClass" />
                <asp:BoundField DataField="AutoSchPlan" HeaderText="AutoSchPlan" SortExpression="AutoSchPlan" />
                <asp:BoundField DataField="MinAutoSchInterval" HeaderText="MinAutoSchInterval" SortExpression="MinAutoSchInterval" />
                <asp:BoundField DataField="RegisterOT" HeaderText="RegisterOT" SortExpression="RegisterOT" />
                <asp:BoundField DataField="InheritDeptRule" HeaderText="InheritDeptRule" SortExpression="InheritDeptRule" />
                <asp:BoundField DataField="EMPRIVILEGE" HeaderText="EMPRIVILEGE" SortExpression="EMPRIVILEGE" />
                <asp:BoundField DataField="CardNo" HeaderText="CardNo" SortExpression="CardNo" />
                <asp:BoundField DataField="FaceGroup" HeaderText="FaceGroup" SortExpression="FaceGroup" />
                <asp:BoundField DataField="AccGroup" HeaderText="AccGroup" SortExpression="AccGroup" />
                <asp:BoundField DataField="UseAccGroupTZ" HeaderText="UseAccGroupTZ" SortExpression="UseAccGroupTZ" />
                <asp:BoundField DataField="VerifyCode" HeaderText="VerifyCode" SortExpression="VerifyCode" />
                <asp:BoundField DataField="Expires" HeaderText="Expires" SortExpression="Expires" />
                <asp:BoundField DataField="ValidCount" HeaderText="ValidCount" SortExpression="ValidCount" />
                <asp:BoundField DataField="ValidTimeBegin" HeaderText="ValidTimeBegin" SortExpression="ValidTimeBegin" />
                <asp:BoundField DataField="ValidTimeEnd" HeaderText="ValidTimeEnd" SortExpression="ValidTimeEnd" />
                <asp:BoundField DataField="TimeZone1" HeaderText="TimeZone1" SortExpression="TimeZone1" />
                <asp:BoundField DataField="TimeZone2" HeaderText="TimeZone2" SortExpression="TimeZone2" />
                <asp:BoundField DataField="TimeZone3" HeaderText="TimeZone3" SortExpression="TimeZone3" />
                <asp:BoundField DataField="IDCardNo" HeaderText="IDCardNo" SortExpression="IDCardNo" />
                <asp:BoundField DataField="IDCardValidTime" HeaderText="IDCardValidTime" SortExpression="IDCardValidTime" />
                <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" />
                <asp:BoundField DataField="IDCardName" HeaderText="IDCardName" SortExpression="IDCardName" />
                <asp:BoundField DataField="IDCardBirth" HeaderText="IDCardBirth" SortExpression="IDCardBirth" />
                <asp:BoundField DataField="IDCardSN" HeaderText="IDCardSN" SortExpression="IDCardSN" />
                <asp:BoundField DataField="IDCardDN" HeaderText="IDCardDN" SortExpression="IDCardDN" />
                <asp:BoundField DataField="IDCardAddr" HeaderText="IDCardAddr" SortExpression="IDCardAddr" />
                <asp:BoundField DataField="IDCardNewAddr" HeaderText="IDCardNewAddr" SortExpression="IDCardNewAddr" />
                <asp:BoundField DataField="IDCardISSUER" HeaderText="IDCardISSUER" SortExpression="IDCardISSUER" />
                <asp:BoundField DataField="IDCardGender" HeaderText="IDCardGender" SortExpression="IDCardGender" />
                <asp:BoundField DataField="IDCardNation" HeaderText="IDCardNation" SortExpression="IDCardNation" />
                <asp:BoundField DataField="IDCardReserve" HeaderText="IDCardReserve" SortExpression="IDCardReserve" />
                <asp:BoundField DataField="IDCardNotice" HeaderText="IDCardNotice" SortExpression="IDCardNotice" />
                <asp:BoundField DataField="IDCard_MainCard" HeaderText="IDCard_MainCard" SortExpression="IDCard_MainCard" />
                <asp:BoundField DataField="IDCard_ViceCard" HeaderText="IDCard_ViceCard" SortExpression="IDCard_ViceCard" />
                <asp:CheckBoxField DataField="FSelected" HeaderText="FSelected" SortExpression="FSelected" />--%>
                <asp:BoundField DataField="StartTime" HeaderText="Gəlmə saatı" SortExpression="StartTime" />
                <asp:BoundField DataField="EndTime" HeaderText="Çıxma saatı" SortExpression="EndTime" />
                <asp:BoundField DataField="ChckIn" HeaderText="Gəldiyi saat" SortExpression="ChckIn" />
                <asp:BoundField DataField="ChckOut" HeaderText="Çıxdığı saat" SortExpression="ChckOut" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IshCedveliConnectionString %>" SelectCommand="SELECT * FROM [NormalUserStartEndView]"></asp:SqlDataSource>
        
    </form>
</body>
</html>
