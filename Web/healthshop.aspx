﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="healthshop.aspx.cs" Inherits="healthshop" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<%@ Register TagPrefix="MPuc" TagName="headcontent" Src="UserControl/headcontent.ascx" %>
<%@ Register TagPrefix="MPuc" TagName="mobilenav" Src="UserControl/mobilenav.ascx" %>
<%@ Register TagPrefix="MPuc" TagName="desktopnav" Src="UserControl/desktopnav.ascx" %>
<%@ Register TagPrefix="MPuc" TagName="footer" Src="UserControl/footer1.ascx" %>
<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>
<!DOCTYPE html>
<html>
<head>
    <title>EshineAspNet -
        <asp:Localize ID="Localize2" runat="server" Text='<%$ Resources:GResource,titletext %>'></asp:Localize></title>

    <link rel="stylesheet" href="./CSS/gb.css" type="text/css" media="screen">
    <link rel="stylesheet" href="./CSS/index.css" type="text/css" media="screen">
    <style>
        .page-wrapper {
            
            padding: 20px 0 25px;
            margin: 0 auto;
        }
        .page-order-list .order-status-wrapper {
            position: relative;
            top: 1px;
            z-index: 2;
            overflow: hidden;
            width: 1060px;
            height: 140px;
            margin: 30px auto 0;
        }
        .page-order-list .order-status-process {
            position: relative;
            width: 930px;
            height: 38px;
            margin: 33px auto 0;
            background: url(img/status-bg.png) repeat-x 0 -129px;
        }

            .page-order-list .order-status-process .status-process {
                display: block;
                height: 38px;
                background: url(img/status-bg.png) repeat-x 0 -29px;
            }
        .page-order-list .order-status-text {
            position: absolute;
            left: 0;
            top: -33px;
            width: 200px;
            height: 140px;
            line-height: 16px;
            text-align: center;
            font-size: 12px;
            color: #666;
        }

            .page-order-list .order-status-text h5 {
                font-size: 16px;
                color: #999;
            }

            .page-order-list .order-status-text .point {
                display: block;
                width: 38px;
                height: 38px;
                margin: 18px auto 5px;
                background: url(img/status-off.png) no-repeat;
            }

        .page-order-list .order-status-process .status-first span.point {
            background: url(img/status-on-first.png) no-repeat;
        }

        .page-order-list .order-status-process .status-last .point {
            background: url(img/status-off-last.png) no-repeat;
        }

        .page-order-list .order-status-process .status-on span.point {
            background: url(img/status-on.png) no-repeat;
        }

        .page-order-list .order-status-process .status-on {
            background: url(img/order-status-bottom-arrow.png) center bottom no-repeat;
        }

        .page-order-list .order-status-process .status-done .point {
            background: url(img/status-done.png) no-repeat;
        }

        .page-order-list .order-status-process .status-done h5, .page-order-list .order-status-process .status-on h5 {
            color: #333;
        }

        .page-order-list .order-status-now {
            width: 998px;
            background: #F6F6F6;
            border: #dadada solid 1px;
            border-radius: 5px;
            padding: 20px 30px;
            margin: 0 auto;
            line-height: 38px;
        }

            .page-order-list .order-status-now h3 {
                color: #666;
                font-size: 24px;
                line-height: 40px;
            }
            ul#a{ width:100%;
                     height:60px;
                      /*background:#00A2CA;*/
                      margin:0 auto} 

             ul#a li{display:inline;
                        height:60px} 
              ul#a li a{display:inline-block; 
                          padding:0 20px;
                           height:60px; 
                           line-height:60px;
                          color:#000;
                           font-family:"\5FAE\8F6F\96C5\9ED1";
                            font-size:16px} 
                /*ul#a li a:hover{background:#fff}*/
                /*设置鼠标滑过或悬停时变化的背景颜色*/ 

    </style>
    <MPuc:headcontent runat="server" ID="Unnamed1" />
    <script src="JS/mp.js" type="text/javascript"></script>
</head>
<body class='signups member_orders'>
    <MPuc:mobilenav runat="server" ID="Unnamed2" />
    <form id="Form1" runat="server">
        <div class='wrapper' data-behavior='Navigation'>
            <MPuc:desktopnav runat="server" ID="Unnamed3" />
           
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
            <div class="container signup ">
                <div class="simple_form new_signup_context" id="new_signup_context">
                     <asp:Panel ID="Panel7" runat="server" Visible="false">
                <ul id="a">
                    <li><a><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></a></li>
                </ul>
            </asp:Panel>
                   <hr />
            <asp:Panel ID="Panel8" runat="server" Visible="false">
                 <ul id="a">
                        <li><a><asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label13" runat="server" Text="Label"></asp:Label></a></li>
                    <li><a><asp:Label ID="Label14" runat="server" Text="Label"></asp:Label></a></li>
                </ul>
            </asp:Panel>
                    <asp:Panel ID="Panel6" class="choose_level tile " runat="server" Visible="false">
                        <div class='row'>
                            <div class='twelvecol'>
                        <h3>您的购物车是空的。</h3>
                        <asp:Button ID="Button3" runat="server" Text="去逛逛" OnClick="Button3_Click" />
                                </div>
                            </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel4" class="ic_content" runat="server">


                        <div class="fx_content fx_rwd" style="background-color: #fbfbfb;">

                            <div class="fx_grid_c1 fx_mod_prolist">

                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnDataBinding="Repeater1_DataBinding">
                                    <ItemTemplate>

                                        <div class="fx_mod_proitem">
                                            <a class="fx_mod_pinfo hide">
                                                <span class="info" type="6"><%# DataBinder.Eval(Container.DataItem,"type")%></span>
                                                <span><%# DataBinder.Eval(Container.DataItem,"productDate","{0:MM-dd}")%></span>
                                                <i class="icon6"></i>
                                            </a>
                                            <a target="_blank" href="viewshopitem_multi.aspx?productID=<%# DataBinder.Eval(Container.DataItem,"productID")%>" class="fx_mod_proitem_img">
                                                <img src="<%# DataBinder.Eval(Container.DataItem,"downlimit")%>" alt="">
                                                <b></b>
                                            </a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                            <div class="fx_mod_proitem_tit">
                                                <p class="sPrice noimport" style="text-align: left;font-size:12px;">
                                                    <span><asp:Localize ID="Localize2" runat="server" Text='<%$ Resources:GResource,promoteprice %>'></asp:Localize>：￥</span> <%# DataBinder.Eval(Container.DataItem,"productUnitPrice")%><br />
                                                    <span style="text-decoration: line-through; font-size: 10px;"><asp:Localize ID="Localize8" runat="server" Text='<%$ Resources:GResource,pricetype %>'></asp:Localize>：￥ <%# DataBinder.Eval(Container.DataItem,"productMarketPrice")%></span>

                                                </p>
                                                <h4><a href='viewshopitem_multi.aspx?productID=<%# DataBinder.Eval(Container.DataItem,"productID")%>' target="_blank" ytag="50021"><%# DataBinder.Eval(Container.DataItem,"productName")%></a></h4>
                                            </div>

                                            <%--<p class="fx_mod_proitem_cont">
                                                <a href='viewshopitem_multi.aspx?productID=<%# DataBinder.Eval(Container.DataItem,"productID")%>' target="_blank" ytag="50031"><%# DataBinder.Eval(Container.DataItem,"productContent")%></a>
                                            </p>--%>
                                            <p class="fx_mod_proitem_cont" style="margin-top: 3px;">
                                                <asp:HyperLink ID="HyperLink1" Target="_blank" ytag="50031" runat="server"><%# DataBinder.Eval(Container.DataItem,"productContent")%></asp:HyperLink>
                                            </p>
                                            <div class="fx_mod_proitem_view hide">
                                                <div class="new_mod_action">
                                                    <ul class="clear">
                                                        <li class="new_mod_action_item">

                                                            <a href='?productID=<%# DataBinder.Eval(Container.DataItem,"productID")%>' class="">
                                                                <img src="Images/buynow.jpg" /></a>
                                                        </li>
                                                        <li class="new_mod_action_item share_leave hidden">
                                                            <a href="javascript:;" class="new_mod_action_share">分享</a>
                                                            <div class="new_mod_popshare hide">
                                                                <ul>
                                                                    <li><a id="weibo" share="http://itemlink" t="生活就应多彩" href="javascript:;" class="new_ico_wb">分享到微博</a></li>
                                                                    <li><a id="qzone" share="http://itemlink" t="生活就应多彩" href="javascript:;" class="new_ico_qzone">分享到QQ空间</a></li>
                                                                </ul>
                                                                <i></i>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                        <div class="fixed_button hidden" id="paybuttondiv" style="z-index: 99999">

                            <div class="spinner"></div>
                            <asp:Localize ID="Localize5" runat="server" Text='已选择'></asp:Localize>
                            <asp:TextBox ID="TextBox2" runat="server" Style="background-color: transparent; position: relative; border-style: none; width: 65px; text-align: center;" ForeColor="#FF5500" Font-Size="20px"></asp:TextBox>
                            <asp:Localize ID="Localize6" runat="server" Text='件物品'></asp:Localize>&nbsp;
    <asp:Button class="button blue_button continue continue_form" ID="Button2"
        runat="server" Text='<%$ Resources:GResource,viewcart %>' OnClick="Button2_Click" />

                            <p class="terms"></p>
                        </div>
                    </asp:Panel>







                    <asp:Panel class="choose_level tile " ID="Panel1" runat="server" Visible="false">
                        <div class='row'>
                            <div class='twelvecol'>
                                <h2 style="display: none">
                                    <asp:Localize ID="Localize9" runat="server" Text='<%$ Resources:GResource,shopcart %>'></asp:Localize></h2>
                                <div class="page-wrapper page-order-list">
                            <div class="order-status-process" style="width: 372px">
                                <span class="status-process" style="width: 0px;"></span>
                                <div class="order-status-text status-first status-on" style="width: 186px; height: 90px; left: -93px;">
                                    <h5><asp:Localize ID="Localize7" runat="server" Text='<%$ Resources:GResource,xuanze %>'></asp:Localize></h5>
                                    <span class="point"></span>
                                </div>
                                <div class="order-status-text" style="width: 186px; height: 90px; left: 93px;">
                                    <h5><asp:Localize ID="Localize10" runat="server" Text='<%$ Resources:GResource,tianxie %>'></asp:Localize></h5>
                                    <span class="point"></span>
                                </div>
                                <div class="order-status-text status-last" style="width: 186px; height: 90px; left: 279px;">
                                    <h5><asp:Localize ID="Localize11" runat="server" Text='<%$ Resources:GResource,queren %>'></asp:Localize></h5>
                                    <span class="point"></span>
                                </div>
                            </div>
                        </div>
                                
                                
                                <%--<h2>
                                    <img src="Images/shopstep1.jpg" /></h2>--%>
                                <div id="your_trunks1">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
                                                <Columns>
                                                    <asp:ImageField DataImageUrlField="productImg" ControlStyle-Width="60px" ControlStyle-Height="60px">
                                                        <ControlStyle Height="60px" Width="60px" />
                                                    </asp:ImageField>
                                                    <asp:HyperLinkField DataNavigateUrlFields="productID"
                                                        DataNavigateUrlFormatString="~/viewshopitem_multi.aspx?productID={0}" DataTextField="productName"
                                                        HeaderText='<%$ Resources:GResource,productname %>' Target="_blank" />
                                                    <asp:BoundField DataField="productUnitPrice" HeaderText='<%$ Resources:GResource,unitprice %>' />
                                                    <asp:TemplateField HeaderText='<%$ Resources:GResource,quantity %>'>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="-" ImageUrl="~/Images/minus.jpg" ImageAlign="Middle" />
                                                            <asp:TextBox ID="num" runat="server" Width="25px" Text="0" onchange="updatePrice();" class="uniprice"></asp:TextBox>
                                                            <asp:ImageButton ID="ImageButton2" runat="server" AlternateText="+" ImageUrl="~/Images/plus.jpg" ImageAlign="Middle" />
                                                            <asp:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" Maximum="10" Minimum="0" TargetButtonUpID="ImageButton2" TargetButtonDownID="ImageButton1" TargetControlID="num"></asp:NumericUpDownExtender>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText='<%$ Resources:GResource,totalamount %>'>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="amt" runat="server" Width="50" Text="0" class="pricediv" Style="text-align: center" Enabled="False"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>


                                </div>
                            </div>
                        </div>

                        <div class="fixed_button " id="paybuttondiv" style="z-index: 99999">

                            <div class="spinner"></div>
                            <asp:Localize ID="Localize3" runat="server" Text='<%$ Resources:GResource,total %>'></asp:Localize>
                            <asp:TextBox ID="TextBox1" runat="server" Style="background-color: transparent; position: relative; border-style: none; width: 80px; text-align: center;" ForeColor="#FF5500" Font-Size="20px"></asp:TextBox>
                            <asp:Localize ID="Localize4" runat="server" Text='<%$ Resources:GResource,Yuan %>'></asp:Localize>&nbsp;
    <asp:Button class="button blue_button continue continue_form" ID="Button11"
        runat="server" Text='<%$ Resources:GResource,payment %>' OnClick="Button11_Click" />

                            <p class="terms"></p>
                        </div>
                    </asp:Panel>


                    <asp:Panel class="choose_level tile " ID="Panel2" runat="server" Visible="False">
                        <h2 style="display: none">
                            <asp:Localize ID="Localize1" runat="server" Text='<%$ Resources:GResource,shippinginfo %>'></asp:Localize></h2>


                        <div class="page-wrapper page-order-list">
                            <div class="order-status-process" style="width: 372px">
                                <span class="status-process" style="width: 186px;"></span>
                                <div class="order-status-text status-first status-done" style="width: 186px; height: 90px; left: -93px;">
                                    <h5><asp:Localize ID="Localize12" runat="server" Text='<%$ Resources:GResource,xuanze %>'></asp:Localize></h5>
                                    <span class="point"></span>
                                </div>
                                <div class="order-status-text status-on" style="width: 186px; height: 90px; left: 93px;">
                                    <h5><asp:Localize ID="Localize13" runat="server" Text='<%$ Resources:GResource,tianxie %>'></asp:Localize></h5>
                                    <span class="point"></span>
                                </div>
                                <div class="order-status-text status-last" style="width: 186px; height: 90px; left: 279px;">
                                    <h5><asp:Localize ID="Localize14" runat="server" Text='<%$ Resources:GResource,queren %>'></asp:Localize></h5>
                                    <span class="point"></span>
                                </div>
                            </div>
                        </div>

                        <%--<h2>
                            <img src="Images/shopstep2.jpg" /></h2>--%>
                        <div class='row'>
                            <div class="threecol"></div>
                            <div class="fivecol" style="text-align: left">
                                <asp:TextBox ID="TextBoxPA" runat="server" class="hidden paperaddr"></asp:TextBox>
                                <asp:Panel ID="Panel3" runat="server">
                                </asp:Panel>
                                <div>
                                    <asp:RadioButton ID="RadioButton7" runat="server" GroupName="reportaddr" Text='<%$ Resources:GResource,tobelowaddr %>' />
                                </div>
                                <div id="newaddress" style="<% =addrclass %>">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="three_input_grouping">
                                                <div class="input month_select required">
                                                    <asp:DropDownList ID="com_Province1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="com_Province1_SelectedIndexChanged"
                                                        class="month_select required customSelect">
                                                        <asp:ListItem Text='<%$ Resources:GResource,selectProvince %>'></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="input select required">
                                                    <asp:DropDownList ID="com_City1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="com_City1_SelectedIndexChanged"
                                                        class="month_select required customSelect">
                                                        <asp:ListItem Text='<%$ Resources:GResource,selectCity %>'></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="input select required">
                                                    <asp:DropDownList ID="com_Area1" runat="server" class="select required customSelect">
                                                        <asp:ListItem Text='<%$ Resources:GResource,selectZone %>'></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </ContentTemplate>

                                    </asp:UpdatePanel>

                                    <div class="input string required">
                                        <asp:TextBox class="string" ID="TextBox7" runat="server" placeholder='<%$ Resources:GResource,detailAddress %>'></asp:TextBox>
                                    </div>
                                    <div class="two_input_grouping">
                                        <div class="input string required">
                                            <asp:TextBox class="string tel required numeric" ID="TextBox8" runat="server" placeholder='<%$ Resources:GResource,recipient %>'></asp:TextBox>
                                        </div>
                                        <div class="input string required">
                                            <asp:TextBox class="string tel required numeric" ID="TextBox9" runat="server" type="tel" MaxLength="11" minlength="11" onkeypress="if (event.keyCode<48 || event.keyCode>57) event.returnValue=false;" placeholder='<%$ Resources:GResource,mobilenumber %>'></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="fourcol last" style="background-color: white"></div>


                        </div>
                        <div class="fixed_button " id="Div1">
                            <asp:Button class="button blue_button continue continue_form" ID="Button1"
                                runat="server" Text='<%$ Resources:GResource,submit %>' OnClick="Button1_Click" OnClientClick="return checkform2();" />

                        </div>
                    </asp:Panel>
                </div>
            </div>

        </div>
    </form>
    <script>
        function checkform2() {
          
            var r7 = document.getElementById("<%=RadioButton7.ClientID%>");

            if (r7.checked) {

                var s1 = document.getElementById("<%=com_Province1.ClientID%>").value;
                var s2 = document.getElementById("<%=com_City1.ClientID%>").value;
                var s3 = document.getElementById("<%=com_Area1.ClientID%>").value;
                var t7 = document.getElementById("<%=TextBox7.ClientID%>").value;
                var t8 = document.getElementById("<%=TextBox8.ClientID%>").value;
                var t9 = document.getElementById("<%=TextBox9.ClientID%>").value;

                if (s1 == '<asp:Localize runat="server" Text="<%$ Resources:GResource,selectProvince %>"></asp:Localize>'
                || s2 == '<asp:Localize runat="server" Text="<%$ Resources:GResource,selectCity %>"></asp:Localize>'
            || s3 == '<asp:Localize runat="server" Text="<%$ Resources:GResource,selectZone %>"></asp:Localize>') {
                    alert('<asp:Localize runat="server" Text="<%$ Resources:GResource,selectCity %>"></asp:Localize>');
                    return false;
                }
                else if (t7 == "") {
                    alert('<asp:Localize runat="server" Text="<%$ Resources:GResource,alertneedreportaddr %>"></asp:Localize>');
                return false;
            }
            else if (t8 == "") {
                alert('<asp:Localize runat="server" Text="<%$ Resources:GResource,alertneedrecipient %>"></asp:Localize>');
                return false;
            }
            else if (t9 == "") {
                alert('<asp:Localize runat="server" Text="<%$ Resources:GResource,alertneedrecipienttel %>"></asp:Localize>');
                return false;
            }
            else {
                document.getElementById("<%=TextBoxPA.ClientID%>").value = s1 + s2 + s3 + t7 + "," + t8 + "," + t9;
            }
}
    return true;
}
function updateValue() {
    if (document.getElementById("2").value != 'undefined') {
        document.getElementById("3").value = document.getElementById("2").value;
    }
}
$(document).ready(function () {
    $(".uniprice").change(function () {

        var rowIndex = this.parentElement.parentElement.rowIndex;

        var sum = 0;
        $('.pricediv').each(function () {
            sum += Number($(this).val());
        });
        $('#<%=TextBox1.ClientID %>').val(sum);
        if (sum > 0) {
            $('#paybuttondiv').fadeIn();
        }
        else {
            $('#paybuttondiv').fadeOut();
        }

        //$.ajax({
        //    type: "Post",
        //    url: "healthshop.aspx/updateitemsseesion",
        //    //方法传参的写法一定要对，str为形参的名字,str2为第二个形参的名字
        //    data: "",
        //                contentType: "application/json; charset=utf-8",
        //                dataType: "json",
        //                success: function (data) {
        //                    //返回的数据用data.d获取内容

        //                },
        //     error: function (err) {
        //         alert(err);
        //     }
        // });

        $.post("updatecart.aspx",
           {
               matchProCode: rowIndex,
               nums: $(this).val()
           },
            function (data, status) {
                if (status == "success") {

                    //gridview1.rows[rowIndex].cells[5].innerText = "¥" + toDecimal2(subtotal);
                    //gridview1.rows[rowIndex].cells[5].getElementsByTagName("span")[1].innerText = toDecimal2(subtotal);
                    //更新总计
                    //var prototal = document.getElementById("< %=lblProTotal.ClientID%>");
                    //prototal.innerText = toDecimal2(parseFloat(prototal.innerText) + (parseFloat(subtotal) - parseFloat(oldsubtotal)));
                }
                else {
                    alert(status);
                }
            });

    });

    $("[name=reportaddr]").click(function () {
        if ($(this).next().text() == '<asp:Literal runat="server" Text="<%$ Resources:GResource,tobelowaddr %>" />') {
            $("#newaddress").fadeIn();
            $(".paperaddr").val("");
        }
        else {
            $(".paperaddr").value = "";
            $("#newaddress").fadeOut();
            if ($(this).next().text().substring(0, 3) == '<asp:Literal runat="server" Text="<%$ Resources:GResource,Toaddress %>" />') {
                $(".paperaddr").val($(this).next().text().substring(3, $(this).next().text().length - 3));
            }
            else {
                $(".paperaddr").val($(this).next().text());
            }
        }
    });
});
    </script>

    <asp:Panel ID="Panel5" runat="server" Visible="false">
        <footer>
<div class='footer_wrapper'>



<DIV>
<P>
    <asp:Localize ID="Localize15" runat="server" Text='<%$ Resources:GResource,productyunfei %>'></asp:Localize>
</P>
<P>
   </P>
    <br /> <br /> 
</DIV>



</div>
</footer>

    </asp:Panel>


</body>
</html>
