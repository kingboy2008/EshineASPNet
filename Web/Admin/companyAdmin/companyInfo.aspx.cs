﻿using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_companyAdmin_companyInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("companyUpdate.aspx?newcompany=yes");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //StringBuilder strsql = new StringBuilder();
        //strsql.Append("select * from tab_customers where");
        //strsql.AppendFormat(" customerName like '%{0}%' and ", this.TextBox1.Text);
        //strsql.AppendFormat(" customerCode like '%{0}%'", this.TextBox4.Text);
        string s = this.TextBox1.Text;
        string scmd = @"select * from tab_company where CompanyName like '%" + s + "%' or "
           + " Companycode like '%" + s + "%' or "
+ " CompanyShortName like '%" + s + "%' or "
+ " CompanyAbbreviation like '%" + s + "%' or "
+ " Companycode like '%" + s + "%' or "
+ " CompanyTel like '%" + s + "%'";

        this.SqlDataSource1.SelectCommand = scmd;
        this.SqlDataSource1.DataBind();
    }
    protected void ButtonEE_Click(object sender, EventArgs e)
    {
        //PublicClass pc = new PublicClass();
        //GridView1.AllowPaging = false;// turn off paging 
        //GridView1.DataSourceID = "";
        //GridView1.DataSourceID = this.SqlDataSource1.ID;
        //GridView1.DataBind();
        //DataTable list = ((DataView)this.SqlDataSource1.Select(DataSourceSelectArguments.Empty)).Table;

        //string msg = string.Empty;
        //XSSFWorkbook work = login.Export(list, "", "测试记录", out msg);

        //Response.Clear();
        //Response.ClearHeaders();
        //Response.Buffer = false;
        //Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";//ContentType;
        //Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode("MediPlusexport.xlsx", System.Text.Encoding.UTF8));

        //MemoryStream ms = new MemoryStream();
        //work.Write(ms);
        //Response.BinaryWrite(ms.ToArray());
        //work = null;
        //ms.Close();
        //ms.Dispose();
        //Response.Flush();
        //Response.End();

        ////pc.gridviewtoexcel(GridView1, "MediPlusexport");
        //GridView1.AllowPaging = true;
        //GridView1.DataSourceID = "";
        //GridView1.DataSourceID = this.SqlDataSource1.ID;

        //GridView1.DataBind();
    }
}