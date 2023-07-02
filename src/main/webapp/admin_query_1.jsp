<%@ page import="com.example.db.AdminDao" %>
<%@ page import="com.example.db.AdminDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.db.Record" %>
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
                <div class="col-md-6 col-md-offset-3">
                    <h2 class="text-center">学生信息查询</h2>
                    <form id="login_in" action="admin_query_1.jsp" method="post">
                        <div class="form-group">
                            <label><input type="radio" name="radio1" value="1">学号</label>
                            <label><input type="radio" name="radio1" value="2">姓名</label>
                            <label><input type="radio" name="radio1" value="3">年级</label>
                            <label><input type="radio" name="radio1" value="4">专业</label>
                            <label><input type="radio" name="radio1" value="5">班级</label>
                            <label><input type="radio" name="radio1" value="6" checked>全部</label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="text1" name="text1"
                                   placeholder="请输入查询值">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" id="btnLogin" style="width: 50%">提交</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row text-center">
                <%
                    if (request.getParameter("text1") != null) {
                        String[] opt = request.getParameterValues("radio1");
                        String text = request.getParameter("text1");
                        AdminDao dao = new AdminDaoImpl();
                        ArrayList<Record> records = dao.queryStudent(opt[0], text);
                %>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th style="text-align: center">学号</th>
                        <th style="text-align: center">姓名</th>
                        <th style="text-align: center">年龄</th>
                        <th style="text-align: center">性别</th>
                        <th style="text-align: center">户籍</th>
                        <th style="text-align: center">专业</th>
                        <th style="text-align: center">班级</th>
                        <th style="text-align: center">已修学分数</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Record record : records) { %>
                    <tr>
                        <td><%= record.getStudentId() %>
                        </td>
                        <td><%= record.getStudentName() %>
                        </td>
                        <td><%= record.getStudentAge() %>
                        </td>
                        <td><%= record.getStudentSex() %>
                        </td>
                        <td><%= record.getStudentRegion() %>
                        </td>
                        <td><%= record.getMajorName() %>
                        </td>
                        <td><%= record.getClassName() %>
                        </td>
                        <td><%= record.getStudentCredits() %>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
                <% } %>
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
<script type="text/javascript">
    var form = $('#login_in');
    $(document).ready(function () {
        form.bootstrapValidator({
            message: '输入值不合法',
            feedbackIcons: { //提示图标
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                radio1: {
                    validators: {
                        notEmpty: {
                            message: '请选择选项'
                        }
                    }
                }
            }
        });
    });
</script>
</body>
</html>