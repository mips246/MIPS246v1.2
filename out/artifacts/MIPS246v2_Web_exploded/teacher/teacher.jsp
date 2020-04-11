<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>MIPS246 教师登录</title>

	    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
	    <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
	    <link href="../css/animate.min.css" rel="stylesheet">
	    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
	    
	</head>
	
	<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
		<div id="wrapper">
		
			<!--左侧导航开始-->
			<nav class="navbar-default navbar-static-side" role="navigation">
				<div class="nav-close">
					<i class="fa fa-times-circle"></i>
				</div>
				<div class="sidebar-collapse">
					<ul class="nav" id="side-menu">
						<li class="nav-header">
							<div class="dropdown profile-element">
								<span class="block m-t-xs">
									<strong class="font-bold">欢迎登录，${sessionScope.u_name}老师</strong>
								</span>
							</div>
							<div class="logo-element">MIPS<br>246</div>
	                    </li>
	                    <li>
                    		<a class="J_menuItem" href="updatepw.jsp">
                    		<i class="fa fa-key"></i>
                    		<span class="nav-label">修改密码</span>
                    		</a>
		                </li>
		                <li>
		                    <a href="#">
		                    	<i class="fa fa-table"></i>
		                    	<span class="nav-label">课程管理</span>
		                    	<span class="fa arrow"></span>
		                    </a>
		                    <ul class="nav nav-second-level">
		                		<li>
		                			<a class="J_menuItem" href="teacher_course.jsp">查看我的课程</a>
		                		</li>
		                		<li>
		                			<a class="J_menuItem" href="teacher_upload.jsp">上传课程资料</a>
		                		</li>
		                	</ul>
		                </li>
		                <li>
		                	<a href="#">
		                		<i class="fa fa fa-bar-chart-o"></i>
		                		<span class="nav-label">学生管理</span>
		                		<span class="fa arrow"></span>
		                	</a>
		                	<ul class="nav nav-second-level">
		                		<li>
		                			<a class="J_menuItem" href="teacher_submit_grade.jsp">提交学生课程成绩</a>
		                		</li>
		                		<li>
		                			<a class="J_menuItem" href="teacher_check_homework_index.jsp">查看学生作业</a>
		                		</li>
		                	</ul>
		                </li>
					</ul>
				</div>
			</nav>
			
			<!--右侧部分开始-->
			<div id="page-wrapper" class="gray-bg dashbard-1">
				<div class="row border-bottom">
					<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
						<div class="navbar-header">
							<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#">
								<i class="fa fa-bars"></i>
							</a>
							<h1 align="right"><b>MIPS246</b></h1>
						</div>
					</nav>
				</div>
				
				<div class="row content-tabs">
					<button class="roll-nav roll-left J_tabLeft">
						<i class="fa fa-backward"></i>
            		</button>
            		
            		<nav class="page-tabs J_menuTabs">
		                <div class="page-tabs-content">
		                    <a href="javascript:;" class="active J_menuTab" data-id="index_v6.html">首页</a>
		                </div>
		            </nav>
		            
		            <button class="roll-nav roll-right J_tabRight">
		            	<i class="fa fa-forward"></i>
           	 		</button>
           	 		
           	 		<div class="btn-group roll-nav roll-right">
		                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作
		                	<span class="caret"></span>
		                </button>
		                <ul role="menu" class="dropdown-menu dropdown-menu-right">
		                    <li class="J_tabShowActive">
		                    	<a>定位当前选项卡</a>
		                    </li>
		                    <li class="divider"></li>
		                    <li class="J_tabCloseAll">
		                    	<a>关闭全部选项卡</a>
		                    </li>
		                    <li class="J_tabCloseOther">
		                    	<a>关闭其他选项卡</a>
		                    </li>
		                </ul>
		            </div>
           	 		
           	 		<a href="../logout.jsp" class="roll-nav roll-right J_tabExit">
           	 			<i class="fa fa fa-sign-out"></i> 退出
           	 		</a>
           	 		
				</div>
				
				<div class="row J_mainContent" id="content-main">
			    	<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="index.jsp" frameborder="0" data-id="index_v1.html" seamless></iframe>
			    </div>
           	 		
           	 	<div class="footer">
			    	<div class="pull-right">
			            &copy; 同济大学国家计算机实验示范中心
			        </div>
			    </div>
				
			</div>
		</div>
		
		<script src="../js/jquery.min.js?v=2.1.4"></script>
		<script src="../js/bootstrap.min.js?v=3.3.6"></script>
		<script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
		<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="../js/plugins/layer/layer.min.js"></script>
		<script src="../js/hplus.min.js?v=4.1.0"></script>
		<script type="text/javascript" src="../js/contabs.min.js"></script>
		<script src="../js/plugins/pace/pace.min.js"></script>
	</body>
</html>