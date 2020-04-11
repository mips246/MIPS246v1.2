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
		function writeData(){
     		var teacherid = '<%=session.getAttribute("userid")%>';
     		var courseid = getUrlParams("courseid");
     		document.homework.userid.value = teacherid;
     		document.homework.courseid.value = courseid;
     		
     		document.ppt.userid.value = teacherid;
     		document.ppt.courseid.value = courseid;
     		
     		document.video.userid.value = teacherid;
     		document.video.courseid.value = courseid;
		}
	</script>
    
</head>
<body onload="writeData()">
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

			<h3>上传作业要求</h3><br>
				<form name="homework" method="post" action="/MIPS246/UploadServlet" enctype="multipart/form-data">
					一定要把文件 放到最后，这样传到后台的数据也会将文件放到最后
					请输入对应的课程小节:
					<input type="text" name="coursesection"/>
    				<input type="hidden" name="filetype" value="0"/>
    				<input type="hidden" name="roletype" value="teacher"/>
    				<input type="hidden" name="courseid" value=""/>
    				<input type="hidden" name="userid" value=""/>
    				请选择一个文件:
    				<input type="file" name="uploadFile" /><br/><br/>
    				<input type="submit" value="上传" />
				</form>
			<h3>上传课程讲义</h3><br>
				<form name="ppt" method="post" action="/MIPS246/UploadServlet" enctype="multipart/form-data">
					请输入对应的课程小节:
					<input type="text" name="coursesection"/>
    				<input type="hidden" name="filetype" value="3"/>
    				<input type="hidden" name="roletype" value="teacher"/>
    				<input type="hidden" name="courseid" value=""/>
    				<input type="hidden" name="userid" value=""/>
    				请选择一个文件:
    				<input type="file" name="uploadFile" /><br/><br/>
    				<input type="submit" value="上传" />
				</form>
			<h3>上传课程视频</h3><br>
				<form name="video" method="post" action="/MIPS246/UploadServlet" enctype="multipart/form-data">
					请输入对应的课程小节:
					<input type="text" name="coursesection"/>
    				<input type="hidden" name="filetype" value="1"/>
    				<input type="hidden" name="roletype" value="teacher"/>
    				<input type="hidden" name="courseid" value=""/>
    				<input type="hidden" name="userid" value=""/>
    				请选择一个文件:
    				<input type="file" name="uploadFile" /><br/><br/>
    				<input type="submit" value="上传" />
				</form>

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
		function writeData(){
     		var teacherid = '<%=session.getAttribute("userid")%>';
     		var courseid = getUrlParams("courseid");
     		document.homework.userid.value = teacherid;
     		document.homework.courseid.value = courseid;
     		
     		document.ppt.userid.value = teacherid;
     		document.ppt.courseid.value = courseid;
     		
     		document.video.userid.value = teacherid;
     		document.video.courseid.value = courseid;
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
		        		<h3>管理课程</h3>
		        	</div>
		        	
			        
			        <div class="ibox-content">
						<div class="form-horizontal m-t">
						
							<h3>上传作业要求</h3><br>
								<form name="homework" method="post" action="/MIPS246/UploadServlet" enctype="multipart/form-data">
									<%-- 一定要把文件 放到最后，这样传到后台的数据也会将文件放到最后 --%>
									<div class="form-group">
										<label class="col-sm-4 control-label">请输入对应的课程小节:</label>
										<div class="col-sm-2">
											<input class="form-control" type="text" name="coursesection"/>
										</div>
									</div>
					    			<input type="hidden" name="filetype" value="0"/>
					    			<input type="hidden" name="roletype" value="teacher"/>
					    			<input type="hidden" name="courseid" value=""/>
					    			<input type="hidden" name="userid" value=""/>
					    			<div class="form-group">
						    			<label class="col-sm-4 control-label">请选择一个文件:</label>
						    			<div class="col-sm-4">
						    				<input type="file" name="uploadFile" />
						    			</div>
					    			</div>
					    			<div class="form-group">
					    				<div class="col-sm-8 col-sm-offset-4">
					    					<!-- <input type="submit" value="上传" /> -->
					    					<button type="submit" class="btn btn-primary">上传</button>
					    				</div>
					    			</div>
								</form>
							<h3>上传课程讲义</h3><br>
								<form name="ppt" method="post" action="/MIPS246/UploadServlet" enctype="multipart/form-data">
									<div class="form-group">
										<label class="col-sm-4 control-label">请输入对应的课程小节:</label>
										<div class="col-sm-2">
											<input class="form-control" type="text" name="coursesection"/>
										</div>
									</div>
				    				<input type="hidden" name="filetype" value="3"/>
				    				<input type="hidden" name="roletype" value="teacher"/>
				    				<input type="hidden" name="courseid" value=""/>
				    				<input type="hidden" name="userid" value=""/>
				    				<div class="form-group">
						    			<label class="col-sm-4 control-label">请选择一个文件:</label>
						    			<div class="col-sm-4">
						    				<input type="file" name="uploadFile" />
						    			</div>
					    			</div>
				    				<div class="form-group">
					    				<div class="col-sm-8 col-sm-offset-4">
					    					<!-- <input type="submit" value="上传" /> -->
					    					<button type="submit" class="btn btn-primary">上传</button>
					    				</div>
					    			</div>
								</form>
							<h3>上传课程视频</h3><br>
								<form name="video" method="post" action="/MIPS246/UploadServlet" enctype="multipart/form-data">
									<div class="form-group">
										<label class="col-sm-4 control-label">请输入对应的课程小节:</label>
										<div class="col-sm-2">
											<input class="form-control" type="text" name="coursesection"/>
										</div>
									</div>
				    				<input type="hidden" name="filetype" value="1"/>
				    				<input type="hidden" name="roletype" value="teacher"/>
				    				<input type="hidden" name="courseid" value=""/>
				    				<input type="hidden" name="userid" value=""/>
				    				<div class="form-group">
						    			<label class="col-sm-4 control-label">请选择一个文件:</label>
						    			<div class="col-sm-4">
						    				<input type="file" name="uploadFile" />
						    			</div>
					    			</div>
				    				<div class="form-group">
					    				<div class="col-sm-8 col-sm-offset-4">
					    					<!-- <input type="submit" value="上传" /> -->
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