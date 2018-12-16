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
    <title>vote_checkbox</title>
    <style>
        /*------------全局--------------*/
        * {
            margin: 0;
            padding: 0;
            /*border: 1px solid #c0c0c0;*/
        }
        #main1 {
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
        form{
            margin:10px 0px 0px 18px;
        }
        td{
            line-height: 25px;
        }
        .td_span{
            font-size: 12px;
        }
        [type*="image"]{

        }
        .back_a{
        	text-decoration:none;
        }
        [src*="title_ico"]{
        	vertical-align:middle;
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
<div id="main1">
    <div class="header">
        <img src="images/logo.gif" height="43" width="400"/>
        <div class="clear"></div>
        <hr class="headerhr">
        <div class="search">
            <span class="search_span">您好,${vote_user.vuUserName}</span>
            <a class="header_a" href="LoadAction"><img class="a_image" src="images/new.gif" height="10" width="10"/><span class="text_middle">返回列表</span></a>
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
		<div><img src="images/vote_icon.gif" height="16" width="16"/><span class="title">${vote_subject.vsTitle}</span></div>
        <div class="detail">&nbsp;&nbsp;&nbsp;共有${optionNum}个选择，已有<span class="ajax_span">${voteNum}</span>个网友参与了投票。</div>
		<div class="remove">
			<c:if test="${vote_subject.vsType==0}">
		        <table>
	                <c:forEach var="vote_option" items="${vote_optionList}">
	                	<tr>
		                    <td>${vote_option.voOrder}.</td>
		                    <td><input type="checkbox" name="option${vote_option.voOrder}" value="${vote_option.voId}"  required="required">${vote_option.voOption}</td>
	                	</tr>
	                </c:forEach>
	                <tr>
	                    <td></td>
	                    <td><input type="image" src="images/button_vote.gif" class="image_vote" value="投票">&nbsp;<input  type="image" src="images/button_view.gif" value="查看"><input type="hidden" name="hidden1" value="${vote_subject.vsId}"/></td>
	                </tr>
		         </table>
			</c:if>  
			<c:if test="${vote_subject.vsType==1}">
		        <table>
	                <c:forEach var="vote_option" items="${vote_optionList}">
	                	<tr>
		                    <td>${vote_option.voOrder}.</td>
		                    <td><input type="radio" name="option" value="${vote_option.voId}"  required="required"><span class="td_span">${vote_option.voOption}</span></td>
	                	</tr>
	                </c:forEach>
	                <tr>
	                    <td></td>
	                    <td><input type="image" src="images/button_vote.gif" value="投票">&nbsp;<input  type="image" src="images/button_view.gif" value="查看"><input type="hidden" name="hidden1" value="${vote_subject.vsId}"/></td>
	                </tr>
		    	</table>
			</c:if>
		</div>
		  
    </div>

    <div class="footer">
        <p class="hui">北大青鸟&nbsp;&copy;&nbsp;版权所有</p>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.12.4.min.js"></script>
<script src="<%=basePath%>build/dist/echarts-all.js"></script>
<script>
	var optionNameList = '';
	var optionNumList = 0;
	var voteNum = 0;
	var voteNum2 = 0;
	$(document).ready(function () {
		$(".search_button").click(function(){
			var vsTitle = $(".search_input").val();
			window.location.href="SearchAction?vsTitle="+vsTitle;
		})
		
		
		$("[src*='button_vote']").click(function(){
			var voIdStr = "";
			$.each($("[name*='option']"),function(index,element){
				if(element.checked==true){
					voIdStr = voIdStr+','+element.value;
				}
			});
			var vsId = ${vote_subject.vsId};
			//var vuUserId = ${vote_user.vuUserId};
		 	$.ajax({
				type:"POST",
				url:"UpdateItemAction",
				data:"voIdStr="+voIdStr+"&vsId="+vsId,
				dataType:"json",
				async:false,
				success:function(data){
					$(".ajax_span").html(data.voteNum);
				}
			});
		});
		/* ---------------投票系统----------------- */
		$("[src*='button_view']").click(function(){
			var vsId = $(this).next().val();
			$.ajax({
				type:"POST",
				url:"AjaxEchartsAction",
				data:{"vsId":vsId},
				dataType:"json",
				async:false,
				success:function(data){
					optionNameList=data.optionNameList;
					optionNumList=data.optionNumList;
					voteNum = data.voteNum;
					voteNum2 = data.voteNum2;
					if(data!="null"&&data!=""){
						$(".remove").remove();
						var node_echarts = '<div id="Echarts" style="height:220px;width="200px;"></div>';
						node_echarts = $(node_echarts);
						$(".content").append(node_echarts);
						var node_a = '<a class="back_a" href="VoteAction?vsId=${vote_subject.vsId}"><img src="images/title_ico.gif" height="30" width="42"/>返回投票列表</a>';
						node_a = $(node_a);
						$(".content").append(node_a);
					}
				}
			});
			showchart();
		});
	});
	 // 基于准备好的dom，初始化echarts图表
	function showchart(){
		var myChart = echarts.init(document.getElementById("Echarts"));
		option = {
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		    	show:false,
		        data:['投票数']
		    },
		  	toolbox: {
		        show : true,
		        feature : {
		            mark : {show: false},
		            dataView : {show: true, readOnly: false},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		        	show:false,
		            type : 'value',
		            position: 'top',
		            splitLine: {show: false},//分隔线是否显示，不显示
		            boundaryGap : [0, 0.01],
		            axisTick: {
		                show: false
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'category',
		            splitLine: {show: false},
		            data : optionNameList,
		            axisTick: {
		                show: false
		            }
		        }
		    ],
		    series : [
		        {
		            name:'投票数',
		            type:'bar',
		            tooltip:{
		            	trigger:'item',
		            	formatter:function(params){
				        	console.log(params,ticket,callback);
				        	return params['name']+':'+params['value']+'(票)'+'<br>占比:'+(params['value']*100/voteNum2).toFixed(0)+'%'+'<br>';
				        }
		            },
		          	itemStyle :{
		          		normal: {
		    		        label : {
		    		            show: true,
		    		            position: 'right',
		    		            textStyle: {
		    		            	fontSize:15,//表示字体大小，默认为12
		    		            	fontWeight:'bold',//表示文字字体的粗细，可选'normal'，
		    		                color: '#6188AE'   // 图例文字颜色
		    		            },
		    		            formatter:function(params,ticket,callback){//图例的长度不是由这里的值决定的，这里的值只是做为显示数据用
		    		            	return callback+'(票),占比:'+(callback*100/voteNum2).toFixed(0)+'%';
		    		            }
		    		            //formatter: "{b}:{c}"
		    		        }		        
		    		    }
		          	},
		            data:optionNumList
		        }
		    ]
		};
		 // 为echarts对象加载数据 
	    myChart.setOption(option);
	};
</script>
</body>
</html>