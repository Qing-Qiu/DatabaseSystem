<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.db.StudentDao" %>
<%@ page import="com.example.db.StudentDaoImpl" %>
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
                        <li><a href="student_query_1.jsp">班级课程查询</a></li>
                        <li><a href="student_query_2.jsp">教师授课查询</a></li>
                        <li><a href="student_query_3.jsp">成绩查询</a></li>
                        <li><a href="student_query_4.jsp">已修学分查询</a></li>
                        <li><a href="student_query_5.jsp">个人课表查询</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right" id="login">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">学生
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="student_changepwd.jsp">修改密码</a></li>
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
                    <h2 class="text-center">成绩查询</h2>
                    <form id="login_in" action="student_query_3.jsp" method="post">
                        <div class="form-group">
                            <label><input type="radio" name="radio1" value="1">大一上</label>
                            <label><input type="radio" name="radio1" value="2">大一下</label>
                            <label><input type="radio" name="radio1" value="3">大二上</label>
                            <label><input type="radio" name="radio1" value="4">大二下</label>
                            <label><input type="radio" name="radio1" value="5">大三上</label>
                            <label><input type="radio" name="radio1" value="6">大三下</label>
                            <label><input type="radio" name="radio1" value="7">大四上</label>
                            <label><input type="radio" name="radio1" value="8">大四下</label>
                            <label><input type="radio" name="radio1" value="9" checked>全部</label>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" id="btnLogin" style="width: 50%">提交</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row text-center">
                <%
                    if (request.getParameterValues("radio1") != null) {
                        String[] opt = request.getParameterValues("radio1");
                        StudentDao dao = new StudentDaoImpl();
                        ArrayList<Record> records = dao.queryScore(opt[0], session.getAttribute("username").toString());
                %>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th style="text-align: center">学号</th>
                        <th style="text-align: center">姓名</th>
                        <th style="text-align: center">课程名</th>
                        <th style="text-align: center">成绩</th>
                        <th style="text-align: center">教师名</th>
                        <th style="text-align: center">开设学期</th>
                        <th style="text-align: center">班级</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Record record : records) { %>
                    <tr>
                        <td><%= record.getStudentId() %>
                        </td>
                        <td><%= record.getStudentName() %>
                        </td>
                        <td><%= record.getCourseName() %>
                        </td>
                        <td><%= record.getScoreValue() %>
                        </td>
                        <td><%= record.getTeacherName() %>
                        </td>
                        <td><%= record.getCourseTerm() %>
                        </td>
                        <td><%= record.getClassName() %>
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