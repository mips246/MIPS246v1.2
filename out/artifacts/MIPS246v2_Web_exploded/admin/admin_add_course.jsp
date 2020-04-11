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
            $("#insertcourse").click(function(){
            	
                var cid=$("#courseid").val();
                var cname=$("#coursename").val();
                var csc=$("#studentcount").val();
                console.log(cid+" "+cname+" "+csc);
                if (csc==""){
                    csc="0";
                }
                if(cid==""){
                    alert("课程id不能为空");
                    //window.location.reload();
                }
                else if(cname==""){
                    alert("课程名称不能为空");
                    //window.location.reload();
                }
                else{
                    addCourse(cid,cname,csc);
                }
            })
        })
        function getTime(){
            var time=new Date();
            var year=time.getFullYear();
            var month=time.getMonth()+1;
            var day=time.getDate();
            //var hour=time.getHours();
            //return year+"-"+month+"-"+day+"-"+hour;
            return year+"-"+month+"-"+day;
        }
        function addCourse(courseid,coursename,studentcount) {
            $.ajax({
                url:"/MIPS246/AdminCourseServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"addCourse",
                    courseid:courseid,
                    coursename:coursename,
                    studentcount:studentcount,
                    createtime:getTime()
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
				        <h3>添加课程</h3>
				    </div>
				    
				    <div class="ibox-content">
				        <div class="form-horizontal m-t">
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">课程id：</label>
				        		<div class="col-sm-8">
				        			<input id="courseid" name="courseid" type="text" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">课程名称：</label>
				        		<div class="col-sm-8">
				        			<input id="coursename" name="coursename" type="text" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<label class="col-sm-3 control-label">学生人限：</label>
				        		<div class="col-sm-8">
				        			<input id="studentcount" name="studentcount" type="text" class="form-control">
				        		</div>
				        	</div>
				        	<div class="form-group">
				        		<div class="col-sm-8 col-sm-offset-5">
				        			<button id="insertcourse" type="submit" class="btn btn-primary">添加课程</button>
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