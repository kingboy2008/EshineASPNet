﻿<%@ Page Language="C#" AutoEventWireup="true" validateRequest="false" CodeFile="healthshopinfo.aspx.cs" Inherits="Admin_discriptionAdmin_healthshopinfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta charset="utf-8" />
    <link rel="stylesheet" href="../../kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../../kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="../../kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="../../kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../../kindeditor/plugins/code/prettify.js"></script>
	<script>
	    KindEditor.ready(function (K) {
	        var editor1 = K.create('#content1', {
	            cssPath: '../../kindeditor/plugins/code/prettify.css',
	            uploadJson: '../../kindeditor/asp.net/upload_json.ashx',
	            fileManagerJson: '../../kindeditor/asp.net/file_manager_json.ashx',
	            allowFileManager: true,
	            afterCreate: function () {
	                var self = this;
	                K.ctrl(document, 13, function () {
	                    self.sync();
	                    K('form[name=example]')[0].submit();
	                });
	                K.ctrl(self.edit.doc, 13, function () {
	                    self.sync();
	                    K('form[name=example]')[0].submit();
	                });
	            }
	        });
	        prettyPrint();
	    });
	</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td class="title" colspan="5">
                    静态文本编辑</td>
            </tr>
        </table>
        <br>
        <table border="0" cellpadding="0" cellspacing="0" class="adminContent" style="width: 100%">
                    <tr>
                        <td align="right"  style="width: 80px; height: 24px;">
                            <asp:Label ID="Label1" runat="server" Text="编辑标题：" Width="120px"></asp:Label></td>
                        <td align="left" style="width: 130px; height: 24px;">
                            <asp:TextBox ID="TextBox1" runat="server" Visible="False" Width="120"></asp:TextBox>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource1" DataTextField="title" DataValueField="title" 
                                Width="120px" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:db_ConnectionString %>" 
                                SelectCommand="SELECT [title] FROM [tab_news] WHERE ([discription] = @discription)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="健康商城" Name="discription" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </td>
                        <td width="120" >
                            <asp:Button ID="Button3" runat="server" Text="删除" onclick="Button3_Click" />&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" Text="新增" onclick="Button2_Click" />
                            </td>
                            <td width="1020" >
                            </td>
                    </tr>
                    <tr>
                        <td >
                            </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" class="adminContent" style="width: 100%">
                <tr>
                <td align="left">
                    <textarea id="content1" cols="100" rows="8" style="width:700px;height:400px;visibility:hidden;" runat="server"></textarea>
        <br />
        <asp:Button ID="Button1" runat="server" Text="提交内容" onclick="Button1_Click" /> (提交快捷键: Ctrl + Enter)
                
                </td>
                </tr>
                </table>
                    

    </div>
    </form>
</body>
</html>
