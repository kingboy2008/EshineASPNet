﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RelativesDetails.aspx.cs" Inherits="RelativesDetails" %>

<%@ Register TagPrefix="MPuc" TagName="headcontent" Src="UserControl/headcontent.ascx"%>
<%@ Register TagPrefix="MPuc" TagName="mobilenav" Src="UserControl/mobilenav.ascx"%>
<%@ Register TagPrefix="MPuc" TagName="desktopnav" Src="UserControl/desktopnav.ascx"%>
<%@ Register TagPrefix="MPuc" TagName="footer" Src="UserControl/footer1.ascx"%>
<!DOCTYPE html>
<html>
<head>
<title>EshineAspNet - <asp:Localize ID="Localize1" runat="server" Text='<%$ Resources:GResource,titletext %>'></asp:Localize></title>
<MPuc:headcontent runat="server" ID="Unnamed1"/>
<SCRIPT src="JS/mp.js" type="text/javascript"></SCRIPT>
</head>
<body class='member_profiles member_orders'>
<MPuc:mobilenav runat="server" ID="Unnamed2"/>
    <form runat="server">
<div class='wrapper' data-behavior='Navigation'>
<MPuc:desktopnav runat="server" ID="Unnamed3"/>


<div class='container'>
<h2><asp:Localize ID="Localize28" runat="server" Text='<%$ Resources:GResource,relativedetail %>'></asp:Localize></h2>
<div class='edit_profile row' data-behavior='Tabs'>
<div class='twocol'>
<div id='errors'></div>
<div id='tabs'>
<ul class='tabs'>
<li class=''>
<a href="PersonalDetails.aspx"><asp:Localize ID="Localize27" runat="server" Text='<%$ Resources:GResource,personaldetail %>'></asp:Localize></a>
</li>
<li class='active'>
<a href="RelativesDetails.aspx"><asp:Localize ID="Localize30" runat="server" Text='<%$ Resources:GResource,relativedetail %>'></asp:Localize></a>
</li>
<li class=''>
<a href="addressmanaging.aspx"><asp:Localize ID="Localize2" runat="server" Text='<%$ Resources:GResource,addressmanagement %>'></asp:Localize></a>
</li>
</ul>

</div>
</div>
<div class='tencol last tile' id='forms'>

<div class='tab' id='addresses'>
<div class='row'>
<div class='twelvecol'>
<div  id='your_trunks1' >
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" 
        DataKeyNames="relativeID" DataSourceID="SqlDataSource1" >
        <Columns>
        <asp:HyperLinkField DataNavigateUrlFields="relativeID" DataNavigateUrlFormatString="RelativesDetails.aspx?Cid={0}"
                    DataTextField="relativeName" HeaderText="姓名"  
                SortExpression="relativeName" meta:resourcekey="HyperLinkFieldResource1" />
            <asp:BoundField DataField="relativeRelationship" 
                HeaderText="关系" SortExpression="relativeRelationship" 
                meta:resourcekey="BoundFieldResource1" />
            <asp:BoundField DataField="arrangestatus" HeaderText="预约状态" ReadOnly="True"  Visible="false"
                SortExpression="arrangestatus" meta:resourcekey="BoundFieldResource3" />
                <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server"  Visible="false"
                            meta:resourcekey="HyperLink1Resource1">预约体检</asp:HyperLink>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete"  
                            OnClientClick='<%$ Resources:GResource,alertsurecancel %>' 
                            meta:resourcekey="LinkButton2Resource1">删除</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_ConnectionString %>" 
        SelectCommand="SELECT [relativeName], [relativeRelationship], [relativeDOB], [relativeID],(CASE WHEN exists(select * from tab_orders where relativeID=tab_relatives.relativeID and (orderstatus='已预约' or orderstatus='已体检')) then '已预约' 
             else '未预约' END) as arrangestatus FROM [tab_relatives] WHERE ([relativeCustomer] = @relativeCustomer)" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [tab_relatives] WHERE [relativeID] = @original_relativeID" 
        InsertCommand="INSERT INTO [tab_relatives] ([relativeName], [relativeRelationship], [relativeDOB]) VALUES (@relativeName, @relativeRelationship, @relativeDOB)" 
        OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE [tab_relatives] SET [relativeName] = @relativeName, [relativeRelationship] = @relativeRelationship, [relativeDOB] = @relativeDOB WHERE [relativeID] = @original_relativeID AND (([relativeName] = @original_relativeName) OR ([relativeName] IS NULL AND @original_relativeName IS NULL)) AND (([relativeRelationship] = @original_relativeRelationship) OR ([relativeRelationship] IS NULL AND @original_relativeRelationship IS NULL)) AND (([relativeDOB] = @original_relativeDOB) OR ([relativeDOB] IS NULL AND @original_relativeDOB IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_relativeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="relativeName" Type="String" />
            <asp:Parameter Name="relativeRelationship" Type="String" />
            <asp:Parameter DbType="Date" Name="relativeDOB" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="relativeCustomer" SessionField="id" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="relativeName" Type="String" />
            <asp:Parameter Name="relativeRelationship" Type="String" />
            <asp:Parameter DbType="Date" Name="relativeDOB" />
            <asp:Parameter Name="original_relativeID" Type="Int32" />
            <asp:Parameter Name="original_relativeName" Type="String" />
            <asp:Parameter Name="original_relativeRelationship" Type="String" />
            <asp:Parameter DbType="Date" Name="original_relativeDOB" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</div>
<br /><br />
<table style="width: 100%; height: 4px;" bgcolor="#eaeff5">
    <tr><td></td></tr>
    </table>
<br /><br />
<div class='left sixcol' id='add_new_address'>
<div class="simple_form new_address_context">
<div class="input string required">
<label class="string required" for="address_context_recipient_name">
<asp:Localize  runat="server"  Text="姓　　名" meta:resourcekey="Localize3Resource1"></asp:Localize></label>
<asp:TextBox class="string required" ID="TextBox1" runat="server" placeholder='<%$ Resources:Localize3Resource1.Text%>' ></asp:TextBox>
</div>
<DIV class="input string required">
<LABEL class="string required" for="signup_context_first_name">
<asp:Localize runat="server" Text="身份证号" meta:resourcekey="Localize7Resource1"></asp:Localize></LABEL>
    <asp:TextBox class="string required" ID="TextBox3" runat="server" placeholder='<%$ Resources:Localize7Resource1.Text%>' onblur="javascript:cidInfo(this.value);" MaxLength="18" ></asp:TextBox>
    <asp:TextBox ID="TextBox6" runat="server" Visible="false"></asp:TextBox>
</DIV>



<DIV id="email_warning"></DIV>
<DIV class="input string required">
<LABEL class="string required" for="signup_context_first_name">
<asp:Localize ID="Localize9" runat="server"  Text="联系电话" meta:resourcekey="Localize9Resource1"></asp:Localize></LABEL>
    <asp:TextBox class="string tel required numeric" ID="TextBox4" runat="server" type="tel" maxlength="11" minlength="11" placeholder='<%$ Resources:Localize9Resource1.Text%>'></asp:TextBox>
</DIV>


</div>

</div>
<div class='right sixcol last' id='stored_addresses'>
<div class="simple_form new_address_context">
<DIV class="four_input_grouping">
<DIV class="input month_select required">
<LABEL class="month_select required" for="signup_context_birth_month">
<asp:Localize ID="Localize6" runat="server" Text="与员工关系" meta:resourcekey="Localize6Resource1"></asp:Localize></LABEL>
  <div>  <asp:RadioButton ID="RadioButton14" runat="server" GroupName="rs" Text="配偶" meta:resourcekey="RadioButton14Resource1" /></div>
</DIV>
<DIV class="input month_select required">
<LABEL class="month_select required" for="signup_context_birth_date"> &nbsp;</LABEL>
<div>
<asp:RadioButton ID="RadioButton15" runat="server" GroupName="rs" Text="子女"  meta:resourcekey="RadioButton15Resource1" /></div>
</DIV>
<DIV class="input month_select required">
<LABEL class="month_select required" for="signup_context_birth_year"> &nbsp;</LABEL>
 <div>   <asp:RadioButton ID="RadioButton16" runat="server" GroupName="rs" Text="父母" meta:resourcekey="RadioButton16Resource1" /></div>
</DIV>
<DIV class="input month_select required">
<LABEL class="month_select required" for="signup_context_birth_year"> &nbsp;</LABEL>
 <div>   <asp:RadioButton ID="RadioButton17" runat="server" GroupName="rs" Text="其他" meta:resourcekey="RadioButton17Resource1" /></div>
</DIV>
</DIV>
<DIV class="three_input_grouping">
<DIV class="input month_select required">
<LABEL class="month_select required" for="signup_context_birth_month">
<asp:Localize ID="Localize14" runat="server" Text="出生日期" meta:resourcekey="Localize5Resource1"></asp:Localize></LABEL>
    <asp:DropDownList ID="DropDownListYear" class="select required customSelect" runat="server">
        <asp:ListItem Text='<%$ Resources:GResource,year %>'></asp:ListItem>
<asp:ListItem>2012</asp:ListItem>
<asp:ListItem>2011</asp:ListItem>
<asp:ListItem>2010</asp:ListItem>
<asp:ListItem>2009</asp:ListItem>
<asp:ListItem>2008</asp:ListItem>
<asp:ListItem>2007</asp:ListItem>
<asp:ListItem>2006</asp:ListItem>
<asp:ListItem>2005</asp:ListItem>
<asp:ListItem>2004</asp:ListItem>
<asp:ListItem>2003</asp:ListItem>
<asp:ListItem>2002</asp:ListItem>
<asp:ListItem>2001</asp:ListItem>
<asp:ListItem>2000</asp:ListItem>
<asp:ListItem>1999</asp:ListItem>
<asp:ListItem>1998</asp:ListItem>
<asp:ListItem>1997</asp:ListItem>
<asp:ListItem>1996</asp:ListItem>
<asp:ListItem>1995</asp:ListItem>
<asp:ListItem>1994</asp:ListItem>
<asp:ListItem>1993</asp:ListItem>
<asp:ListItem>1992</asp:ListItem>
<asp:ListItem>1991</asp:ListItem>
<asp:ListItem>1990</asp:ListItem>
<asp:ListItem>1989</asp:ListItem>
<asp:ListItem>1988</asp:ListItem>
<asp:ListItem>1987</asp:ListItem>
<asp:ListItem>1986</asp:ListItem>
<asp:ListItem>1985</asp:ListItem>
<asp:ListItem>1984</asp:ListItem>
<asp:ListItem>1983</asp:ListItem>
<asp:ListItem>1982</asp:ListItem>
<asp:ListItem>1981</asp:ListItem>
<asp:ListItem>1980</asp:ListItem>
<asp:ListItem>1979</asp:ListItem>
<asp:ListItem>1978</asp:ListItem>
<asp:ListItem>1977</asp:ListItem>
<asp:ListItem>1976</asp:ListItem>
<asp:ListItem>1975</asp:ListItem>
<asp:ListItem>1974</asp:ListItem>
<asp:ListItem>1973</asp:ListItem>
<asp:ListItem>1972</asp:ListItem>
<asp:ListItem>1971</asp:ListItem>
<asp:ListItem>1970</asp:ListItem>
<asp:ListItem>1969</asp:ListItem>
<asp:ListItem>1968</asp:ListItem>
<asp:ListItem>1967</asp:ListItem>
<asp:ListItem>1966</asp:ListItem>
<asp:ListItem>1965</asp:ListItem>
<asp:ListItem>1964</asp:ListItem>
<asp:ListItem>1963</asp:ListItem>
<asp:ListItem>1962</asp:ListItem>
<asp:ListItem>1961</asp:ListItem>
<asp:ListItem>1960</asp:ListItem>
<asp:ListItem>1959</asp:ListItem>
<asp:ListItem>1958</asp:ListItem>
<asp:ListItem>1957</asp:ListItem>
<asp:ListItem>1956</asp:ListItem>
<asp:ListItem>1955</asp:ListItem>
<asp:ListItem>1954</asp:ListItem>
<asp:ListItem>1953</asp:ListItem>
<asp:ListItem>1952</asp:ListItem>
<asp:ListItem>1951</asp:ListItem>
<asp:ListItem>1950</asp:ListItem>
<asp:ListItem>1949</asp:ListItem>
<asp:ListItem>1948</asp:ListItem>
<asp:ListItem>1947</asp:ListItem>
<asp:ListItem>1946</asp:ListItem>
<asp:ListItem>1945</asp:ListItem>
<asp:ListItem>1944</asp:ListItem>
<asp:ListItem>1943</asp:ListItem>
<asp:ListItem>1942</asp:ListItem>
<asp:ListItem>1941</asp:ListItem>
<asp:ListItem>1940</asp:ListItem>
<asp:ListItem>1939</asp:ListItem>
<asp:ListItem>1938</asp:ListItem>
<asp:ListItem>1937</asp:ListItem>
<asp:ListItem>1936</asp:ListItem>
<asp:ListItem>1935</asp:ListItem>
<asp:ListItem>1934</asp:ListItem>
<asp:ListItem>1933</asp:ListItem>

    </asp:DropDownList>
    
</DIV>
<DIV class="input select required">
<LABEL class="select required" for="signup_context_birth_date"> &nbsp;</LABEL>
<asp:DropDownList ID="DropDownListMonth" class="month_select required customSelect" runat="server">
   <asp:ListItem Text='<%$ Resources:GResource,month %>'></asp:ListItem>
<asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>11</asp:ListItem>
<asp:ListItem>12</asp:ListItem>

    </asp:DropDownList>
</DIV>
<DIV class="input select required">
<LABEL class="select required" for="signup_context_birth_year"> &nbsp;</LABEL>
    <asp:DropDownList ID="DropDownListDay" class="select required customSelect" runat="server">
     <asp:ListItem Text='<%$ Resources:GResource,day %>'></asp:ListItem>
<asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>11</asp:ListItem>
<asp:ListItem>12</asp:ListItem>
<asp:ListItem>13</asp:ListItem>
<asp:ListItem>14</asp:ListItem>
<asp:ListItem>15</asp:ListItem>
<asp:ListItem>16</asp:ListItem>
<asp:ListItem>17</asp:ListItem>
<asp:ListItem>18</asp:ListItem>
<asp:ListItem>19</asp:ListItem>
<asp:ListItem>20</asp:ListItem>
<asp:ListItem>21</asp:ListItem>
<asp:ListItem>22</asp:ListItem>
<asp:ListItem>23</asp:ListItem>
<asp:ListItem>24</asp:ListItem>
<asp:ListItem>25</asp:ListItem>
<asp:ListItem>26</asp:ListItem>
<asp:ListItem>27</asp:ListItem>
<asp:ListItem>28</asp:ListItem>
<asp:ListItem>29</asp:ListItem>
<asp:ListItem>30</asp:ListItem>
<asp:ListItem>31</asp:ListItem>
    </asp:DropDownList>
</DIV></DIV>
<div class="two_input_grouping">
<div class="input string required">
<LABEL class="string required hidden" for="signup_context_first_name">
<asp:Localize  runat="server"  Text="性别" meta:resourcekey="Localize4Resource1"></asp:Localize></LABEL>
<p class="field switch">
        <asp:RadioButton ID="RadioButton1" runat="server" Text="男"  class="hidden" GroupName="sex" />
        <asp:RadioButton ID="RadioButton2" runat="server" Text="女" class="hidden" GroupName="sex" />
		<label id="malelabel" for="<%=RadioButton1.ClientID%>" class="cb-enable <%=classmale %>"><span>
        <asp:Localize ID="Localize4" runat="server" Text='<%$ Resources:GResource,male %>'></asp:Localize></span></label>
		<label id="femalelabel" for="<%=RadioButton2.ClientID%>" class="cb-disable <%=classfemale %>"><span>
        <asp:Localize ID="Localize5" runat="server" Text='<%$ Resources:GResource,female %>'></asp:Localize></span></label>
	</p>
</div>
<DIV class="input string required">
    <p class="field switch">
        <asp:RadioButton ID="RadioButton3" runat="server" Text="未婚" class="hidden" GroupName="Marriage" />
        <asp:RadioButton ID="RadioButton4" runat="server" Text="已婚" class="hidden" GroupName="Marriage" />
		<label for="<%=RadioButton3.ClientID%>" class="cb-enable <%=classunmarried %>"><span>
        <asp:Localize ID="Localize7" runat="server" Text='<%$ Resources:GResource,unmarried %>'></asp:Localize></span></label>
		<label for="<%=RadioButton4.ClientID%>" class="cb-disable <%=classmarried %>"><span>
        <asp:Localize ID="Localize3" runat="server" Text='<%$ Resources:GResource,married %>'></asp:Localize></span></label>
	</p>

</DIV>
</div>


<div class='buttons'>

<asp:Button ID="Button2" class="button blue_button" runat="server" Text="更新家属信息" onclick="Button2_Click"  Visible="False"
        meta:resourcekey="Button2Resource2" />
        <asp:Button ID="Button1" class="button bluedark_button" runat="server" Text="确认添加" onclick="Button1_Click" 
        meta:resourcekey="Button1Resource2" />
<asp:Button ID="Button3" class="button blue_button" runat="server" Text="新增家属" onclick="Button3_Click" Visible="False"
        meta:resourcekey="Button3Resource2" />
</div>

</div>

</div>
</div>

</div>


</div>
</div>
</div>
    </div>
</form>

<MPuc:footer ID="ucfooter" runat="server"/>
<script type="text/javascript">


    var TextBox3 = document.getElementById("<%=TextBox3.ClientID%>");
    var TextBox6 = document.getElementById("<%=TextBox6.ClientID%>");
    var RadioButton1 = document.getElementById("<%=RadioButton1.ClientID%>");
    var RadioButton2 = document.getElementById("<%=RadioButton2.ClientID%>");
    var aCity = { 11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古", 21: "辽宁", 22: "吉林", 23: "黑龙江 ", 31: "上海", 32: "江苏", 33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南", 42: "湖北 ", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆", 51: "四川", 52: "贵州", 53: "云南", 54: "西藏 ", 61: "陕西", 62: "甘肃", 63: "青海", 64: "宁夏", 65: "新疆", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外 " }

    function cidInfo(sId) {
        var iSum = 0
        var info = ""
        if (!/^\d{17}(\d|X|x)$/.test(sId)) {
            alert('<asp:Localize runat="server" Text="<%$ Resources:GResource,alertneedfullid %>"></asp:Localize>');
            TextBox3.focus();
            return;
        }
        sId = sId.replace(/x$/i, "a");
        if (aCity[parseInt(sId.substr(0, 2))] == null) { alert('Error:<asp:Localize runat="server" Text="<%$ Resources:GResource,alertwrongzone %>"></asp:Localize>'); TextBox3.focus(); return; }
        sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2)) + "-" + Number(sId.substr(12, 2));
        var d = new Date(sBirthday.replace(/-/g, "/"))
        if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) { alert('Error:<asp:Localize runat="server" Text="<%$ Resources:GResource,alertwrongDOB %>"></asp:Localize>'); TextBox3.focus(); return; }
        for (var i = 17; i >= 0; i--) iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11)
        if (iSum % 11 != 1) { alert('Error:<asp:Localize runat="server" Text="<%$ Resources:GResource,alertwrongIDnum %>"></asp:Localize>'); TextBox3.focus(); return; }

        var d = new Date();
        age = d.getYear() - sId.substr(6, 4);

        var dy = document.getElementById("<%=DropDownListYear.ClientID%>");
        var dm = document.getElementById("<%=DropDownListMonth.ClientID%>")
        var dd = document.getElementById("<%=DropDownListDay.ClientID%>")
        var index;
        for (var j = 0; j < dy.options.length; j++) {
            if (dy.options[j].text == sId.substr(6, 4)) {
                index = j;
                break;
            }
        }
        if (index > 0) {
            dy.options[index].selected = true;
            dm.options[Number(sId.substr(10, 2))].selected = true;
            dd.options[Number(sId.substr(12, 2))].selected = true;
        }
        var ml=document.getElementById("malelabel");
        var fl=document.getElementById("femalelabel");
        if (sId.substr(16, 1) % 2) {
            RadioButton1.checked = true;
            ml.className = "cb-enable  selected";
            fl.className = "cb-disable ";
        }
        else {
            RadioButton2.checked = true;
            ml.className = "cb-enable";
            fl.className = "cb-disable selected";
        }
    }


</script>
</body>
</html>

