<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
		<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
	    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
	    <link href="css/animate.min.css" rel="stylesheet">
	    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
		<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
		<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
		<title>文件上传结果</title>
	</head>
	
	<body>
    	<center>
       		<h2>${message}</h2><br>
       		<h2>即将返回上级页面...</h2>
       		<button class="btn btn-primary demo4" onclick="myRedirect()">点击立刻返回</button>
       		<script language="JavaScript" type="text/javascript">
		        function myRedirect(){
		        	var role = '<%=session.getAttribute("role")%>';
		        	if("teacher"==role) window.location = "teacher/teacher_upload.jsp";
		        }
		        setTimeout('myRedirect()', 3000);//第二个参数是时间，单位毫秒
	  		</script>
    	</center>
	</body>
	
	<script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    <script src="js/plugins/validate/messages_zh.min.js"></script>
    <script src="js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</html>