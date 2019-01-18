<%@ Page Language="C#" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script runat="server">




    protected void Page_Load(object sender, EventArgs e)
    {


    }


    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "test")
        {
            this.Label1.Text = DateTime.Now.ToString();
            this.Panel1_ModalPopupExtender.Show();
        }
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">
        .modalBackground
        {
            position: absolute;
            z-index: 100;
            top: 0px;
            left: 0px;
            background-color: #000;
            filter: alpha(opacity=60);
            -moz-opacity: 0.6;
            opacity: 0.6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1"
        onitemcommand="ListView1_ItemCommand">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("BankName") %>' />
                </td>
                <td>
                    <asp:Label ID="valueLabel" runat="server" Text='<%# Eval("BankCode") %>' />
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton3" CommandName="test" runat="server">TEST</asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                    name
                                </th>
                                <th runat="server">
                                    value
                                </th>
                                <th runat="server">
                                    MPE
                                </th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [Banks]"></asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Text="Button"  />
    <asp:Panel ID="Panel1" runat="server" Width="300" Height="300" BackColor="White"  BorderWidth="3" style="display:none">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server">OK</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2"  runat="server">Cancel</asp:LinkButton>
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" PopupControlID="Panel1"
        DynamicServicePath="" Enabled="True" TargetControlID="Button1" OkControlID="LinkButton1"
        CancelControlID="LinkButton2" BackgroundCssClass="modalBackground">
    </ajaxToolkit:ModalPopupExtender>

    </form>
</body>
</html>