<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width:100%;
            padding-top:18%;
            font-size:56pt;
            text-align: center;
        }
        .h6{
            color:hotpink;
            padding-left:54.5%;
            padding-top:10px;
            font-size:15px;
        }
        #Content2{
           height:100%;
           background-color:yellow;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" CssClas="ClassHome">
    <div style="width:100%; height:100%;">
        <h1 class="auto-style3">ZKT fingerprint</h1>
        <h6 class="h6">Programmer: Jamalov Gamil</h6>
    </div>
</asp:Content>

