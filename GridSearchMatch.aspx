<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridSearchMatch.aspx.cs" Inherits="TestProj_GridSearchMatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Highlight the Search Keywords in Gridview</title>
    <style type="text/css">
        .GridviewDiv {
            font-size: 100%;
            font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif;
            color: #303933;
        }

        Table.Gridview {
            border: solid 1px #df5015;
        }

        .Gridview th {
            color: #FFFFFF;
            border-right-color: #abb079;
            border-bottom-color: #abb079;
            padding: 0.5em 0.5em 0.5em 0.5em;
            text-align: center;
        }

        .Gridview td {
            border-bottom-color: #f0f2da;
            border-right-color: #f0f2da;
            padding: 0.5em 0.5em 0.5em 0.5em;
        }

        .Gridview tr {
            color: Black;
            background-color: White;
            text-align: left;
        }

        :link, :visited {
            color: #DF4F13;
            text-decoration: none;
        }

        .highlight {
            text-decoration: none underline;
            color: black;
            background: yellow;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter UserName :
                <asp:TextBox ID="txtSearch" runat="server" />&nbsp;&nbsp;
                <asp:ImageButton ID="btnSearch" ImageUrl="~/img/sei_edit.png" runat="server" Style="top: 5px; position: relative" OnClick="btnSearch_Click" />&nbsp;&nbsp;
                <asp:ImageButton ID="btnClear" ImageUrl="~/img/sei_close.png" runat="server" Style="top: 5px; position: relative" OnClick="btnClear_Click" /><br />

            <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" Width="700px" CssClass="Gridview">
                <Columns>
                    <asp:TemplateField HeaderText="Emp No.">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpNo" Text='<%# Eval("EMP_NO") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Name">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpName" Text='<%# HighlightText(Eval("EMP_NAME").ToString()) %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Full Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFullName" Text='<%# HighlightText(Eval("EMP_NAME_P").ToString()) %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Designation">
                        <ItemTemplate>
                            <asp:Label ID="lblDesg" Text='<%# HighlightText(Eval("EMP_DES").ToString()) %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" />
                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Size="Smaller" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
