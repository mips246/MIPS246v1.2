<%-- <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/normalize/8.0.1/normalize.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>教师修改密码</title>
    
    <script>
        $(document).ready(function(){
        	var id = '<%=session.getAttribute("userid")%>'; 
        	$("#updatePwd").on("click",function(){
            	var oldpwd = $("#old_password").val();
            	var newpwd = $("#password").val();
            	var confirmpwd = $("#confirm_password").val();
            	if(confirmpwd!=newpwd){
            		alert("输入的两次新密码必须一致！");
            	}
            	else{
            		updatePwd(id,oldpwd,newpwd);
            	}
            })
        })
    </script>
    
    <script type="text/javascript">
    function updatePwd(id,oldpwd,newpwd){
    	var msg=["密码修改失败！","密码修改成功！"];
    	$.ajax({    
            url:"/MIPS246/TeacherServlet",//servlet文件的名称  
            type:"POST",
            dataType:"json",
            data:{
                method:"updatePwd",
                userid:id,
            	oldPassword:oldpwd,
            	newPassword:newpwd
            },
            success:function(data){
            	//var message = data.message;
            	//alert(message);
            	//console.log(typeof data);
            	//data = eval("("+data+")");
            	//data = eval(data);
            	var json = JSON.stringify(data);
            	if(json.indexOf("success") != -1){
            		alert("密码修改成功！");
            	}
            	else{
            		alert("密码修改失败！");
            	}
            	//alert(json);
            	//var obj = JSON.parse(json);
            	//alert(json["message"]);
            	//alert(data["message"]);
            	/*if(data["message"]=="success"){
            		alert(msg[1]);
            	}
            	else{
            		alert(msg[0]);
            	}*/
            	document.location.replace('../logout.jsp');
            },
            error:function(jqXHR, textStatus, errorThrown){
            	alert("error！");
            	document.location.replace('../logout.jsp');
            }
        });
    }
    </script>
    
</head>
<body>
    <div class="container clearf">
        <div class="container clearf">
            <div class="top-nav clearf">
                <div class="fl">
                    <div class="item">
                        <a href="teacher.jsp"><button type="button" class="btn btn-primary">首页</button></a>
                    </div>
                    <div class="item">
                        <a href="teacher_course.jsp"><button type="button" class="btn btn-primary">课程管理</button></a>
                    </div>
                </div>
                <div class="fr">
                	<div class="item">
                        <a href="updatepw.jsp"><button type="button" class="btn btn-primary">修改密码</button></a>
                    </div>
                    <div class="item">
                        <a href="../logout.jsp"><button type="button" class="btn btn-primary">退出</button></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container clearf">
        	<h3>修改密码</h3>
        	原密码：<input id="old_password" name="old_password" type="password"><br>
        	新密码：<input id="password" name="password" type="password"><br>
        	确认密码：<input id="confirm_password" name="confirm_password" type="password"><br>
        	<button id="updatePwd" type="submit">提交修改</button>
        </div>
    </div>
</body>
</html> --%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
	<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <title>教师修改密码</title>
    
    <script>
        $(document).ready(function(){
        	var id = '<%=session.getAttribute("userid")%>'; 
        	$("#updatePwd").on("click",function(){
            	var oldpwd = $("#old_password").val();
            	var newpwd = $("#password").val();
            	var confirmpwd = $("#confirm_password").val();
            	if(confirmpwd!=newpwd){
            		alert("输入的两次新密码必须一致！");
            	}
            	else{
            		updatePwd(id,oldpwd,newpwd);
            	}
            })
        })
    </script>
    
    <script type="text/javascript">
    function updatePwd(id,oldpwd,newpwd){
    	var msg=["密码修改失败！","密码修改成功！"];
    	$.ajax({    
            url:"/MIPS246/TeacherServlet",//servlet文件的名称  
            type:"POST",
            dataType:"json",
            data:{
                method:"updatePwd",
                userid:id,
            	oldPassword:oldpwd,
            	newPassword:newpwd
            },
            success:function(data){
            	//var message = data.message;
            	//alert(message);
            	//console.log(typeof data);
            	//data = eval("("+data+")");
            	//data = eval(data);
            	var json = JSON.stringify(data);
            	if(json.indexOf("success") != -1){
            		alert("密码修改成功！");
            	}
            	else{
            		alert("密码修改失败！");
            	}
            	//alert(json);
            	//var obj = JSON.parse(json);
            	//alert(json["message"]);
            	//alert(data["message"]);
            	/*if(data["message"]=="success"){
            		alert(msg[1]);
            	}
            	else{
            		alert(msg[0]);
            	}*/
            	//document.location.replace('../logout.jsp');
            	top.location.replace('../logout.jsp');
            },
            error:function(jqXHR, textStatus, errorThrown){
            	alert("error！");
            	//document.location.replace('../logout.jsp');
            	top.location.replace('../logout.jsp');
            }
        });
    }
    </script>
    
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
        	<div class="col-sm-3">
        	</div>
        	<div class="col-sm-6">
        		<div class="ibox float-e-margins">
        			
        			<div class="ibox-title">
		        		<h3>修改密码</h3>
		        	</div>
		        	
		        	<div class="ibox-content">
		        		<div class="form-horizontal m-t">
		        			<div class="form-group">
				        		<label class="col-sm-3 control-label">原密码：</label>
				        		<div class="col-sm-8">
				        			<input id="old_password" name="old_password" type="password" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">新密码：</label>
				        		<div class="col-sm-8">
				        			<input id="password" name="password" type="password" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">确认密码：</label>
				        		<div class="col-sm-8">
				        			<input id="confirm_password" name="confirm_password" type="password" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<div class="col-sm-8 col-sm-offset-3">
				        			<button id="updatePwd" type="submit" class="btn btn-primary">提交修改</button>
				        		</div>
				        	</div>
			        	</div>
		        	</div>
	        	</div>
        	</div>
        </div>
    </div>
    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../js/content.min.js?v=1.0.0"></script>
    <script src="../js/plugins/validate/jquery.validate.min.js"></script>
    <script src="../js/plugins/validate/messages_zh.min.js"></script>
    <script src="../js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>