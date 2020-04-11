<%--<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="zh-CN">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--    <link rel="stylesheet" href="https://cdn.bootcss.com/normalize/8.0.1/normalize.css">--%>
<%--    <link rel="stylesheet" href="../css/main.css">--%>
<%--    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">--%>
<%--    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>--%>
<%--    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>--%>
<%--    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>
<%--    <title>同济大学计算机实验平台</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container clearf">--%>
<%--    <div class="top-nav clearf">--%>
<%--        <div class="fl">--%>
<%--            <div class="item">--%>
<%--                <a href="student_main.jsp"><button type="button" class="btn btn-primary ">首页</button></a>--%>
<%--            </div>--%>
<%--            <div class="item">--%>
<%--                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">课程</button>--%>
<%--                <div class="dropdown-menu">--%>
<%--                    <a class="dropdown-item" href="student_select_course.jsp">选课</a>--%>
<%--                    <a class="dropdown-item" href="student_course.jsp">上课</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="item">--%>
<%--                <a href="student_archive.jsp"><button type="button" class="btn btn-primary ">资料</button></a>--%>
<%--            </div>--%>
<%--            <div class="item">--%>
<%--                <a href="student_homework.jsp"><button type="button" class="btn btn-primary ">作业</button></a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="fr">--%>
<%--            <div class="item">--%>
<%--                <!--<button type="button" class="btn btn-primary"><a href="logout.jsp">退出</a></button>  -->--%>
<%--                <a href="../logout.jsp"><button type="button" class="btn btn-primary ">退出</button></a>--%>
<%--                <a href="info.jsp"><button type="button" class="btn btn-primary ">个人信息</button></a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="header clearf">--%>
<%--    <div class="container">--%>
<%--        <div class="col-5">--%>
<%--            <h3>同济大学计算机实验平台</h3>--%>
<%--            <%--%>
<%--            List<String>info=(List<String>)request.getAttribute("info");--%>
<%--            if(info!=null){--%>
<%--            Iterator<String>iter=info.iterator();--%>
<%--                while(iter.hasNext()){--%>
<%--                %>--%>
<%--                <h4><%=iter.next()%></h4>--%>
<%--                <%--%>
<%--                }--%>
<%--                }--%>
<%--                %>--%>
<%--                <br/>--%>

<%--                <p>针对现今计算机专业实验教学过程中存在的验证性实验为主、实验技术孤立、内容分散等问题，我们提出了一种面向计算机专业的贯通式实验改革方案。该实验方案从设计处理器部件出发，到实现自己的处理器，然后围绕设计的处理器展开对处理器的优化，在该处理器上设计编译器以及操作系统。实验内容覆盖多门计算机专业基础课和专业课，前后联系紧密，建立了“前继课程实验结果作为后续课程实验的基础，后续课程实验的过程作为前继课程实验的反馈”的实验平台。</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link href="../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <title>MIPS246 学生登录</title>
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
            <div class="sidbar-collapse">
                <u1 class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span class="block m-t-xs">
                                <strong class="font-bold">欢迎<%=session.getAttribute("userid")%></strong>
                            </span>
                        </div>
                        <div class="logo-element">
                            MIPS<br>246
                        </div>
                    </li>
                    <li><a href="#"> <i class="fa fa-table"></i> <span
                            class="nav-label">课程</span> <span class="fa arrow"></span>
                    </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="student_select_course.jsp">选课</a>
                            </li>
                            <li><a class="J_menuItem" href="student_course.jsp">上课</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"> <i class="fa fa-mortar-board"></i> <span
                            class="nav-label">资料</span> <span class="fa arrow"></span>
                    </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="student_archive.jsp">资料下载</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"> <i class="fa fa-mortar-board"></i> <span
                            class="nav-label">作业</span> <span class="fa arrow"></span>
                    </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="student_homework.jsp">查看作业</a>
                            </li>
                        </ul>
                    </li>
                </u1>

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