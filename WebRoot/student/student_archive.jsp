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
    <title>资料</title>
    <script>
        //$(document).ready(loadCourseTable());
        function loadCourseTable() {
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
                            +'<td><button onclick="seearchive(\''+courseid+'\',\''+teacherid+'\')">'+coursename+'</button></td></tr>';
                        $("#insertPlace").append(tt);
                    })
                }
            })
        }
        function seearchive(courseid,teacherid) {
            $.ajax({
                url:"/MIPS246/DownloadServlet",
                type:"POST",
                dataType: "json",
                data:{
                    method: "loadArchiveTable",
                    courseid:courseid,
                    teacherid:teacherid
                },
                success:function (data) {
                    dealData(data);
                },
                error:function (jqXHR,textStatus,errorThrown) {
                    dealData(jqXHR.responseText);
                }
            });
        }
        function dealData(data) {
            $("#insertPlace2").html("");
            $.each(data,function(index) {
                var fileurl=data[index].fileurl;
                var filename=data[index].filename;
                var tt="<tr>"
                +"<td><a href=\'"+fileurl+"\' download=\'"+filename+"\'>"+filename+"</a></td></tr>";
                $("#insertPlace2").append(tt);
            })
        }
    </script>
</head>
<body onload="loadCourseTable()">
<div class="gray-bg">
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
                        <h3>资料列表</h3>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="table-responsive row">
                            <div class="col-sm-12">
                                <table class="table table-striped text-center">
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
