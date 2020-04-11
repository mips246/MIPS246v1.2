<%-- <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/normalize/8.0.1/normalize.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>管理员首页</title>
</head>
<body>
<%
request.setCharacterEncoding("GBK");
%>
<div class="container clearf">
    <div class="container clearf">
        <div class="top-nav clearf">
            <div class="fl">
                <div class="item">
                    <a href="admin.jsp"><button type="button" class="btn btn-primary">首页</button></a>
                </div>
                <div class="item">
                    <a href="admin_course.jsp"><button type="button" class="btn btn-primary">课程</button></a>
                </div>
                <div class="item">
                    <a href="admin_teacher.jsp"><button type="button" class="btn btn-primary">老师</button></a>
                </div>
                <div class="item">
                    <a href="admin_student.jsp"><button type="button" class="btn btn-primary">学生</button></a>
                </div>
            </div>
            <div class="fr">
                <div class="item">
                    <a href="../logout.jsp"><button type="button" class="btn btn-primary">退出</button></a>
                </div>
            </div>
        </div>
        <h1>欢迎管理员</h1>
        <h3>本页面是管理员的主页，有三个模块功能，分别是:</h3>
        <h4>功能1</h4>
        <p>课程的增删改，指定某课程的老师</p>
        <h4>功能2</h4>
        <p>对学生的增删改，并且查看学生的选课信息</p>
        <h4>功能3</h4>
        <p>对老师的增删改，查看所有老师的信息</p>
    </div>
</div>
</body>
</html> --%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
	<link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
	<link href="../css/animate.min.css" rel="stylesheet">
	<link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <title>MIPS246 管理员登录</title>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<%
request.setCharacterEncoding("GBK");
%>
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
							<span class="block m-t-xs"> <strong class="font-bold">欢迎管理员登录</strong>
							</span>
						</div>
						<div class="logo-element">
							MIPS<br>246
						</div>
					</li>
					<!-- <li><a class="J_menuItem" href="updatepw.jsp"> <i
							class="fa fa-key"></i> <span class="nav-label">修改密码</span>
					</a></li> -->
					
					<li><a href="#"> <i class="fa fa-table"></i> <span
							class="nav-label">课程管理</span> <span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="admin_course.jsp">查看课程列表</a>
							</li>
							<li><a class="J_menuItem" href="admin_add_course.jsp">添加课程</a>
							</li>
						</ul>
					</li>
					
					<li><a href="#"> <i class="fa fa-mortar-board"></i> <span
							class="nav-label">学生管理</span> <span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="admin_student.jsp">查看学生列表</a>
							</li>
							<li><a class="J_menuItem" href="admin_add_student.jsp">添加学生</a>
							</li>
						</ul>
					</li>
					
					<li><a href="#"> <i class="fa fa-users"></i> <span
							class="nav-label">教师管理</span> <span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="admin_teacher.jsp">查看教师列表</a>
							</li>
							<li><a class="J_menuItem" href="admin_add_teacher.jsp">添加教师</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>

		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"> <i class="fa fa-bars"></i>
						</a>
						<h1 align="right">
							<b>MIPS246</b>
						</h1>
					</div>
				</nav>
			</div>

			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>

				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab"
							data-id="index_v6.html">首页</a>
					</div>
				</nav>

				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>

				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作 <span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>

				<a href="../logout.jsp" class="roll-nav roll-right J_tabExit"> <i
					class="fa fa fa-sign-out"></i> 退出
				</a>

			</div>

			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="index.jsp" frameborder="0" data-id="index_v1.html" seamless></iframe>
			</div>

			<div class="footer">
				<div class="pull-right">&copy; 同济大学国家计算机实验示范中心</div>
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