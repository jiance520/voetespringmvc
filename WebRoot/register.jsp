<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>register</title>
    <style>
        /*------------全局--------------*/
        * {
            margin: 0;
            padding: 0;
        }
        #main {
            margin: 0 auto;
            width: 800px;
            /*border: 1px solid #c0c0c0;*/
        }
        .clear{
            clear: both;
        }
        /*------------头部--------------*/
        .header{
            text-align: left;
        }
        .headerhr{
            border: 3px solid #79A4CF;
        }
        .search{
            height: 30px;
            background-color:#DAE8F5;
        }
        /*------------中部--------------*/
        .content{
            padding-top: 20px;
        }
        .register{
            width: 604px;
            height: 287px;
            border: 3px solid #79A4CF;
            margin: 0 auto;
        }
        .title{
            background-color: #79A4CF;
            height: 37px;
            color: white;
            font:bold 20px/37px 宋体;
        }
        form{
            padding-top: 30px;
            padding-left: 50px;
            font:normal 14px/36px 宋体;
        }
        .right_td{
            text-align: right;
        }
        input{
            line-height: 20px;
            border: 1px solid #79A4CF;
        }
        [src*="button_register"]{
        	margin-top:15px;
            border:none;
        }
        td{
        	padding:5px;
        }
        /*------------底部--------------*/
        .footer{
            margin-top: 30px;

        }
        .hui{
            text-align: center;
            border-top: 1px solid #7DA7D0;
            font: normal 10px 宋体;
            padding: 5px;
            color: #c2c6cb;
        }
    </style>
</head>
<body>
<div id="main">
    <div class="header">
        <img src="images/logo.gif" height="43" width="400"/>
        <div class="clear"></div>
        <hr class="headerhr">
        <div class="search"></div>
    </div>

    <div class="content">
        <div class="register">
            <p class="title">&nbsp;新用户注册</p>
            <form action="RegisterAction" class="form" method="post">
                <table>
                    <tr>
                        <td class="right_td">用户ID:</td>
                        <td><input type="text" name="vuUserId" required="required"></td>
                    </tr>
                    <tr>
                        <td class="right_td">用户名:</td>
                        <td><input type="text" name="vuUserName" required="required"></td>
                    </tr>
                    <tr>
                        <td class="right_td">密码:</td>
                        <td><input type="password" name="vuPassword" required="required"></td>
                    </tr>
                    <tr>
                        <td class="right_td">确认密码:</td>
                        <td><input type="password" name="vuPassword2" required="required"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="image" src="images/button_register.gif"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>


    <div class="footer">
        <p class="hui">北大青鸟&nbsp;&copy;&nbsp;版权所有</p>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script>
    $(document).ready(function () {

    });
</script>

</body>
</html>