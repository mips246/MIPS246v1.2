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
    <title>教师文件管理页面</title>

    <script type="text/javascript">
        function loadInfoTable(){
            var teacherid = '<%=session.getAttribute("userid")%>';
            $.ajax({
                url:"/MIPS246/TeacherServlet",
                type:"POST",
                data:{
                    method:"selectAllCourseForTeacher",
                    teacherid:teacherid
                },
                dataType:"json",
                success:function(data){
                    $("#selectList").html("");
                    $.each(data, function (index){
                        var courseid = data[index].courseid;
                        var coursename = data[index].coursename;
                        tt = "<option value='"+courseid+"'>"+ courseid + " " + coursename+"</option>";
                        $("#selectList").append(tt);
                    });
                    loadFileTable(teacherid,data[0].courseid);
                }
            });
        }

        function loadFileTable(teacherid,courseid){
            $.ajax({
                url:"/MIPS246/TeacherServlet",
                type:"POST",
                data:{
                    method:"selectTeacherFileWithCourseid",
                    teacherid:teacherid,
                    courseid:courseid
                },
                dataType:"json",
                success:function(data){
                    dealData(data);
                }
            });
        }

        function dealData(data){
            $("#fileList").html("");
            $.each(data, function(index) {

                var fileno = data[index].fileno;
                var fileurl = data[index].fileurl;
                var filename = data[index].filename;
                var coursesection = data[index].coursesection;
                var createtime = data[index].createtime;
                var filetype = data[index].filetype;
                var type;
                if(filetype==0) type = "作业要求";
                else if(filetype==1) type = "课程视频";
                else if(filetype==3) type = "课程讲义";

                tt = "<tr>"
                    + "<td class='text-center'><a href=\'" + fileurl + "\' download=\'" + filename + "\'>" + filename + "</a></td>"
                    + "<td class='text-center'>" + coursesection + "</td>"
                    + "<td class='text-center'>" + createtime + "</td>"
                    + "<td class='text-center'>" + type + "</td>"
                    + '<td class="text-center"><button onclick="deleteFile(\''+fileno+'\',\''+encodeURIComponent(fileurl)+'\')" class="btn btn-danger demo4">删除文件</button></td>'
                    + "</tr>";
                $("#fileList").append(tt);
            });
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function(){
            var teacherid = '<%=session.getAttribute("userid")%>';
            $("#selectList").change(function(){
                if($("#selectList").val()!=null){
                    loadFileTable(teacherid,$("#selectList").val(),"");
                }
            });
        });
    </script>

    <script type="text/javascript">
        function deleteFile(fileno,fileurl){
            $.ajax({
                url:"/MIPS246/DeleteFileServlet",
                type:"POST",
                data:{
                    method:"TeacherDelete",
                    fileno:fileno,
                    fileurl:fileurl
                },
                dataType:"json",
                success:function(data){
                    alert("删除成功");
                    //window.location.reload();
                    var teacherid = '<%=session.getAttribute("userid")%>';
                    var courseid = $("#selectList").val();
                    loadFileTable(teacherid,courseid);
                }
            });
        }
    </script>
</head>

<body class="gray-bg" onload="loadInfoTable()">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">

                <div class="ibox-title">
                    <h3>我的文件列表</h3>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-3 m-b-xs">
                            <select id="selectList" class="input-sm form-control input-lg inline">
                                <option value="-1">选择课程</option>
                            </select>
                        </div>
                    </div>
                    <div class="table-responsive" class="row">
                        <div class="col-sm-12">
                            <table class="table table-striped" class="text-center">
                                <thead>
                                <tr>
                                    <th class="text-center ">文件</th>
                                    <th class="text-center ">课程小节</th>
                                    <th class="text-center ">提交时间</th>
                                    <th class="text-center ">文件类型</th>
                                    <th class="text-center "></th>
                                </tr>
                                </thead>
                                <tbody id="fileList">
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