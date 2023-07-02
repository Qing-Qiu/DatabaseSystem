<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>高校成绩管理系统</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
    <style>
        @media (max-width: 1000px) {
            #pic {
                width: 0;
                padding: 0;
                margin: 0;
            }
        }

        #pic dt {
            position: absolute;
            bottom: 5px;
            right: 5px;
        }

        #pic {
            overflow: hidden;
        }

        #pic dl dt a {
            display: block;
            float: left;
            width: 17px;
            height: 17px;
            margin: 2px;
            border: #963 solid 1px;
            border-radius: 15px;
            background-color: #6F605A;
            color: #FFF;
            text-decoration: none;
            text-align: center;
            padding: 0;
            font-size: 12px;
        }
    </style>
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
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="container">
            <div class="row">
                <div class="col-sm-8" id="pic" style="max-width: 100%;max-height: 100%;">
                    <dl>
                        <dt>
                            <a href="#" id="a1">1</a>
                            <a href="#" id="a2">2</a>
                            <a href="#" id="a3">3</a>
                        </dt>
                        <dd>
                            <a href="#"><img src="img/pic1.jpg" id="pic123" class="img-thumbnail"></a>
                        </dd>
                    </dl>
                </div>
                <div class="col-md-4" style="float: right">
                    <h2 class="text-center">用户登录</h2>
                    <form id="login_in" action="LoginServlet" method="post">
                        <div class="form-group">
                            <label for="username">用户名：</label>
                            <input type="text" class="form-control" id="username" name="username"
                                   placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="password">密码：</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="请输入密码">
                        </div>
                        <div class="form-group">
                            <label><input type="radio" name="role" value="1">管理员</label>
                            <label><input type="radio" name="role" value="2">教师</label>
                            <label><input type="radio" name="role" value="3" checked="checked">学生</label>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" id="btnLogin" style="width: 50%">登录</button>
                        </div>
                    </form>
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
<script type="text/javascript">
    window.onload = function () {
        if (document.getElementById("a1") != null) {
            document.getElementById("a1").onmouseover = function () {
                document.getElementById("pic123").src = "img/pic1.jpg";
            }
        }
        if (document.getElementById("a2") != null) {
            document.getElementById("a2").onmouseover = function () {
                document.getElementById("pic123").src = "img/pic2.jpg";
            }
        }
        if (document.getElementById("a3") != null) {
            document.getElementById("a3").onmouseover = function () {
                document.getElementById("pic123").src = "img/pic3.jpg";
            }
        }
    }
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
                username: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 255
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 255
                        }
                    }
                }
            }
        });
    });
</script>
</body>
</html>