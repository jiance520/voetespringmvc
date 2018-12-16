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
    <title>update_vote</title>
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
        .register{
            width: 604px;
           /*  height: 287px; */
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
        td{
        	padding:5px;
        }
        .right_td_radio,.right_td{
            text-align: right;
        }
        .content [type*="text"]{
            line-height: 20px;
            border: 1px solid #79A4CF;
            width: 250px;
        }
        [src*="button_register"]{
            border:none;
        }


        [src*="button_submit"]{
            vertical-align: middle;
            border:none;
        }
        .a_button,.a_cancel{
            text-decoration: none;
            vertical-align: middle;
            font-size: 12px;
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
            <span class="search_span">您好${vote_user.vuUserName}</span>
            <a class="header_a" href="LoadAction"><img class="a_image" src="images/new.gif" height="10" width="10"/><span class="text_middle">返回列表</span></a>
            <a  class="header_a" href="add_vote.jsp"><img class="a_image" src="images/addnew.gif" height="12" width="13"/><span class="text_middle">添加新投票系统</span></a>
            <a  class="header_a" href="ModifyLoadAction"><img class="a_image" src="images/edit.gif" height="16" width="16"/><span class="text_middle">维护</span></a>
            <span class="search_a"><input class="search_input" type="text">&nbsp;<input class="search_button" type="button" value="搜索"></span>
        </div>
    </div>

    <div class="content">
        <div class="register">
            <p class="title">&nbsp;修改投票</p>
            <form action="UpdateSubjectAction?vsId=${vote_subject.vsId}" class="form" method="post">
                <table>
                    <tr>
                        <td class="right_td">投票内容:</td>
                        <td><input type="text" name="vsTitle" value="${vote_subject.vsTitle}" required="required"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="right_td_radio">投票类型:</td>
                        <td><input type="radio" class="one" name="vsType" required="required" value="1">单选<input type="radio" class="two" name="vsType" value="0">多选</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="right_td">投票选项:</td>
                        <td><input type="text" name="${vote_optionList[0].voId}" value="${vote_optionList[0].voOption}" required="required"></td>
                        <td></td>
                    </tr>
                    <c:forEach var="vote_option" begin="1" items="${vote_optionList}">
                    	<tr>
	                    	<td class="right_td"></td>
	                        <td><input type="text" name="${vote_option.voId}" value="${vote_option.voOption}" required="required"></td>
	                        <td>&nbsp;<a class="remove_tr" href="javascript:void(0)">删除</a></td>
	                    </tr>
                    </c:forEach>
                    <tr>
                        <td></td>
                        <td><input type="image" src="images/button_submit.gif">&nbsp;<a class="a_button" href="javascript:void(0)">增加选项</a>&nbsp;<a class="a_cancel" href="javascript:void(0)">取消操作</a></td>
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
var node;
var batNode;
var flag;
    $(document).ready(function () {
    	$(".search_button").click(function(){
			var vsTitle = $(".search_input").val();
			window.location.href="SearchAction?vsTitle="+vsTitle;
		})
    	
		var vsType = ${vsType};
		if(vsType==1){
			$(".one").attr('checked',true);
		}
		else{
			$(".two").attr('checked','true');
		}
		/* 增加选项 */
		$(document).on("click",".a_button",function(){
			var optionNode =
				'<tr><td class="right_td"></td>'+
	            '<td><input type="text" name="voOptionAdd" value="${vote_option.voOption}" required="required"></td>'+
	            '<td>&nbsp;<a class="remove_tr" href="javascript:void(0)">删除</a></td></tr>';
	            optionNode = $(optionNode);
				$(this).parent().parent().before(optionNode);
				node = optionNode;//保存增加的节点。
	           //batNode = node.prev();//增加后，再保存其前一个节点。
	            flag = 0;//标记改为0==增加
			});
		/* 删除选项 */
		$(document).on("click",".remove_tr",function(){
			var optionNode = $(this).parent().parent();
			node = optionNode; //把要删除的节点转字符串保存到变量bat
			batNode = optionNode.prev();//在删除前，保存被删除元素的上一个元素，用来下一次撤销
			flag = 1;//标记用来判断是增加还是删除
			optionNode.remove();
		});
		/* 撤销，添加/删除原节点，只恢复最近的一次，恢复后清空 */
		$(document).on("click",".a_cancel",function(){
			if(!(node==undefined || node == "" || node == null)){
				if(flag==1){
					batNode.after(node);//把删除的节点恢复
				}
				else if(flag == 0){
					node.remove();//把增加的节点删除。
				}
				node="";
			}
		});
    });
</script>

</body>
</html>