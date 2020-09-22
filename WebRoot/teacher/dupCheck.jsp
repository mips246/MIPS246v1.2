<%--
  Created by IntelliJ IDEA.
  User: Florriance
  Date: 2020/9/19
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html lang="en">
    <head>
        <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
        <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
        <link href="../css/animate.min.css" rel="stylesheet">
        <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
        <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

        <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
        <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>查重界面</title>

        <script type="text/javascript">
            function loadInfoTable(teacherid){
                $.ajax({
                    url:"/MIPS246/TeacherServlet",
                    type:"POST",
                    data:{
                        method:"selectAllCourseForTeacher",
                        teacherid:teacherid
                    },
                    dataType:"json",
                    success:function(data){
                        $("#courseList").html("");
                        if (data == ''){
                            alert("未查询到您负责的课程！");
                            $("#dupCheck").attr("disabled","disabled");
                        }
                        else {
                            $("#dupCheck").removeAttrs("disabled");
                            $.each(data, function (index){
                                var courseid = data[index].courseid;
                                var coursename = data[index].coursename;
                                tt = "<option value='"+courseid+"'>"+ courseid + " " + coursename+"</option>";
                                $("#courseList").append(tt);
                            });
                            loadCourseSection(teacherid,data[0].courseid);
                            // loadStudentTable(teacherid,data[0].courseid);
                        }

                    }
                });
            }
        </script>

        <script type="text/javascript">
            function loadCourseSection(teacherid,courseid){
                $.ajax({
                    url:"/MIPS246/TeacherServlet",
                    type:"POST",
                    data:{
                        method:"getCourseSection",
                        teacherid:teacherid,
                        courseid:courseid
                    },
                    dataType:"json",
                    success:function(data){
                        dealCourseSection(data);
                    }
                });
            }
        </script>

        <script type="text/javascript">
            function dealCourseSection(data){
                $("#courseSection").html("");
                if (data == ''){
                    $("#courseSection").attr("disabled","disabled");
                    $("#courseSection").attr("style","background-color: #EEEEEE;");
                    $("#dupCheck").attr("disabled","disabled");
                }
                else {
                    $("#courseSection").removeAttrs("disabled");
                    $("#courseSection").removeAttrs("style");
                    $("#dupCheck").removeAttrs("disabled");
                    $.each(data, function(index) {
                        var section = data[index].section;

                        tt = "<option value='"+section+"'>第 "+ section + " 节</option>";
                        $("#courseSection").append(tt);
                    });
                }
            }
        </script>

        <script type="text/javascript">
            function loadStudentTable(teacherid,courseid){
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
                        dealStudentData(data);
                    }
                });
            }
        </script>

        <script type="text/javascript">
            function dealStudentData(data){
                $("#studentsList1").html("");
                $("#studentsList2").html("");

                $.each(data, function(index) {
                    var stuid = data[index].stuid;
                    var studentname = data[index].name;

                    tt = "<option value='"+stuid+"'>"+ stuid + " " + studentname+"</option>";
                    $("#studentsList1").append(tt);
                    $("#studentsList2").append(tt);
                });
            }
        </script>

        <script type="text/javascript">
            $(function () {
                $("input[name='checkType']").click(function () {
                    _change($(this));
                });
            });
            function _change(obj) {
                if (obj.val() == 'one2one'){
                    $("#studentsList1").removeAttrs("disabled");
                    $("#studentsList1").removeAttrs("style");
                    $("#studentsList2").removeAttrs("disabled");
                    $("#studentsList2").removeAttrs("style");
                }
                if (obj.val() == 'one2all'){
                    $("#studentsList1").removeAttrs("disabled");
                    $("#studentsList1").removeAttrs("style");
                    $("#studentsList2").attr("disabled","disabled");
                    $("#studentsList2").attr("style","background-color: #EEEEEE;");
                }
                if (obj.val() == 'all2all'){
                    $("#studentsList1").attr("disabled","disabled");
                    $("#studentsList1").attr("style","background-color: #EEEEEE;");
                    $("#studentsList2").attr("disabled","disabled");
                    $("#studentsList2").attr("style","background-color: #EEEEEE;");
                }
            }
        </script>

        <script type="text/javascript">
            $(document).ready(function(){
                var teacherid = '<%=session.getAttribute("userid")%>';
                $("#courseList").change(function(){
                    if($("#courseList").val()!=null){
                        // loadStudentTable(teacherid,$("#courseList").val());
                        loadCourseSection(teacherid,$("#courseList").val());
                    }
                });

                $("#dupCheck").on("click",function(){
                    var courseId = $("#courseList").val();
                    var courseSection = $("#courseSection").val();
                    //var checkType = $("input[name='checkType']:checked").val();
                    // var studentId1 = $("#studentsList1").val();
                    // var studentId2 = $("#studentsList2").val();
                    // if(checkType === "one2one" && studentId1 === studentId2){
                    //     alert("请选择两位不同学生查重！");
                    // }
                    // else{
                    //     alert("here!")
                    // }
                });
            });
        </script>

        <script type="text/javascript">
            function writeData(){
                var teacherid = '<%=session.getAttribute("userid")%>';
                loadInfoTable(teacherid);
            }
        </script>

    </head>
    <body class="gray-bg" onload="writeData()">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-3">
                </div>
                <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h3>查重系统</h3>
                        </div>


                        <div class="ibox-content">
                            <div class="form-horizontal m-t">

                                <div class="form-group">
                                    <label class="col-sm-4 control-label">请选课程:</label>
                                    <div class="col-sm-6">
                                        <select id="courseList" name="courseid" class="form-control inline">
                                            <option value="-1">选择课程</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label">请选择课程小节:</label>
                                    <div class="col-sm-6">
                                        <select id="courseSection" name="courseSection" class="form-control inline">
                                            <option value="-1">选择课程小节</option>
                                        </select>
                                    </div>
                                </div>

<%--                                <div class="form-group">--%>
<%--                                    <label class="col-sm-4 control-label">请选择查重方式:</label>--%>
<%--                                    <div class="col-sm-6">--%>
<%--                                        <label class="radio-inline">--%>
<%--                                            <input type="radio" name="checkType" value="all2all"/>全对全查重--%>
<%--                                        </label>--%>
<%--                                        <label class="radio-inline">--%>
<%--                                            <input type="radio" name="checkType" value="one2all"/>一对全查重--%>
<%--                                        </label>--%>
<%--                                        <label class="radio-inline">--%>
<%--                                            <input type="radio" name="checkType" value="one2one" checked="checked"/>一对一查重--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="form-group">--%>
<%--                                    <label class="col-sm-4 control-label">请选择第一位待查重学生:</label>--%>
<%--                                    <div class="col-sm-6">--%>
<%--                                        <select id="studentsList1" name="studentId1" class="form-control inline">--%>
<%--                                            <option value="-1">选择学生</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="form-group">--%>
<%--                                    <label class="col-sm-4 control-label">请选择第二位待查重学生:</label>--%>
<%--                                    <div class="col-sm-6">--%>
<%--                                        <select id="studentsList2" name="studentId2" class="form-control inline">--%>
<%--                                            <option value="-1">选择学生</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <div class="form-group">
                                    <div class="col-sm-8 col-sm-offset-4">
                                        <button id="dupCheck" type="submit" class="btn btn-primary">查重</button>
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
