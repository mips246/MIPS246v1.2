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
            $("#insertTeacher").click(function(){

                var tid 		 = $("#teacherid").val();
                var tname 		 = $("#teachername").val();
                var tpassword 	 = $("#password").val();
                var tdescription = $("#description").val();
                if(tid==""){//null是空字符串，""是没有填写该信息
                    alert("工号不能为空！");
                }
                else if(tname==""){
                    alert("姓名不能为空！");
                }
                else{
                    InsertTeacher(tid,tname,tpassword,tdescription);
                }
            })
        })
        function InsertTeacher(tid,tname,tpassword,tdescription){
        	var msg=["老师添加失败，您输入的职工号为空", "老师添加失败，您输入的职工号已存在", "老师添加成功"];
            $.ajax({
                url:"/MIPS246/AdminTeacherServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"insertTeacher",
                    teacherid:tid,
                    teachername:tname,
                    password:tpassword,
                    description:tdescription
                },
                success:function(data){
                	var statusCode = data[0].statusCode; 
                    alert(msg[statusCode]);
                    window.location.reload();
                },
                error:function(){
                    alert("添加失败！");
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
				        <h3>添加教师</h3>
				    </div>
				    
				    <div class="ibox-content">
				        <div class="form-horizontal m-t">
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">工号：</label>
				        		<div class="col-sm-8">
				        			<input id="teacherid" name="teacherid" type="text" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">教师姓名：</label>
				        		<div class="col-sm-8">
				        			<input id="teachername" name="teachername" type="text" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">密码：</label>
				        		<div class="col-sm-8">
				        			<input id="password" name="password" type="text" class="form-control" placeholder="不填写为默认密码，为000001">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">教师简介：</label>
				        		<div class="col-sm-8">
				        			<textarea rows="5" id="description" name="description" class="form-control" placeholder="选填" style="resize: none;"></textarea>
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<div class="col-sm-8 col-sm-offset-5">
				        			<button id="insertTeacher" type="submit" class="btn btn-primary">添加教师</button>
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