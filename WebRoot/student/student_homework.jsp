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
    <title>Title</title>
    <script type="text/javascript">
        //$(document).ready(loadCourseTable());
        function loadStudentSelectCourseTable() {
        	var userid='<%=session.getAttribute("userid")%>';
            $.ajax({
                url:"/MIPS246/StudentServlet",
                type:"POST",
                data:{
                    method:"x",
                    userid:userid
                },
                dataType:"json",
                success:function (data) {
                    $.each(data,function (index) {
                        var coursename=data[index].coursename;
                        var studentid='<%=session.getAttribute("userid")%>';
                        var courseid=data[index].courseid;
                        var teacherid=data[index].teacherid;
                        var tt="<tr>"
                            +'<td><button onclick="seeHomework(\''+courseid+'\',\''+teacherid+'\')">'+coursename+'</button></td></tr>';
                        $("#insertPlace").append(tt);
                    })
                }
            })
        }
        function seeHomework(courseid,teacherid) {
            $.ajax({
                url:"/MIPS246/DownloadServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"loadFileTable",
                    courseid:courseid,
                    teacherid:teacherid
                },
                success:function (data) {
                  console.log("进入success");
                  dealData(data);
                },
                error:function (jqXHR,textStatus,errorThrown) {
                    dealData(jqXHR.responseText);
                }
            });
        }
        //'<td><button onclick="seeHomework(\''+courseid+'\',\''+teacherid+'\')">'+coursename+'</button></td></tr>';
        function dealData(data) {
            $("#insertPlace2").html("");
            var url=
            $.each(data,function (index) {
                var fileurl=data[index].fileurl;
                var filename=data[index].filename;
                var section=data[index].section;
                var courseid=data[index].courseid;
                var userid='<%=session.getAttribute("userid")%>';
                var tt="<tr>"
                +"<td><a href=\'"+fileurl+"\' download=\'"+filename+"\'>"+filename+"</a></td>"
                +'<td><button onclick="openuploadpage(\''+section+'\',\''+courseid+'\',\''+userid+'\')">上传</button></td></tr>';
                $("#insertPlace2").append(tt);
            })
        }
        function openuploadpage(section,courseid,userid){
        	window.open("uploadhomework.jsp?courseid="+courseid+"&section="+section+"&userid="+userid,"width=400,height=300");
        }
        //$(document).ready(loadSelectedCourseTable());
    </script>
</head>
<body class="gray-bg" onload="loadStudentSelectCourseTable()">
<div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h3>课程列表</h3>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="table-responsive row">
                            <div class="col-sm-12">
                                <table class="table table-striped text-center">
                                    <tbody id="insertPlace">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h3>作业</h3>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="table-responsive row">
                            <div class="col-sm-12">
                                <table class="table table-striped text-center">
                                    <th>作业列表</th>
                                    <th>上传作业</th>
                                    <tbody id="insertPlace2">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--=================-->
<%--    <div class="top-nav clearf">--%>
<%--        <div class="fl">--%>
<%--            <div class="item">--%>
<%--                <a href="student_main.jsp"><button type="button" class="btn btn-primary ">首页</button></a>--%>
<%--            </div>--%>
<%--            <div class="item">--%>
<%--                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">课程</button>--%>
<%--                <div class="dropdown-menu">--%>
<%--                    <a class="dropdown-item" href="student_select_course.jsp">选课</a>--%>
<%--                    <a class="dropdown-item" href="student_course.jsp">上课</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="item">--%>
<%--                <a href="student_archive.jsp"><button type="button" class="btn btn-primary ">课程资料</button></a>--%>
<%--            </div>--%>
<%--            <div class="item">--%>
<%--                <a href="student_homework.jsp"><button type="button" class="btn btn-primary ">作业</button></a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="fr">--%>
<%--            <div class="item">--%>
<%--                <!--<button type="button" class="btn btn-primary"><a href="logout.jsp">退出</a></button>  -->--%>
<%--                <a href="../logout.jsp"><button type="button" class="btn btn-primary ">退出</button></a>--%>
<%--                <a href="info.jsp"><button type="button" class="btn btn-primary ">个人信息修改</button></a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="container">--%>
<%--        <div class="col-2 sidebar">--%>
<%--            <table border="1" align="center">--%>
<%--                <thead>--%>
<%--                    <tr>--%>
<%--                        <th>课程列表</th>--%>
<%--                    </tr>--%>
<%--                </thead>--%>
<%--                <tbody id="insertPlace">--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--        <div class="col-4">--%>
<%--            <table border="1" align="center">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th>作业列表</th>--%>
<%--                    <th>上传作业</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody id="insertPlace2">--%>

<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script src="../js/jquery.min.js?v=2.1.4"></script>
<script src="../js/bootstrap.min.js?v=3.3.6"></script>
<script src="../js/content.min.js?v=1.0.0"></script>
<script src="../js/plugins/validate/jquery.validate.min.js"></script>
<script src="../js/plugins/validate/messages_zh.min.js"></script>
<script src="../js/demo/form-validate-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>