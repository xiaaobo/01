<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <meta charset="utf-8">
    <title>学生成绩系统-首页</title>
    <link rel="icon" href="${APP_PATH}/static/images/favicon.ico" type="image/ico">
    <link href="${APP_PATH}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/fonts.css"type="text/css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/style.css"type="text/css" rel="stylesheet">
</head>
<body>
<div class="ftdms-layout-web">
    <div class="ftdms-layout-container">
        <!--左侧导航-->
        <aside class="ftdms-layout-sidebar">
            <!-- logo -->
            <div id="logo">
                <a href="http://www.nxist.com/views/font/homepage.form"><img src="${APP_PATH}/static/images/logo.png"  alt="logo"/></a>
            </div>
            <div class="ftdms-layout-sidebar-scroll">
                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active"> <a href="${pageContext.request.contextPath}/stu/stuScore"><i class="ftsucai-82"></i>个人成绩</a> </li>
                        <li class="nav-item  nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ftsucai-edit-2"></i>个人信息编辑</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/stu/stuPersonal">个人信息</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/stu/toUpdateStu">修改</a> </li>
                            </ul>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ftsucai-edit-2"></i>班级成绩排行</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/stu/stuSumRank?currentPage=1&rows=10">平均分排行</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/stu/queryRankByCname?currentPage=1&rows=10">科目成绩排行</a> </li>
                            </ul>
                    </ul>
                </nav>
            </div>
        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <header class="ftdms-layout-header">

            <nav class="navbar navbar-default">
                <div class="topbar">

                    <div class="topbar-left">
                        <div class="ftdms-aside-toggler">
                            <span class="ftdms-toggler-bar"></span>
                            <span class="ftdms-toggler-bar"></span>
                            <span class="ftdms-toggler-bar"></span>
                        </div>
                        <span class="navbar-page-title"> 个人成绩 </span>
                    </div>

                    <ul class="topbar-right">
                        <li class="dropdown dropdown-profile">
                            <a href="javascript:void(0)" data-toggle="dropdown">
                                <span>${login_msg}，你好！<span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li> <a href="${pageContext.request.contextPath}/stu/toChangePsw"><i class="ftsucai-edit-2"></i> 修改密码</a> </li>
                                <li class="divider"></li>
                                <li><a href="${pageContext.request.contextPath}/stu/exit"><i class="ftsucai-exit2"></i> 退出登录</a> </li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </nav>

        </header>
        <!--End 头部信息-->

        <!--页面主要内容-->
        <main class="ftdms-layout-content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">

                                <form method="post" action="${pageContext.request.contextPath}/stu/changePsw" class="site-form">
                                    <div class="form-group">
                                        <label for="old-password">旧密码</label><span style="color: red;font-weight:bold">${error_OldPsw}</span>
                                        <input type="password" class="form-control" name="oldPsw" id="old-password" placeholder="输入账号的原登录密码">
                                    </div>
                                    <div class="form-group">
                                        <label for="new-password">新密码</label><span style="color: red;font-weight:bold">${error_NewPsw}</span>
                                        <input type="password" class="form-control" name="newPsw" id="new-password" placeholder="输入新的密码">
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm-password">确认新密码</label>
                                        <input type="password" class="form-control" name="confirmPsw" id="confirm-password" placeholder="请确认密码">
                                    </div>
                                    <button type="submit" class="btn btn-primary">修改密码</button>
                                    <input class="btn btn-warning" type="reset" value="重置" />
                                </form>

                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/main.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static//js/baidu.js"></script>
</body>
</html>
