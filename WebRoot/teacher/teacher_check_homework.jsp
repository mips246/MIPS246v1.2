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
		function validateGrade(grade){
        	var flag = true;
            var reg = new RegExp(/^(?:[1-9]?\d|100)$/);
            if(!reg.test(grade)){
            	alert("成绩不合法！");
                flag=false;
            	return flag;
            }
        	return flag;
        }
	</script>
	
	<script type="text/javascript">
        function loadInfoTable(){
        	var courseid = getUrlParams("courseid");
        	var studentid = getUrlParams("studentid");
            $.ajax({
                url:"/MIPS246/TeacherServlet",
                type:"POST",
                data:{
                    method:"selectStudentHomeworkList",
                    studentid:studentid,
                    courseid:courseid
                },
                dataType:"json",
                success:function(data){
                    dealData(data);
                }
            });
        }
        
        function dealData(data){
        	$("#homeworkList").html("");
        	//var no = 0;
			$.each(data, function(index) {
	
				var fileno = data[index].fileno;
				var fileurl = data[index].fileurl;
				var filename = data[index].filename;
				var coursesection = data[index].coursesection;
				var createtime = data[index].createtime;
				var grade = data[index].grade;
	
				var str = (grade != 0 ? "disabled='disabled'" : " ");
				
				var buttonStr0 = '<td class="text-center"><button onclick="updateHWGrade(\'' + fileno + '\')" class="btn btn-primary demo4">提交成绩</button></td>';
				var buttonStr1 = "<td class='text-center'><button class='btn btn-danger demo4' disabled='disabled'>已提交</button></td>";
				var buttonStr  =  grade != 0 ? buttonStr1 :buttonStr0;
				
				tt = "<tr>"
					+ "<td class='text-center'><a href=\'" + fileurl + "\' download=\'" + filename + "\'>" + filename + "</a></td>"
					+ "<td class='text-center'>" + coursesection + "</td>"
					+ "<td class='text-center'>" + createtime + "</td>"
					+ "<td class='text-center'><input class='form-control' style='width:60px;margin:0 auto;padding:2px' id='gradeHW" + fileno + "' " + str + " type='number' value='" + grade + "' ></td>"
					//+"<td><input style='width:60px;margin:0 auto;padding:2px' id='"+fileurl+"' "+str+" type='number' value='"+grade+"' ></td>"
					//+"<td>"+grade+"</td>"
					//+ '<td class="text-center"><button onclick="updateHWGrade(\'' + fileno + '\')" class="btn btn-primary demo4">提交成绩</button></td>'
					+ buttonStr
					//+'<td><button onclick="updateHWGrade(\''+filename+'\',\''+no+'\')">提交成绩</button></td>'
					+ "</tr>";
				$("#homeworkList").append(tt);
				//no += 1;
			});
		}
    </script>
    
    <script type="text/javascript">
    /*
     *	这是没改数据库之前的写法
    	function updateHWGrade(filename,no){
    		var courseid = getUrlParams("courseid");
        	var studentid = getUrlParams("studentid");
        	var grade = $("#gradeHW"+no).val();
        	if(validateGrade(grade)){
        		$.ajax({
        			url:"/MIPS246/TeacherServlet",
                	type:"POST",
                	data:{
                    	method:"updateHWGrade",
                  		filename:filename,
                  		courseid:courseid,
                  		studentid:studentid,
                    	grade:grade
                	},
                	dataType:"json",
                	success:function(data){
                		alert("成绩提交成功");
                		window.location.reload();
                	}
        		});
        	}
    	}
    */
    function updateHWGrade(fileno){
        	var grade = $("#gradeHW"+fileno).val();
        	if(validateGrade(grade)){
        		$.ajax({
        			url:"/MIPS246/TeacherServlet",
                	type:"POST",
                	data:{
                    	method:"updateHWGrade",
                  		fileno:fileno,
                    	grade:grade
                	},
                	dataType:"json",
                	success:function(data){
                		alert("成绩提交成功");
                		//window.location.reload();
                		loadInfoTable();
                	}
        		});
        	}
    	}
    </script>
    
    <script type="text/javascript">
    	function back(){
    		var courseid = getUrlParams("courseid");
    		var url = "teacher_check_homework_index.jsp?courseid=" + courseid;
    		//var url = "teacher_check_homework_index.jsp";
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
                        <h5>作业列表</h5>
                        <div class="col-sm-3 m-b-xs"></div>
			        	<div class="col-sm-7"></div>
                        <div class="input-group">
                            <button type="button" onclick="back()" class="btn btn-primary btn-sm demo4">返回</button>
                        </div>
                    </div>
			        <div class="ibox-content">
			        	<div class="table-responsive" class="row">
			        		<div class="col-sm-12">
					        	<table class="table table-striped" class="text-center">
					        		<thead>
					        			<tr>
					        				<th class="text-center ">作业</th>
						                    <th class="text-center ">课程小节</th>
						                    <th class="text-center ">提交时间</th>
						                    <th class="text-center ">成绩</th>
						                    <th class="text-center "></th>
						                </tr>
						            </thead>
									<tbody id="homeworkList">
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