﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ordersAdmin_ordersshopupdate : System.Web.UI.Page
{
    Model.tab_orders orders = new Model.tab_orders();
    Bll.OrdersBll ob = new Bll.OrdersBll();
    Bll.ProductBll pb = new Bll.ProductBll();
    Model.tab_customers modeCu = new Model.tab_customers();
    Bll.CustomerBll cb = new Bll.CustomerBll();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["ordersshopid"]!=null&&Request["ordersshopid"].ToString()!="")
        {
            ViewState["ordersshopid"] = Request["ordersshopid"];
            orders.orderID = int.Parse(ViewState["ordersshopid"].ToString());
            orders = ob.getorders(orders);
            modeCu.customerID = orders.customerID;
            modeCu = cb.getCustomer(modeCu);
        }
        if(!IsPostBack)
        {
            init();
        }
    }
    void init()
    {
        TextBox5.Text = orders.orderID.ToString();
        TextBox31.Text = orders.orderDate.ToString();
        TextBox1.Text = orders.customerName;
        TextBox2.Text = modeCu.customerCompany;
        TextBox3.Text = orders.examBill.ToString();
        //TextBox6.Text = orders.deliveryno;
        
        string[] ts = orders.ReportContent.Split(';');
        string s, ss;
        int index, barindex;
        for (int i = 0; i < ts.Length; i++)
        {
            index = ts[i].IndexOf('*');
            if (index <= 0)
                continue;

            s = ts[i].Substring(0, index);
            ss = ts[i].Substring(index, ts[i].Length - index);
            if (ss == "*0")
            {
                continue;
            }

            TextBox4.Text += pb.getname(s) + pb.getcategory(s);


            if (ss.Contains("|"))
            {
                barindex = ss.IndexOf('|');
                TextBox4.Text +=ss.Substring(0, barindex)+ "\n密码：";
                TextBox4.Text += "\n" + ss.Substring(barindex + 1);
                
            }
            else
            {
                TextBox4.Text += "\n";
            }
            
        }

        DropDownList2.SelectedValue = orders.orderStatus;
        TextBox8.Text = orders.personAddress;
        TextBox25.Text = orders.Msg;
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        orders.orderDate = DateTime.Parse(TextBox31.Text);
        orders.customerName = TextBox1.Text;
        orders.examBill = int.Parse(TextBox3.Text);
        orders.orderStatus = DropDownList2.SelectedValue;
        orders.personAddress = TextBox8.Text;
        orders.Msg = TextBox25.Text;
        //orders.deliveryno = this.TextBox6.Text;
        int num =int.Parse( ob.Update(orders));
        if(num>0)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('修改成功');</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('修改失败');</script>");
        }
    }
}