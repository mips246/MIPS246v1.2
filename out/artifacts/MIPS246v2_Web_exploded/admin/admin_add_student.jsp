<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
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
    <title>admin_course</title>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#insertstudent").click(function(){
                var id=$("#id").val();
                var name=$("#name").val();
                var password=$("#password").val();
                console.log("进入insertstudent"+id+" "+name+" "+password);
                if (id==""){
                    alert("请输入学号");
                    //window.location.reload();
                }
				else if(name==""){
                    alert("请输入姓名");
                }
                else if(password==""){
                    password=id;
                    addStudent(id,name,password);
                }
                else{
                	addStudent(id,name,password);
                }
            })
        })
        function addStudent(id,name,password) {
        	console.log("进入addStudent")
            $.ajax({
                url:"/MIPS246/AdminStudentServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"addStudent",
                    studentid:id,
                    name:name,
                    password:password
                },
                success:function () {
                    alert("成功添加");
                    window.location.reload();
                },
                error:function () {
                    alert("添加失败");
                    window.location.reload();
                }
            });
        }
    </script>
</head>
<body class="gray-bg">
<%
request.setCharacterEncoding("GBK");
%>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-3">
        	</div>
        	<div class="col-sm-6">
        		<div class="ibox float-e-margins">
        		
				    <div class="ibox-title">
				        <h3>添加学生</h3>
				    </div>
				    
				    <div class="ibox-content">
				        <div class="form-horizontal m-t">
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">学号：</label>
				        		<div class="col-sm-8">
				        			<input id="id" name="id" type="text" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">学生姓名：</label>
				        		<div class="col-sm-8">
				        			<input id="name" name="name" type="text" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">密码：</label>
				        		<div class="col-sm-8">
				        			<input id="password" name="password" type="text" class="form-control" placeholder="不填写为默认密码，与学号相同">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<div class="col-sm-8 col-sm-offset-5">
				        			<button id="insertstudent" type="submit" class="btn btn-primary">添加学生</button>
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