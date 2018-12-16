<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>/editor/themes/default/default.css">
	<link rel="stylesheet" href="<%=basePath%>/editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=basePath%>/editor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath%>/editor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=basePath%>/editor/plugins/code/prettify.js"></script>
	<script type="text/javascript">
	 //简单模式初始化
    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="content"]', {
            resizeType : 1,
            allowPreviewEmoticons : false,
            allowImageUpload : false,
            items : [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
        });
    });

        /* editor.sync();//同步数据才能获取值
        var htmlData = $("#editor_id").val();
        alert(htmlData);
        $(".button").click(function(){
        	$("body").append($(htmlData));
        }); */

  </head>
  
  <body>
	<input type="button" class="button" value="提交"/>
	 <textarea id="editor_id" name="content" style="width:700px;height:300px;">&lt;strong&gt;HTML内容&lt;strong&gt;</textarea>
  </body>
</html>
