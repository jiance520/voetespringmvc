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
    <title>login</title>
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
            text-align: center;
        }
        /*------------头部--------------*/
        .header{
            text-align: left;
        }
        /*------------中部--------------*/
        .content{
            text-align: left;
            margin-top: 10px;
            margin-bottom: 70px;
        }
        .background{
            height: 154px;
            background-color: #79A4CF;
            border-radius: 5px;
            position: relative;
        }

        .bdqn{
            color: white;
            font:bold 14px 宋体;
        }
        .dcxt{
            color: white;
            font:normal 12px 宋体;
        }
        [src*="voteBanner"]{
            float: left;
        }
        /*------------登陆部分--------------*/
        .login{
            border: 1px solid #c0c0c0;
            height: 180px;
            width: 240px;
            position: absolute;
            background-color: white;
            left: 480px;
            top:-23px;
            padding:10px;
        }
        table{
        }
        td{
            padding: 5px;
            font: normal 12px 宋体;
            line-height: 30px;
        }
        .td_right{
        	text-align:right;
        }
        input{
            border: 1px solid #7DA7D0;
        }
        .userlogin{
            font:bold 16px/30px 宋体 ;
            color: #3E638D;
        }
        [src*="arrow_down"],[src*="button_login"]{
            vertical-align:middle;
        }
        [src*="button_login"]{
            border:none;
        }
        .absolute{
            position: absolute;
            text-decoration: none;
            font-weight: bold;
            color: black;
            left: 103px;
            top:132px;
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
    </div>

    <div class="content">
        <div class="background">
            <img src="images/voteBanner.jpg" height="154" width="179"/>
            <br>
            &nbsp;&nbsp;<span class="bdqn">北大青鸟</span><br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;<span class="dcxt">网上调查系统</span>

            <div class="login">
                <p class="userlogin">用户登陆&nbsp;<img src="images/arrow_down.gif" height="4" width="7"/></p>
                <hr>
                <fmt:setBundle basename="message"/>
                <form action="ValidateLogin" method="post" name="form1">
                	<jsp:include page="token.jsp"></jsp:include>
                   <table>
                        <!-- <tr>
                        	<td class="td_right">用户名：</td>
                            <td><input type="text" name="vuUserName" required="required"></td>
                        </tr>
                        <tr>
                       		<td class="td_right">密码：</td>
                            <td><input type="password" name="vuPassword" required="required"></td>
                        </tr>
                        <tr>
                        	<td></td>
                            <td><input type="image" src="images/button_login.gif"/><a class="absolute" href="javascript:document.form1.submit()">登 陆</a>&nbsp;<a href="register.jsp">新用户注册</a></td>
                        </tr> -->
                        <tr>
                        	<td class="td_right"><fmt:message key="vuUserName"/>:</td>
                            <td><input type="text" name="vuUserName" required="required"></td>
                        </tr>
                        <tr>
                       		<td class="td_right"><fmt:message key="vuPassword"/>:</td>
                            <td><input type="password" name="vuPassword" required="required"></td>
                        </tr>
                        <tr>
                        	<td></td>
                            <td><input type="image" src="images/button_login.gif"/><a class="absolute" href="javascript:document.form1.submit()">登 陆</a>&nbsp;<a href="register.jsp">新用户注册</a></td>
                        </tr>
                    </table>
                </form>
            </div>
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