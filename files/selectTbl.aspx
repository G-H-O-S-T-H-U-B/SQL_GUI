<%@ Page Title="" Language="C#" MasterPageFile="~/files/master.Master" AutoEventWireup="true" CodeBehind="selectTbl.aspx.cs" Inherits="SQL_GUI.files.selectTbl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        section {
            margin-top: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <%-- Create / Select Table Multiview --%>
                <div class="row">
                    <div class="col-12 px-0">
                        <asp:DropDownList runat="server" ID="drpCreateSelectSwt" CssClass="px-2 py-1 black_4 text-light fw-light border-0" AutoPostBack="true" OnSelectedIndexChanged="drpCreateSelectSwt_SelectedIndexChanged">
                            <%--<asp:ListItem Selected="True" Text="Create table" Value="0"></asp:ListItem>--%>
                            <asp:ListItem Text="Select table" Value="1"></asp:ListItem>
                           <%-- <asp:ListItem Text="Delete table" Value="2"></asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>
                </div>
                <asp:MultiView runat="server" ID="mltCreate_Select_Tbl" ActiveViewIndex="1">
                    <asp:View runat="server" ID="viewCreateTbl">
                        <%-- Craete Table --%>
                        <div class="row black_3 py-2">
                            <div class="col-12">
                                <h5 class="white">Create table
                                </h5>
                            </div>
                            <div class="col-md-3 mt-2 col-sm-4 col-6 d-flex mt-2">
                                <asp:TextBox ID="txtCreateTbl" runat="server" placeholder="Enter Table name *" CssClass="w-100 px-2 py-2 black_4 text-light fw-light border-0"></asp:TextBox>
                            </div>
                            <div class="col-md-3 mt-2 col-sm-4 col-6 d-flex mt-2">
                                <asp:Button runat="server" ID="btnCreateTbl" CssClass="btn btn-primary" Text="Create" OnClick="btnCreateTbl_Click" />
                            </div>
                        </div>
                    </asp:View>

                    <asp:View runat="server" ID="viewSelectTbl">
                        <%-- Select Table --%>
                        <div class="row black_3 py-2">
                            <div class="col-12">
                                <h5 class="white">Select table
                                </h5>
                            </div>
                            <div class="col-md-3 mt-2 col-sm-4 col-6 d-flex mt-2">
                                <asp:DropDownList runat="server" ID="drpSelectTbl" CssClass="w-100 px-2 py-2 black_4 text-light fw-light border-0">
                                    <asp:ListItem Selected="True" Text="-- Select Table -- *" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3 mt-2 col-sm-4 col-6 d-flex mt-2">
                                <asp:Button runat="server" ID="btnSelectTbl" CssClass="btn btn-primary" Text="Select" OnClick="btnSelectTbl_Click" />
                            </div>
                        </div>
                    </asp:View>

                    <asp:View runat="server" ID="viewDelTbl">
                        <%-- Delete Table --%>
                        <div class="row black_3 py-2">
                            <div class="col-12">
                                <h5 class="white">Delete table
                                </h5>
                            </div>
                            <div class="col-md-3 mt-2 col-sm-4 col-6 d-flex mt-2">
                                <asp:DropDownList runat="server" ID="drpDelTbl" CssClass="w-100 px-2 py-2 black_4 text-light fw-light border-0">
                                    <asp:ListItem Selected="True" Text="-- Select Table -- *" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3 mt-2 col-sm-4 col-6 d-flex mt-2">
                                <asp:Button runat="server" ID="btnDelTbl" CssClass="btn btn-primary" Text="Delete" OnClick="btnDelTbl_Click" />
                            </div>
                        </div>
                    </asp:View>
                </asp:MultiView>


                <%-- Gridview start --%>
                <asp:Panel runat="server" ID="panel" CssClass="row black_3 py-2 mt-4">
                    <div>
                        <h6 class="white">Table Preview
                        </h6>
                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="tblPreview" CssClass="table table-bordered border-dark" AutoGenerateColumns="true" ShowHeaderWhenEmpty="true" HeaderStyle-CssClass="bg-white text-dark fw-bold text-nowrap" AlternatingRowStyle-CssClass="black_4 text-white" RowStyle-CssClass="black_3 text-white fw-light">
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel runat="server" ID="panel1" CssClass="row black_3 py-2 mt-4  d-none">
                    <div>
                        <h6 class="white">Table Preview
                        </h6>
                        <div class="table-responsive small">
                            <asp:GridView runat="server" ID="tblSchema" CssClass="table table-bordered border-light" AutoGenerateColumns="true" ShowHeaderWhenEmpty="true" HeaderStyle-CssClass="black_1 white fw-bold text-nowrap" AlternatingRowStyle-CssClass="black_4 text-white" RowStyle-CssClass="black_3 text-white">
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>
    </section>
</asp:Content>
