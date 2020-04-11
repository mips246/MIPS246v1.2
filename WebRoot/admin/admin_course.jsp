<%-- <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/normalize/8.0.1/normalize.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
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
                    window.location.reload();
                }
                else if(cname==""){
                    alert("课程名称不能为空");
                    window.location.reload();
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
            var hour=time.getHours();
            return year+"-"+month+"-"+day+"-"+hour;
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
        function loadCourseTable() {
            $.ajax({
                url:"/MIPS246/AdminCourseServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"loadCourse"
                },
                success:function (data) {
                    dealData(data);
                },
                error:function(jqXHR,textStatus,errorThrown){
                    dealData(jqXHR.responseText);
                }
            });
        }
        function dealData(data) {
            $("#insertPlace").html("");
            var tt="<tr class=''>"
                +"<td class=''>课程号</td>"
                +"<td class=''>课程名</td>"
                +"<td class=''>人数</td>"
                +"<td class=''>创建时间</td>"
                +"<td class=''>选项</td></tr>";
            $("#insertPlace").append(tt);
            $.each(data,function (index) {
                var courseid=data[index].courseid;
                var coursename=data[index].coursename;
                var studentcount=data[index].studentcount;
                var createtime=data[index].createtime;
                tt="<tr class=''>"
                    +"<td class=''>"+courseid+"</td>"
                    +"<td class=''>"+coursename+"</td>"
                    +"<td class=''>"+studentcount+"</td>"
                    +"<td class=''>"+createtime+"</td>"
                    //+"<td class=''><button onclick='deleteCourse("+courseid+")'>删除</button></td></tr>";
                    +'<td class=""><button onclick="deleteCourse(\''+courseid+'\')">删除</button></td></tr>';
                $("#insertPlace").append(tt);
            })
        }
        function deleteCourse(courseid){
            $.ajax({
                url:"/MIPS246/AdminCourseServlet",
                type:"post",
                dataType:"JSON",
                data: {
                    method:"deleteCourse",
                    courseid:courseid
                },
                success:function (data) {
                    var deletecourseid=courseid;
                    alert("删除成功"+courseid);
                    loadCourseTable();
                },
                error:function (jqXHR,testStatus,errorThrown) {
                    alert("删除失败");
                }
            })
        }
    </script>
</head>
<body onload="loadCourseTable()">
<%
request.setCharacterEncoding("GBK");
%>
<div class="container clearf">
    <div class="container clearf">
        <div class="top-nav clearf">
            <div class="fl">
                <div class="item">
                    <a href="admin.jsp"><button type="button" class="btn btn-primary">首页</button></a>
                </div>
                <div class="item">
                    <a href="admin_course.jsp"><button type="button" class="btn btn-primary">课程</button></a>
                </div>
                <div class="item">
                    <a href="admin_teacher.jsp"><button type="button" class="btn btn-primary">老师</button></a>
                </div>
                <div class="item">
                    <a href="admin_student.jsp"><button type="button" class="btn btn-primary">学生</button></a>
                </div>
            </div>
            <div class="fr">
                <div class="item">
                    <a href="../logout.jsp"><button type="button" class="btn btn-primary">退出</button></a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-5">
            <ul></ul>
            <table>
                <tbody id="insertPlace">
                </tbody>
            </table>
        </div>
        <div class="col-5">
                课程id<input id="courseid" type="text" name="courseid"><br/>
                课程名称<input id="coursename" type="text" name="coursename"><br/>
                学生人限<input id="studentcount" type="text" name="studentcount"><br/>
                <button id="insertcourse" type="submit">添加课程</button>
        </div>
    </div>
</div>
</body>
</html> --%>
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
    <title>课程列表</title>
    <script type="text/javascript">
        function loadCourseTable() {
            $.ajax({
                url:"/MIPS246/AdminCourseServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"loadCourse"
                },
                success:function (data) {
                    dealData(data);
                },
                error:function(jqXHR,textStatus,errorThrown){
                    dealData(jqXHR.responseText);
                }
            });
        }
        function dealData(data) {
            $("#insertPlace").html("");
            var tt="<tr class=''>"
                +"<th class='text-center'>课程号</td>"
                +"<th class='text-center'>课程名</td>"
                +"<th class='text-center'>人数</td>"
                +"<th class='text-center'>创建时间</td>"
                +"<th class='text-center'>选项</td></tr>";
            $("#insertPlace").append(tt);
            $.each(data,function (index) {
                var courseid=data[index].courseid;
                var coursename=data[index].coursename;
                var studentcount=data[index].studentcount;
                var createtime=data[index].createtime;
                tt="<tr class=''>"
                    +"<td class='text-center'>"+courseid+"</td>"
                    +"<td class='text-center'>"+coursename+"</td>"
                    +"<td class='text-center'>"+studentcount+"</td>"
                    +"<td class='text-center'>"+createtime+"</td>"
                    //+"<td class=''><button onclick='deleteCourse("+courseid+")'>删除</button></td></tr>";
                    +'<td class="text-center"><button class="btn btn-danger btn-sm demo4" onclick="deleteCourse(\''+courseid+'\')">删除</button></td></tr>';
                $("#insertPlace").append(tt);
            })
        }
        function deleteCourse(courseid){
            $.ajax({
                url:"/MIPS246/AdminCourseServlet",
                type:"post",
                dataType:"JSON",
                data: {
                    method:"deleteCourse",
                    courseid:courseid
                },
                success:function (data) {
                    var deletecourseid=courseid;
                    alert("删除成功"+courseid);
                    loadCourseTable();
                },
                error:function (jqXHR,testStatus,errorThrown) {
                    alert("删除失败");
                }
            })
        }
    </script>
</head>
<body class="gray-bg" onload="loadCourseTable()">
<%
request.setCharacterEncoding("GBK");
%>
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