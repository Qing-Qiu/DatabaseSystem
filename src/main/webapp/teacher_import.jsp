<%@ page import="com.example.db.TeacherDao" %>
<%@ page import="com.example.db.TeacherDaoImpl" %>
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
                <div class="col-md-4 col-md-offset-4">
                    <h2 class="text-center">学生成绩录入</h2>
                    <form id="login_in" action="teacher_import.jsp" method="post">
                        <div class="form-group">
                            <label for="course_id">具体课程编号</label>
                            <input type="text" class="form-control" id="course_id" name="course_id"
                                   placeholder="请输入具体课程编号">
                            <label for="student_id">学号</label>
                            <input type="text" class="form-control" id="student_id" name="student_id"
                                   placeholder="请输入学号">
                            <label for="value">成绩</label>
                            <input type="text" class="form-control" id="value" name="value"
                                   placeholder="请输入成绩">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" id="btnLogin" style="width: 50%">登记</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row text-center">
                <%
                    if (request.getParameter("value") != null) {
                        TeacherDao dao = new TeacherDaoImpl();
                        Record record = new Record();
                        record.setCourseId(request.getParameter("course_id"));
                        record.setStudentId(request.getParameter("student_id"));
                        record.setScoreValue(request.getParameter("value"));
                        boolean flag = dao.importStudent(record);
                        if (flag) out.print("登记成功");
                        else out.print("登记失败");
                    }
                %>
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
            course_id: {
                validators: {
                    notEmpty: {
                        message: '不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 255
                    }
                }
            },
            student_id: {
                validators: {
                    notEmpty: {
                        message: '不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 255
                    }
                }
            },
            value: {
                validators: {
                    notEmpty: {
                        message: '不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 255
                    }
                }
            }
        })
    });
</script>
</body>
</html>