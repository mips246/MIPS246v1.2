<%-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>管理员 教师选课操作界面</title>
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	
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
		function loadCourseTable() {
			var teacherid = getUrlParams("teacherid");
            $.ajax({
                url:"/MIPS246/AdminTeacherCourseServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"loadCourse",
                    teacherid:teacherid
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
            $("#courseInsertPlace").html("");
            var tt="<tr class=''>"
                +"<td class=''>课程号</td>"
                +"<td class=''>课程名</td>"
                +"<td class=''>人数</td>"
                +"<td class=''>创建时间</td>"
                +"<td class=''>点击选课</td></tr>";
            $("#courseInsertPlace").append(tt);
            $.each(data,function (index) {
                var courseid=data[index].courseid;
                var coursename=data[index].coursename;
                var studentcount=data[index].studentcount;
                var createtime=data[index].createtime;
                var c_isselected=data[index].c_isselected;
                var str0 = '<td><button onclick="teacherSelectCourse(\''+courseid+'\',\''+coursename+'\')">选课</button></td>';
                var str1 = "<td><button disabled='disabled'>已选</button></td>";
                var str = c_isselected==0 ? str0 : str1;
                tt="<tr class=''>"
                    +"<td class=''>"+courseid+"</td>"
                    +"<td class=''>"+coursename+"</td>"
                    +"<td class=''>"+studentcount+"</td>"
                    +"<td class=''>"+createtime+"</td>"
                    +str
                    //+'<td><button onclick="teacherSelectCourse(\''+courseid+'\',\''+coursename+'\')">选课</button></td>'
                    +"</tr>";
                $("#courseInsertPlace").append(tt);
            })
        }
	</script>
	
	<script type="text/javascript">
		function teacherSelectCourse(courseid,coursename){
			var teacherid = getUrlParams("teacherid");
			var teachername = getUrlParams("teachername");
            $.ajax({
                url:"/MIPS246/AdminTeacherCourseServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"selectCourse",
                    teacherid:teacherid,
                    teachername:teachername,
                    courseid:courseid,
                    coursename:coursename
                },
                success:function(){
                    alert(teachername+"老师选课成功！");
                    window.location.reload();
                },
                error:function(){
                    alert(teachername+"老师选课失败！");
                    window.location.reload();
                }
            });
        }
	</script>
	
</head>
  
<body onload="loadCourseTable()">
	<h3>课程表</h3>
	<table border="1">
		<tbody id="courseInsertPlace">
        </tbody>
    </table>
</body>
</html> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>教师选课</title>
	
	<link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
	<link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
	
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	
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
		function loadCourseTable() {
			var teacherid = getUrlParams("teacherid");
            $.ajax({
                url:"/MIPS246/AdminTeacherCourseServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"loadCourse",
                    teacherid:teacherid
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
            $("#courseInsertPlace").html("");
           /*  var tt="<tr class=''>"
                +"<td class=''>课程号</td>"
                +"<td class=''>课程名</td>"
                +"<td class=''>人数</td>"
                +"<td class=''>创建时间</td>"
                +"<td class=''>点击选课</td></tr>";
            $("#courseInsertPlace").append(tt); */
            $.each(data,function (index) {
                var courseid=data[index].courseid;
                var coursename=data[index].coursename;
                var studentcount=data[index].studentcount;
                var createtime=data[index].createtime;
                var c_isselected=data[index].c_isselected;
                var str0 = '<td class="text-center"><button class="btn btn-primary demo4" onclick="teacherSelectCourse(\''+courseid+'\',\''+coursename+'\')">选课</button></td>';
                var str1 = "<td class='text-center'><button class='btn btn-danger demo4' disabled='disabled'>已选</button></td>";
                var str = c_isselected==0 ? str0 : str1;
                var tt="<tr class=''>"
                    +"<td class='text-center'>"+courseid+"</td>"
                    +"<td class='text-center'>"+coursename+"</td>"
                    +"<td class='text-center'>"+studentcount+"</td>"
                    +"<td class='text-center'>"+createtime+"</td>"
                    +str
                    //+'<td><button onclick="teacherSelectCourse(\''+courseid+'\',\''+coursename+'\')">选课</button></td>'
                    +"</tr>";
                $("#courseInsertPlace").append(tt);
            })
        }
	</script>
	
	<script type="text/javascript">
		function teacherSelectCourse(courseid,coursename){
			var teacherid = getUrlParams("teacherid");
			var teachername = getUrlParams("teachername");
            $.ajax({
                url:"/MIPS246/AdminTeacherCourseServlet",
                type:"POST",
                dataType:"json",
                data:{
                    method:"selectCourse",
                    teacherid:teacherid,
                    teachername:teachername,
                    courseid:courseid,
                    coursename:coursename
                },
                success:function(){
                    alert(teachername+"老师选课成功！");
                    //window.location.reload();
                    loadCourseTable();
                },
                error:function(){
                    alert(teachername+"老师选课失败！");
                    //window.location.reload();
                    loadCourseTable();
                }
            });
        }
	</script>
	
</head>
  
<body class="gray-bg" onload="loadCourseTable()">

    <div class="wrapper wrapper-content animated fadeInRight">
    	<div class="row">
    		<div class="col-sm-12">
    			<div class="ibox float-e-margins">
    			
			        <div class="ibox-title">
                        <h5>课程列表</h5>
                        <div class="col-sm-3 m-b-xs"></div>
			        	<div class="col-sm-7"></div>
                        <div class="input-group">
                        	<a href="admin_teacher.jsp">
                            	<button type="button" class="btn btn-primary btn-sm demo4">返回</button>
                            </a>
                        </div>
                    </div>
			        <div class="ibox-content">
			        	<div class="table-responsive" class="row">
			        		<div class="col-sm-12">
					        	<table class="table table-striped" class="text-center">
					        		<thead>
					        			<tr>
					        				<th class="text-center ">课程号</th>
						                    <th class="text-center ">课程名</th>
						                    <th class="text-center ">人数</th>
						                    <th class="text-center ">创建时间</th>
						                    <th class="text-center "></th>
						                </tr>
						            </thead>
									<tbody id="courseInsertPlace">
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