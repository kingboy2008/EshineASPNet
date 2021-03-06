﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Xml;
using System.Security.Cryptography;

public partial class fetchpassword2 : System.Web.UI.Page
{
    Model.tab_customers modelCu = new Model.tab_customers();
    Bll.CustomerBll Cb = new Bll.CustomerBll();
    PublicClass pc = new PublicClass();
    
    //MD5加密程序（32位小写）
    private static string md5(string str)
    {
        byte[] result = Encoding.Default.GetBytes(str);
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] output = md5.ComputeHash(result);
        String md = BitConverter.ToString(output).Replace("-", "");
        return md.ToLower();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        DataTable dt = Cb.CustomerSelect("select customerID from tab_customers where customerMobile='" +
           this.TextBox2.Text+ "' and customerIDcard='"+ this.TextBox3.Text + "'");

        if (dt.Rows.Count > 0)
        {
            string pw = pc.MakePassword(6);
            modelCu.customerID = Convert.ToInt32( dt.Rows[0]["customerID"]);
            modelCu = Cb.getCustomer(modelCu);
            modelCu.customerPwd = pc.md5(pw);
            Cb.update(modelCu);

            pc.addlog(this.TextBox2.Text, pw, "", "", "用户短信获取密码", "");

            //sendsms(pw);//发送短信

            this.Panel1.Visible = true;
            this.Panel5.Visible = false;
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "message", " <script>alert('" + (string)GetGlobalResourceObject("GResource", "alertwrongmobileid") + "')</script>");
        }
    }

    
}