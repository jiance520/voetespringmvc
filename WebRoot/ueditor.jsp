<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ueditor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>/ueditor/ueditor.all.min.js"> </script>
    <link href="<%=basePath%>/ueditor/themes/default/css/ueditor.css" rel="stylesheet"><!--非必须 导入js或者css的顺序一定不要互换，-->
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>/ueditor/lang/zh-cn/zh-cn.js"></script>

  </head>
  
  <body>
<!--     <form action="javasript:viod(0)" name="upfile" method="post">
    	<table>
    		<tr>
    			<td><textarea name="content" id="content" style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
    		</tr>
    		<tr>
    			<td><input class="submit" type="submit" value="提交"/></td>
    		</tr>
    	</table>
    </form> -->
    <textarea name="content" id="content" style="width: 800px; height: 400px; margin: 0 auto;"></textarea>
    <input class="submit" type="button" value="提交"/>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var ue = UE.getEditor('content');
	ue.ready(function() {
		$(".submit").click(function(){
		var html = ue.getContent();
			$("body").append($(html));
			ue.setHide();
		});
	});			
		});
	</script>
  </body>
</html>
