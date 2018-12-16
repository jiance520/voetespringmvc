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
    <title>subjectlist</title>
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
        [src*="vote_icon"]{
             vertical-align: middle;
         }
        .hr_div_padding{
            padding: 8px;
        }
        .hr_div_padding:nth-of-type(even){
            background-color: #E5E5BF;
        }
        .dt_title{
            color: #297FD2;
            font:bold 16px/28px 宋体;
            vertical-align: middle;
        }
        .dl_dl_dd{
            font-size: 12px;
        }
        [src*="edit"]{
            vertical-align: middle;
        }
        .join_a{
        	text-decoration:none;
        }
        .right_span{
            font-size: 12px;
            vertical-align: middle;
        }
        .dl_left{
            float: left;
            /*width: 500px;*/
        }
        .div_right{
            line-height: 40px;
            float: right;
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
            <a class="header_a" href="LoadAction"><img class="a_image" src="images/new.gif" height="10" width="10"/><span class="text_middle">返回列表</span></a>
            <a  class="header_a" href="add_vote.jsp"><img class="a_image" src="images/addnew.gif" height="12" width="13"/><span class="text_middle">添加新投票系统</span></a>
            <a  class="header_a" href="ModifyLoadAction"><img class="a_image" src="images/edit.gif" height="16" width="16"/><span class="text_middle">维护</span></a>
            <span class="search_a"><input class="search_input" name="vsTitle" type="text">&nbsp;<input class="search_button" type="button" value="搜索"></span>
        </div>
    </div>

    <div class="content">
        <div>
            <img src="images/title_ico.gif" height="35" width="35"/>&nbsp;
            <span class="con_header_span">投票列表</span>
        </div>
        <hr>
        <c:forEach var="subjectMap" items="${subjectListMap}">
        	 <div class="hr_div_padding">
	            <dl class="dl_left">
	                <dt><img src="images/vote_icon.gif" height="16" width="16"/>
	                    <span class="dt_title">${subjectMap.vote_subject.vsTitle}</span>
	                </dt>
	                <dd class="dl_dl_dd">&nbsp;&nbsp;&nbsp;&nbsp;共有${subjectMap.optionNum}个选择，已有${subjectMap.voteNum}个网友参与了投票</dd>
	            </dl>
	            <div class="div_right">
	                <a href="DeleteAction?vsId=${subjectMap.vote_subject.vsId}" class="join_a">
                		<span class="right_span">删除</span>
                	</a>
	                <a href="ModifyAction?vsId=${subjectMap.vote_subject.vsId}" class="join_a">
                		<img src="images/edit.gif" height="16" width="16"/>
                		<span class="right_span">维护</span>
                	</a>
	            </div>
            	<div class="clear"></div>
        	</div>
        	<hr>
        </c:forEach>
    </div>


    <div class="footer">
        <p class="hui">北大青鸟&nbsp;&copy;&nbsp;版权所有</p>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script>
    $(document).ready(function () {
		$(".search_button").click(function(){
			var vsTitle = $(".search_input").val();
			window.location.href="SearchAction?vsTitle="+vsTitle;
		})
    });
</script>

</body>
</html>