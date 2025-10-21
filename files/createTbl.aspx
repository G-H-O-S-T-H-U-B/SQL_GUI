<%@ Page Title="" Language="C#" MasterPageFile="~/files/master.Master" AutoEventWireup="true" CodeBehind="createTbl.aspx.cs" Inherits="SQL_GUI.files.createTbl" %>

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
            <div class="col-12 px-0 d-flex justify-content-end">
                <asp:DropDownList runat="server" ID="drpCreateSelectSwt" CssClass="px-2 py-1 black_4 text-light fw-light border-0" AutoPostBack="true" OnSelectedIndexChanged="drpCreateSelectSwt_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Text="Create table" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Select table" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Delete table" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <asp:MultiView runat="server" ID="mltCreate_Select_Tbl" ActiveViewIndex="0">
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


        <%-- Multy view start --%>
        <div class="row mt-4">
            <div class="col-12 px-0">
                <asp:DropDownList runat="server" ID="drpColEditSwt" CssClass="px-2 py-1 black_4 text-light fw-light border-0" AutoPostBack="true" OnSelectedIndexChanged="drpColEditSwt_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Text="Add column" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Del column" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Add constrain" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Del constrain" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <asp:MultiView runat="server" ID="mltColEdit" ActiveViewIndex="0">
            <%-- Add Column --%>
            <asp:View runat="server" ID="viewAddCol">
                <div class="row black_3 py-2">
                    <div class="col-12">
                        <h5 class="white">Add column
                        </h5>
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                        <asp:TextBox ID="txtColName" runat="server" placeholder="Column name *" CssClass="w-100 px-2 py-2 black_4 text-light fw-light border-0"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                        <asp:DropDownList runat="server" ID="drpColDatatype" CssClass="w-100 px-2 py-2 black_4 text-light fw-light border-0">
                            <asp:ListItem Selected="True" Text="-- Select Datatype -- *" Value="0"></asp:ListItem>
                            <asp:ListItem Text="String" Value="nvarchar(MAX)"></asp:ListItem>
                            <asp:ListItem Text="Integer" Value="bigint"></asp:ListItem>
                            <asp:ListItem Text="Boolean" Value="bit"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                       <asp:DropDownList runat="server" ID="drpColConstraint" CssClass="w-100 px-2 py-2 black_4 text-light fw-light border-0">
                           <asp:ListItem Text="-- Select Constraint -- *" Value="0"></asp:ListItem>
                           <asp:ListItem Text="Null" Value="null"></asp:ListItem>
                           <asp:ListItem Selected="True" Text="Not Null" Value="not null"></asp:ListItem>
                           <asp:ListItem Text="Primary Key" Value="primary key"></asp:ListItem>
                           <asp:ListItem Text="Foreign Key" Value="4"></asp:ListItem>
                           <asp:ListItem Text="Unique" Value="unique"></asp:ListItem>
                           <asp:ListItem Text="Check" Value="6"></asp:ListItem>
                           <asp:ListItem Text="Identity" Value="identity(1,1)"></asp:ListItem>
                       </asp:DropDownList>
                   </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                        <asp:Button runat="server" ID="btnAddCol" CssClass="btn btn-primary" Text="Add" OnClick="btnAddCol_Click" />
                    </div>
                </div>
            </asp:View>


            <%-- Delete Column --%>
            <asp:View runat="server" ID="viewDelCol">
                <div class="row black_3 py-2">
                    <div class="col-12">
                        <h5 class="white">Delete column
                        </h5>
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                        <asp:TextBox ID="txtDelCol" runat="server" placeholder="Column name *" CssClass="w-100 px-2 py-2 black_4 text-light fw-light border-0"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                        <asp:Button runat="server" ID="btnDelCol" CssClass="btn btn-primary" Text="Delete" OnClick="btnDelCol_Click" />
                    </div>
                </div>
            </asp:View>


            <%-- Add Constrain --%>
            <asp:View runat="server" ID="viewAddConstrain">
                <div class="row black_3 py-2">
                    <div class="col-12">
                        <h5 class="white">Add constrain
                        </h5>
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                       
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                      
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6 d-flex">
                       
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                        <asp:Button runat="server" ID="Button2" CssClass="btn btn-primary" Text="Add" OnClick="Button2_Click" />
                    </div>
                </div>
            </asp:View>


            <%-- Delete Constrain --%>
            <asp:View runat="server" ID="viewDelConstrain">
                <div class="row black_3 py-2">
                    <div class="col-12">
                        <h5 class="white">Delete constrain
                        </h5>
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                        <asp:TextBox ID="txtDelConstrain" runat="server" placeholder="Column name *" CssClass="w-100 px-2 py-2 black_4 text-light fw-light border-0"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-2 col-sm-4 col-6  d-flex">
                        <asp:Button runat="server" ID="Button1" CssClass="btn btn-primary" Text="Delete" />
                    </div>
                </div>
            </asp:View>

        </asp:MultiView>

        <%-- Gridview start --%>
        <asp:Panel runat="server" ID="panel" CssClass="row black_3 py-2 mt-4 d-none">
            <div>
                <h6 class="white">Table Preview
                </h6>
                <div class="table-responsive">
                    <asp:GridView runat="server" ID="tblPreview" CssClass="table table-bordered border-dark" AutoGenerateColumns="true" ShowHeaderWhenEmpty="true"  HeaderStyle-CssClass="bg-white text-dark fw-bold text-nowrap" AlternatingRowStyle-CssClass="black_4 text-white" RowStyle-CssClass="black_3 text-white fw-light">
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="panel1" CssClass="row black_3 py-2 mt-4">
            <div>
                <h6 class="white">Table Preview
                </h6>
                <div class="table-responsive small">
                    <asp:GridView runat="server" ID="tblSchema" CssClass="table table-bordered border-light"  AutoGenerateColumns="true" ShowHeaderWhenEmpty="true" HeaderStyle-CssClass="black_1 white fw-bold text-nowrap" AlternatingRowStyle-CssClass="black_4 text-white" RowStyle-CssClass="black_3 text-white">
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>

         </ContentTemplate>
        </asp:UpdatePanel>
    </section>

</asp:Content>
