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
    <title>上传课程资料</title>
    
    <script type="text/javascript">
		function loadCourse(teacherid){
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
                }
			});
		}
	</script>
	
	<script type="text/javascript">
		function writeData(){
     		var teacherid = '<%=session.getAttribute("userid")%>';
     		document.upload.userid.value = teacherid;
     		loadCourse(teacherid);
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
		        		<h3>上传课程资料</h3>
		        	</div>
		        	
			        
			        <div class="ibox-content">
						<div class="form-horizontal m-t">
							<form name="upload" method="post" action="/MIPS246/UploadServlet" enctype="multipart/form-data">
								<div class="form-group">
									<label class="col-sm-4 control-label">请选择上传类型:</label>
									<div class="col-sm-4">
										<select name="filetype" class="form-control inline">
					        				<option value="0">作业要求</option>
					        				<option value="1">课程视频</option>
					        				<option value="3">课程讲义</option>
					        			</select>
				        			</div>
			        			</div>
			        			
			        			<div class="form-group">
									<label class="col-sm-4 control-label">请选课程:</label>
									<div class="col-sm-6">
										<select id="selectList" name="courseid" class="form-control inline">
					        				<option value="-1">选择课程</option>
					        			</select>
				        			</div>
			        			</div>
			        			
			        			<div class="form-group">
									<label class="col-sm-4 control-label">请输入对应的课程小节:</label>
									<div class="col-sm-2">
										<input class="form-control" type="text" name="coursesection"/>
									</div>
								</div>
								
								<input type="hidden" name="roletype" value="teacher"/>
			        			<input type="hidden" name="userid" value=""/>
			        			
			        			<div class="form-group">
						    		<label class="col-sm-4 control-label">请选择一个文件:</label>
						    		<div class="col-sm-4">
						    			<input type="file" name="uploadFile" />
						    		</div>
					    		</div>
					    		
					    		<div class="form-group">
					    			<div class="col-sm-8 col-sm-offset-4">
					    				<button type="submit" class="btn btn-primary">上传</button>
					    			</div>
					    		</div>
			        			
							</form>
							
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