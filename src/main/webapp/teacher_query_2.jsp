<%@ page import="com.example.db.TeacherDao" %>
<%@ page import="com.example.db.TeacherDaoImpl" %>
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
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">信息查询
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="teacher_query_1.jsp">教师任课信息</a></li>
                        <li><a href="teacher_query_2.jsp">课程平均分统计</a></li>
                        <li><a href="teacher_query_3.jsp">学生成绩名次查询</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">信息录入
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="teacher_import.jsp">学生成绩录入</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right" id="login">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">教师
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="teacher_changepwd.jsp">修改密码</a></li>
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
                    <h2 class="text-center">课程平均分统计</h2>
                    <form id="login_in" action="teacher_query_2.jsp" method="post">
                        <div class="form-group">
                            <label><input type="radio" name="radio1" value="1">具体课程号</label>
                            <label><input type="radio" name="radio1" value="2" checked>全部</label>
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
                        TeacherDao dao = new TeacherDaoImpl();
                        ArrayList<Record> records = dao.queryScoreAvg(opt[0], text);
                %>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th style="text-align: center">具体课程编号</th>
                        <th style="text-align: center">课程名</th>
                        <th style="text-align: center">平均分</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Record record : records) { %>
                    <tr>
                        <td><%= record.getCourseId() %>
                        </td>
                        <td><%= record.getCourseName() %>
                        </td>
                        <td><%= record.getScoreValue() %>
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
</body>
</html>