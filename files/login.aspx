<%@ Page Title="" Language="C#" MasterPageFile="~/files/master.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SQL_GUI.files.login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        section {
            margin-top: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container py-5">
        <div class="row">
            <div class="col-12 p-5" style="background-color: var(--black_3  );">
                <center>
                    <h3 class="text-light">Login in to your Account
                    </h3>
                    <div class="mt-5">
                        <asp:TextBox ID="txtUsername" CssClass="py-2 px-3 rounded-3" runat="server" placeholder="User Name"></asp:TextBox>
                    </div>
                    <div class="mt-2">
                        <asp:TextBox ID="txtPass" CssClass="py-2 px-3 rounded-3" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="mt-2">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary px-5" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                    <br />
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold" Text=""></asp:Label>
                </center>
            </div>
        </div>
    </section>
</asp:Content>
