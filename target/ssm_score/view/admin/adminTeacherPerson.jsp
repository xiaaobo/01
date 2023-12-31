<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <meta charset="utf-8">
    <title>学生成绩系统-教师信息</title>
    <link rel="icon" href="${APP_PATH}/static/images/favicon.ico" type="image/ico">
    <link href="${APP_PATH}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/fonts.css"type="text/css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/style.css"type="text/css" rel="stylesheet">
    <script>
        function deleteTeacher(sid){
            //用户安全提示
            if (confirm("你确定要删除该教师信息吗？")) {
                location.href="${pageContext.request.contextPath}/admin/deleteTeacher?tid="+sid;
            }
        }
    </script>
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
                    <li class="nav-item "> <a href="${pageContext.request.contextPath}/admin/stuPerson"><i class="ftsucai-82"></i>学生信息</a> </li>
                    <li class="nav-item active"> <a href="${pageContext.request.contextPath}/admin/teacherPerson"><i class="ftsucai-table"></i>教师信息</a> </li>
                    <li class="nav-item "> <a href="${pageContext.request.contextPath}/admin/courses"><i class="ftsucai-UI"></i>课程信息</a> </li>
                    <li class="nav-item "> <a href="${pageContext.request.contextPath}/admin/classes"><i class="ftsucai-19"></i>班级信息</a> </li>
                    <li class="nav-item nav-item-has-subnav">
                        <a href="javascript:void(0)"><i class="ftsucai-315"></i>成绩报表</a>
                        <ul class="nav nav-subnav">
                            <li> <a href="${pageContext.request.contextPath}/admin/stuScore">学生成绩</a> </li>
                            <li> <a href="${pageContext.request.contextPath}/admin/classAvgScore">班级平均分</a> </li>
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
                        <span class="navbar-page-title"> 教师信息 </span>
                    </div>

                    <ul class="topbar-right">
                        <li class="dropdown dropdown-profile">
                            <a href="javascript:void(0)" data-toggle="dropdown">
                                <span>管理员，你好！<span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li> <a href="${pageContext.request.contextPath}/admin/toChangePsw"><i class="ftsucai-edit-2"></i> 修改密码</a> </li>
                                <li class="divider"></li>
                                <li><a href="${pageContext.request.contextPath}/admin/exit"><i class="ftsucai-exit2"></i> 退出登录</a> </li>
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
                            <div class="card-toolbar clearfix">
                                <%--添加教师--%>
                                <a class="btn btn-primary m-r-5" href="${pageContext.request.contextPath}/admin/toAddTeacher"> 添加教师</a>
                                <%--导出excel--%>
                                <a class="btn btn-success m-r-5" href="${pageContext.request.contextPath}/admin/teacherPersonInfo?totalCount=${pb.totalCount}&tid=${tid}&tname=${tname}"> 导出Excel</a>
                                <%--按课程名称查询--%>
                                <form class="form-inline pull-right" action="${pageContext.request.contextPath}/admin/teacherPerson" method="post" >
                                    <span style="color: red;font-weight:bold">${pb.error}</span>
                                    <div class="form-group">
                                        <input class="form-control" type="text" name="tid" placeholder="请输入教师号..">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="text"  name="tname" placeholder="请输入教师姓名..">
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-success" type="submit">查询</button>
                                    </div>
                                </form>
                            </div>

                            <%--显示个人成绩--%>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>教师号</th>
                                            <th>姓名</th>
                                            <th>出生日期</th>
                                            <th>性别</th>
                                            <th>电话号码</th>
                                            <th>邮箱</th>
                                            <th>带领班级</th>
                                            <th>职位</th>
                                            <th>学历</th>
                                            <th>账号</th>
                                            <th>密码</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="teacher" items="${requestScope.get('teachers')}" >
                                            <tr>
                                               <td>${teacher.t_id}</td>
                                               <td>${teacher.t_name}</td>
                                               <td>${teacher.t_birth}</td>
                                               <td>${teacher.t_sex}</td>
                                               <td>${teacher.t_tel}</td>
                                               <td>${teacher.t_email}</td>
                                               <td>${teacher.t_class.class_name}</td>
                                               <td>${teacher.t_position}</td>
                                               <td>${teacher.t_education}</td>
                                               <td>${teacher.t_userName}</td>
                                               <td>${teacher.t_psw}</td>
                                                <td> <a class="btn btn-xs btn-default" href="${pageContext.request.contextPath}/admin/toUpdateTeacher?t_id=${teacher.t_id}&t_name=${teacher.t_name}&t_birth=${teacher.t_birth}&t_sex=${teacher.t_sex}&t_tel=${teacher.t_tel}&t_email=${teacher.t_email}&t_userName=${teacher.t_userName}&t_psw=${teacher.t_psw}&t_position=${teacher.t_position}&t_education=${teacher.t_education}" title="编辑" data-toggle="tooltip"><i class="ftsucai-edit-2"></i></a>
                                                    <a class="btn btn-xs btn-default" href="javascript:deleteTeacher(${teacher.t_id});" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                            <%--分页--%>
                            <ul class="pagination">
                                <%----%>
                                <c:if test="${pb.currentPage==1}">
                                <li class="disabled">
                                    </c:if>
                                    <c:if test="${pb.currentPage!=1}">
                                <li>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/admin/teacherPerson?currentPage=${pb.currentPage-1}&rows=10&tname=${tname}&tid=${tid}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <%--totalPage=总页码 currentPage=当前页码 startIndex=开始页码--%>
                                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                                    <c:if test="${pb.currentPage == i}">
                                        <li class="active"><a href="${pageContext.request.contextPath}/admin/teacherPerson?currentPage=${i}&rows=10&tname=${tname}&tid=${tid}"> ${i}</a></li>
                                    </c:if>
                                    <c:if test="${pb.currentPage != i}">
                                        <li><a href="${pageContext.request.contextPath}/admin/teacherPerson?currentPage=${i}&rows=10&tname=${tname}&tid=${tid}"> ${i}</a></li></li>
                                    </c:if>
                                </c:forEach>
                                <%----%>
                                <c:if test="${pb.currentPage==pb.totalPage}">
                                <li class="disabled">
                                    </c:if>
                                    <c:if test="${pb.currentPage!=pb.totalPage}">
                                <li>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/admin/teacherPerson?currentPage=${pb.currentPage+1}&rows=10&tname=${tname}&tid=${tid}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                                <%----%>
                                <span style="font-size: 25px;margin-left: 5px">
                                    共${pb.totalCount}条记录，共${pb.totalPage}页
                                </span>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </main>
        <!--页面主要内容-->
    </div>
</div>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/main.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static//js/baidu.js"></script>
</body>
</html>
