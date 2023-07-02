<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>高校成绩管理系统</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <img src="./img/meow.jpg" class="navbar-brand img-circle">
            <a class="navbar-brand" href="#">高校成绩管理系统</a>
            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">信息管理
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="admin_update_1.jsp">学生信息修改</a></li>
                        <li><a href="admin_update_2.jsp">教师信息修改</a></li>
                        <li><a href="admin_update_3.jsp">课程信息修改</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">教务管理
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="admin_resetpwd.jsp">师生密码重置</a></li>
                        <li><a href="admin_import_1.jsp">教师聘用登记</a></li>
                        <li><a href="admin_import_2.jsp">新生登记</a></li>
                        <%--                        <li class="dropdown-submenu">--%>
                        <%--                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">新用户注册</a>--%>
                        <%--                            <ul class="dropdown-menu">--%>
                        <%--                                <li><a href="#">教师</a></li>--%>
                        <%--                                <li><a href="#">学生</a></li>--%>
                        <%--                            </ul>--%>
                        <%--                        </li>--%>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">信息查询
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-submenu">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="admin_query_1.jsp">学生信息查询</a>
                            <ul class="dropdown-menu">
                                <li><a href="admin_query_1.jsp">基本信息</a></li>
                                <li><a href="admin_query_6.jsp">生源地信息</a></li>
                            </ul>
                        </li>
                        <li><a href="admin_query_2.jsp">教师信息查询</a></li>
                        <li><a href="admin_query_3.jsp">班级信息查询</a></li>
                        <li><a href="admin_query_4.jsp">专业信息查询</a></li>
                        <li><a href="admin_query_5.jsp">课程信息查询</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right" id="login">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">管理员
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="admin_changepwd.jsp">修改密码</a></li>
                        <li><a href="index.jsp">登出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <h2 class="text-center">您好，管理员！</h2>

                </div>
            </div>
        </div>
    </div>
    <div class="row"><br/></div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <footer class="footer text-center">
        <div class="container">
            <p>&copy; 2023 版权所有</p>
            <p>技术支持：XXX</p>
            <p>分享链接：<a href="#">Github</a> | <a href="#">QQ</a> | <a href="#">Wechat</a></p>
        </div>
    </footer>
</div>
</body>
</html>