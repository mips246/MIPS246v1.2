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
    <title>教师主页</title>
    
    <script type="text/javascript">
        function loadInfoTable(){
        	var teacherid = '<%=session.getAttribute("userid")%>';
            $.ajax({
                url:"/MIPS246/AdminTeacherCourseServlet",
                type:"POST",
                data:{
                    method:"selectTheTeacherCourse",
                    teacherid:teacherid
                },
                dataType:"json",
                success:function(data){
                    $.each(data, function (index) {
                        var courseid = data[index].courseid;
                        var coursename = data[index].coursename;

                        tt = "<tr>"
                            +"<td>"+courseid+"</td>"
                            +"<td>"+coursename+"</td>"
                            +'<td><button onclick="manageCourse(\''+courseid+'\')">管理课程</button></td>'
                            +'<td><button onclick="manageStudent(\''+courseid+'\')">管理学生</button></td>'
                            +"</tr>";
                        $("#insertPlace").append(tt);
                    });
                }
            });
        }
    </script>
    
    <script type="text/javascript">
    	function manageCourse(courseid){
    		var url = "teacher_course_manage.jsp?courseid=" + courseid;
    		window.location.href=url;
    		//window.open(url);
    	}
    </script>
    
    <script type="text/javascript">
    	function manageStudent(courseid){
    		var url = "teacher_student_manage.jsp?courseid=" + courseid;
    		window.location.href=url;
    		//window.open(url);
    	}
    </script>
    
</head>
<body onload="loadInfoTable()">
<!--教师主页分为3（暂定）个组件，
组件1首页用来展示教师的个人信息，并且提供修改密码的功能，
组件2课程管理用来展示课程，并且可以对某个课程上传作业，视频
组件3学生管理用来展示每个课程的选课学生，然后可以查看该学生该课程的作业，并且为作业打分
目前我认为实验和理论学习处于同等地位，也就是说，计算机组成原理和计算机组成原理实验是同等地位的不同两个课程。
 -->
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

			<table border="1">
	            <thead>
	            <tr>
	                <th>课程号</th>
	                <th>课程名</th>
	                <th>课程管理</th>
	                <th>学生管理</th>
	            </tr>
	            </thead>
	
	            <tbody id="insertPlace">
	            </tbody>
	        </table>

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
    <title>我的课程</title>
    
    <script type="text/javascript">
        function loadInfoTable(){
        	var teacherid = '<%=session.getAttribute("userid")%>';
            $.ajax({
                url:"/MIPS246/AdminTeacherCourseServlet",
                type:"POST",
                data:{
                    method:"selectTheTeacherCourse",
                    teacherid:teacherid
                },
                dataType:"json",
                success:function(data){
                    $.each(data, function (index) {
                        var courseid = data[index].courseid;
                        var coursename = data[index].coursename;

                        tt = "<tr>"
                            +"<td class='text-center'>"+courseid+"</td>"
                            +"<td class='text-center'>"+coursename+"</td>"
                            /* +'<td class="text-center"><button onclick="manageCourse(\''+courseid+'\')" class="btn btn-primary demo4">管理课程</button></td>'
                            +'<td class="text-center"><button onclick="manageStudent(\''+courseid+'\')" class="btn btn-primary demo4">管理学生</button></td>' */
                            +"</tr>";
                        $("#insertPlace").append(tt);
                    });
                }
            });
        }
    </script>
    
    <script type="text/javascript">
    	function manageCourse(courseid){
    		var url = "teacher_course_manage.jsp?courseid=" + courseid;
    		window.location.href=url;
    		//window.open(url);
    	}
    </script>
    
    <script type="text/javascript">
    	function manageStudent(courseid){
    		var url = "teacher_student_manage.jsp?courseid=" + courseid;
    		window.location.href=url;
    		//window.open(url);
    	}
    </script>
    
</head>
<body class="gray-bg" onload="loadInfoTable()">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
                        <h3>课程列表</h3>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<div class="table-responsive" class="row">
                    		<div class="col-sm-12">
								<table class="table table-striped" class="text-center">
						            <thead>
						            <tr>
						                <th class="text-center">课程号</th>
						                <th class="text-center">课程名</th>
						            </tr>
						            </thead>
						
						            <tbody id="insertPlace">
						            </tbody>
						        </table>
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