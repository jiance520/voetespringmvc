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
    <title>show_vote</title>
    <style>
        /*------------全局--------------*/
        * {
            margin: 0;
            padding: 0;
            /*border: 1px solid #c0c0c0;*/
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
            background-color:#DAE8F5;
            padding: 4px;
        }
        .header_a{
            display: inline-block;
            vertical-align: middle;
            text-decoration: none;
            padding-left: 30px;
            padding-right: 30px;
        }
        .a_image{
            vertical-align: middle;
        }
        .text_middle{
            font-size: 12px;
            vertical-align: middle;
        }
        .search_span{
            font-size: 14px;
            display: inline-block;
            vertical-align: middle;
        }
        .search_a{
            padding-left: 100px;
            font-size: 14px;
            display: inline-block;
            vertical-align: middle;
        }
        .search_button{
            background-color: #F9F9F9;
            cursor: pointer;
        }
        .search_input{
            border: 1px solid #79A4CF;
            line-height: 20px;
        }
        /*------------中部--------------*/
        .content{
            padding-top: 20px;
        }
        [src*="title_ico"]{
            vertical-align: middle;
        }
        .con_header_span{
            font:bold 16px/35px 宋体;
            vertical-align: middle;
        }
        .title{
            font:bold 14px/30px 宋体;
            vertical-align: middle;
        }
        [src*="vote_icon"]{
            vertical-align: middle;
        }
        .detail{
            font: normal 12px/30px 宋体;
        }

        [type*="checkbox"]{
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
        <div class="search">
            <span class="search_span">您好,${vote_user.vuUserName}</span>
            <a class="header_a" href="LoginAction"><img class="a_image" src="images/new.gif" height="10" width="10"/><span class="text_middle">返回列表</span></a>
            <a  class="header_a" href="add_vote.jsp"><img class="a_image" src="images/addnew.gif" height="12" width="13"/><span class="text_middle">添加新投票系统</span></a>
            <a  class="header_a" href="ModifyLoadAction"><img class="a_image" src="images/edit.gif" height="16" width="16"/><span class="text_middle">维护</span></a>
            <span class="search_a"><input class="search_input" type="text">&nbsp;<input class="search_button" type="button" value="搜索"></span>
        </div>
    </div>

    <div class="content">
        <div>
            <img src="images/title_ico.gif" height="35" width="35"/>&nbsp;
            <span class="con_header_span">参与投票</span>
        </div>
        <div><img src="images/vote_icon.gif" height="16" width="16"/><span class="title">wre</span></div>
        <div class="detail">&nbsp;&nbsp;&nbsp;共有2个选择，已有0个网友参与了投票。</div>
        <div>
            <p><div></div><span>1票&nbsp;26%</span></p>
            <p><div></div><span>1票&nbsp;26%</span></p>
            <p><div></div><span>1票&nbsp;26%</span></p>
        </div>
        <div><img src="images/goback.gif" height="30" width="42"/><span class="blue">返回投票列表</span></div>
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