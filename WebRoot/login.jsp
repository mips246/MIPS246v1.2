<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>同济大学计算机系统设计实验平台</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/normalize/8.0.1/normalize.css">
	<link rel="stylesheet" href="css/main.css">
  	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
  	
  	<!-- 新增 -->
  	<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
  	
  	<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
  	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<script language="javascript">
  		function validate(f){
    		if(!(/^\w{5,15}$/.test(f.userid.value))){
      			alert("用户id必须是5-15位");
      			f.userid.focus();
      			return false;
    		}
    		return true;
 		}
	</script>
	<script>
	    function check(){                 
	        var ids = document.getElementsByName("role");                  
	        var flag = false ;                
	        for(var i=0;i<ids.length;i++){  
	            if(ids[i].checked){  
	                flag = true ;  
	                break ;  
	            }  
	        }  
	        if(!flag){  
	            alert("请选择身份！");  
	            return false ;  
	        }  
	    }
	    
    </script>
</head>

<body class="gray-bg">
<%
	request.setCharacterEncoding("GBK");
%>
<%
 	List<String>info=(List<String>)request.getAttribute("info");
 	if(info!=null){
 		Iterator<String>iter=info.iterator();
 		while(iter.hasNext()){
%>
			<h4><%=iter.next()%></h4>
<%
		}
	}
%>
	<div class="text-center animated fadeInDown">
		<div>
			<div>
                <h1 class="logo-name">MIPS246</h1>
            </div>
            <h3>同济大学计算机系统设计实验平台</h3>
			<form action='LoginServletNew' method='post' onsubmit="return validate(this)">
				<div class="middle-box">
			
					<div class="form-group">
					    <input type="radio" name="role" value="student" checked="checked">学生
			            <input type="radio" name="role" value="teacher">教师
			            <input type="radio" name="role" value="admin">管理员
					</div>
					
					<div class="form-group">
				        <input type='text' class="form-control" placeholder="请输入您的账号" name='userid' value=''/>
					</div>
					
					<div class="form-group">
					    <input type='password' class="form-control" placeholder="请输入您的密码" name='userpass' value=''/>
					</div>
					
					<div class="form-group">
						<input type='submit' class="btn btn-primary block full-width m-b" value='登录'/>
					</div>
				
				</div>
			</form>
		</div>
	</div>

</body>
</html>