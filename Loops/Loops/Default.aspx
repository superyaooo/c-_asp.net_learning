﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Loops._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    void Page_Load(Object s,EventArgs e)
    {
        int counter = 10;

        //while (counter <= 10)
        //{
        //    messageLabel.Text = counter.ToString();
        //    counter++;
        //}

        do
        {
            messageLabel.Text = counter.ToString();
            counter++;
        }
        while (counter <= 10);
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="messageLabel" runat="server" />
    </div>
    </form>
</body>
</html>
