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
		function getUrlParams(name){
     		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     		var r = window.location.search.substr(1).match(reg);
     		//if(r!=null) return unescape(r[2]); 
     		if(r!=null) return decodeURI(r[2]);
     		return null;
		}
	</script>
	
	<script type="text/javascript">
		function validateGrade(stuid,grade){
        	var flag = true;
            var reg = new RegExp(/^(?:[1-9]?\d|100)$/);
            if(!reg.test(grade)){
            	alert(stuid + "成绩不合法！");
                flag=false;
            	return flag;
            }
        	return flag;
        }
	</script>
	
	<script type="text/javascript">
        function loadInfoTable(){
        	var teacherid = '<%=session.getAttribute("userid")%>';
        	var courseid = getUrlParams("courseid");
            $.ajax({
                url:"/MIPS246/TeacherServlet",
                type:"POST",
                data:{
                    method:"selectCourseSelectAndStudentName",
                    teacherid:teacherid,
                    courseid:courseid
                },
                dataType:"json",
                success:function(data){
                    $.each(data, function (index) {
                    	var stuid = data[index].stuid;
                        var studentname = data[index].name;
                        var grade = data[index].grade;
                        
                        var str = (grade!=0?"disabled='disabled'":" ");

                        tt = "<tr>"
                        	+"<td>"+stuid+"</td>"
                            +"<td>"+studentname+"</td>"
                            //+"<td><input style='width:60px;margin:0 auto;padding:2px' name='gradeText' stuid='"+stuid+"' "+str+" type='number' value='"+grade+"' ></td>"
                            +"<td><input style='width:60px;margin:0 auto;padding:2px' id='grade"+stuid+"' "+str+" type='number' value='"+grade+"' ></td>"
                            +'<td><button onclick="updateGrade(\''+stuid+'\')">提交成绩</button></td>'
                            +'<td><button onclick="jumpToHomework(\''+stuid+'\')">查看作业</button></td>'
                            +"</tr>";
                        $("#studentList").append(tt);
                    });
                }
            });
        }
    </script>
    
    <script type="text/javascript">
    	function updateGrade(stuid){
    		var teacherid = '<%=session.getAttribute("userid")%>';
        	var courseid = getUrlParams("courseid");
        	var inputid = "#grade" + stuid;
        	var grade = $(inputid).val();
        	if(validateGrade(stuid,grade)){
        		$.ajax({
        			url:"/MIPS246/TeacherServlet",
                	type:"POST",
                	data:{
                    	method:"updateGrade",
                  		teacherid:teacherid,
                    	courseid:courseid,
                    	studentid:stuid,
                    	grade:grade
                	},
                	dataType:"json",
                	success:function(data){
                		alert(stuid + "成绩提交成功");
                		window.location.reload();
                	}
        		});
        	}
    	}
    </script>
    
    <script type="text/javascript">
    	function jumpToHomework(stuid){
        	var courseid = getUrlParams("courseid");
        	var url = "teacher_check_homework.jsp?courseid=" + courseid +"&studentid="+ stuid;
    		window.location.href=url;
    	}
    </script>
    
    
</head>
<body onload="loadInfoTable()">
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
                        <a href="teacher_course.jsp"><button type="button" class="btn btn-primary">返回</button></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container clearf">
        
        	<table border="1">
        		<thead>
        			<tr>
        				<th class="text-center ">学号</th>
	                    <th class="text-center ">姓名</th>
	                    <th class="text-center ">成绩</th>
	                    <th class="text-center ">提交成绩</th>
	                    <th class="text-center ">查看作业</th>
	                </tr>
	            </thead>
				<tbody id="studentList">
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
    <title>学生管理界面</title>
    
    <script type="text/javascript">
		function getUrlParams(name){
     		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     		var r = window.location.search.substr(1).match(reg);
     		//if(r!=null) return unescape(r[2]); 
     		if(r!=null) return decodeURI(r[2]);
     		return null;
		}
	</script>
	
	<script type="text/javascript">
		function validateGrade(stuid,grade){
        	var flag = true;
            var reg = new RegExp(/^(?:[1-9]?\d|100)$/);
            if(!reg.test(grade)){
            	alert(stuid + "成绩不合法！");
                flag=false;
            	return flag;
            }
        	return flag;
        }
	</script>
	
	<script type="text/javascript">
        function loadInfoTable(){
        	var teacherid = '<%=session.getAttribute("userid")%>';
        	var courseid = getUrlParams("courseid");
            $.ajax({
                url:"/MIPS246/TeacherServlet",
                type:"POST",
                data:{
                    method:"selectCourseSelectAndStudentName",
                    teacherid:teacherid,
                    courseid:courseid
                },
                dataType:"json",
                success:function(data){
                    $.each(data, function (index) {
                    	var stuid = data[index].stuid;
                        var studentname = data[index].name;
                        var grade = data[index].grade;
                        
                        var str = (grade!=0?"disabled='disabled'":" ");

                        tt = "<tr>"
                        	+"<td class='text-center'>"+stuid+"</td>"
                            +"<td class='text-center'>"+studentname+"</td>"
                            //+"<td><input style='width:60px;margin:0 auto;padding:2px' name='gradeText' stuid='"+stuid+"' "+str+" type='number' value='"+grade+"' ></td>"
                            +"<td class='text-center'><input class='form-control' style='width:60px;margin:0 auto;padding:2px' id='grade"+stuid+"' "+str+" type='number' value='"+grade+"' ></td>"
                            +'<td class="text-center"><button onclick="updateGrade(\''+stuid+'\')" class="btn btn-primary demo4">提交成绩</button></td>'
                            +'<td class="text-center"><button onclick="jumpToHomework(\''+stuid+'\')" class="btn btn-primary demo4">查看作业</button></td>'
                            +"</tr>";
                        $("#studentList").append(tt);
                    });
                }
            });
        }
    </script>
    
    <script type="text/javascript">
    	function updateGrade(stuid){
    		var teacherid = '<%=session.getAttribute("userid")%>';
        	var courseid = getUrlParams("courseid");
        	var inputid = "#grade" + stuid;
        	var grade = $(inputid).val();
        	if(validateGrade(stuid,grade)){
        		$.ajax({
        			url:"/MIPS246/TeacherServlet",
                	type:"POST",
                	data:{
                    	method:"updateGrade",
                  		teacherid:teacherid,
                    	courseid:courseid,
                    	studentid:stuid,
                    	grade:grade
                	},
                	dataType:"json",
                	success:function(data){
                		alert(stuid + "成绩提交成功");
                		window.location.reload();
                	}
        		});
        	}
    	}
    </script>
    
    <script type="text/javascript">
    	function jumpToHomework(stuid){
        	var courseid = getUrlParams("courseid");
        	var url = "teacher_check_homework.jsp?courseid=" + courseid +"&studentid="+ stuid;
    		window.location.href=url;
    	}
    </script>
    
    
</head>
<body class="gray-bg" onload="loadInfoTable()">
    <div class="wrapper wrapper-content animated fadeInRight">
    	<div class="row">
    		<div class="col-sm-12">
    			<div class="ibox float-e-margins">
    				<div class="ibox-title">
                        <h5>学生管理</h5>
                        <div class="col-sm-3 m-b-xs"></div>
			        	<div class="col-sm-7"></div>
                        <div class="input-group">
                        	<a href="teacher_course.jsp">
                            	<button type="button" class="btn btn-primary btn-sm demo4">返回</button>
                            </a>
                        </div>
                    </div>
			        
			        <div class="ibox-content">
			        	<!-- <div class="row">
			        		<div class="col-sm-3 m-b-xs"></div>
			        		<div class="col-sm-7"></div>
			        		<div class="col-sm-2">
                                <div class="input-group">
                                	<a href="teacher_course.jsp">
                                    	<button type="button" class="btn btn-primary btn-sm demo4">返回课程管理</button>
                                    </a>
                                </div>
                            </div>
			        	</div> -->
			        	<div class="table-responsive" class="row">
			        		<div class="col-sm-12">
					        	<table class="table table-striped" class="text-center">
					        		<thead>
					        			<tr>
					        				<th class="text-center ">学号</th>
						                    <th class="text-center ">姓名</th>
						                    <th class="text-center ">成绩</th>
						                    <th class="text-center "></th>
						                    <th class="text-center "></th>
						                </tr>
						            </thead>
									<tbody id="studentList">
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