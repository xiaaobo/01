<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <meta charset="utf-8">
    <title>学生成绩系统-学生信息</title>
    <link rel="icon" href="${APP_PATH}/static/images/favicon.ico" type="image/ico">
    <link href="${APP_PATH}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/fonts.css"type="text/css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/style.css"type="text/css" rel="stylesheet">
    <link href="${APP_PATH}/static/js/jquery.min.js"type="text/css" rel="stylesheet">
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
                        <li class="nav-item active"> <a href="${pageContext.request.contextPath}/admin/stuPerson"><i class="ftsucai-82"></i>学生信息</a> </li>
                        <li class="nav-item "> <a href="${pageContext.request.contextPath}/admin/teacherPerson"><i class="ftsucai-table"></i>教师信息</a> </li>
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
                        <span class="navbar-page-title"> 学生信息-修改学生信息 </span>
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

                            <div class="card-body">

                                <div class="table-responsive">

                                    <%--
                                     出现的问题：提交sql请求，修改失败，初次考虑，是事务问题，使用aop横切配置事务后依然失败
                                     修改id需要使用隐藏域hidden把id提交
                                    --%>

                                    <div class="card">
                                        <span style="color: red;font-weight:bold">${error}</span>
                                        <div class="card-header"><h4>修改学生信息</h4></div>
                                        <div class="card-body">

                                            <form action="${pageContext.request.contextPath}/admin/updateStu" method="post">
                                                <%-- 隐藏域ID,旧用户名--%>
                                                <input type="hidden" name="s_id" value="${s_id}"> <input type="hidden" name="oldUserName" value="${s_userName}">
                                                <div class="form-group">
                                                    <label for="example-nf-name">姓名</label>
                                                    <input class="form-control" name="s_name" type="text" id="example-nf-name" value="${s_name}" required="required">
                                                </div>
                                                <div class="form-group">
                                                    <label for="example-nf-birth">出生日期</label>
                                                    <input class="form-control" name="s_birth" type="date" id="example-nf-birth" value="${s_birth}" required="required">
                                                </div>
                                                <div class="form-group">
                                                    <label>性别</label>
                                                    <c:if test="${s_sex == '男'}">
                                                        <div class="example-box">
                                                            <label class="ftdms-radio radio-inline radio-primary">
                                                                <input type="radio" name="s_sex" value="男" checked="checked"><span>男</span>
                                                            </label>
                                                            <label class="ftdms-radio radio-inline radio-primary">
                                                                <input type="radio" name="s_sex" value="女"><span>女</span>
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${s_sex == '女'}">
                                                        <div class="example-box">
                                                            <label class="ftdms-radio radio-inline radio-primary">
                                                                <input type="radio" name="s_sex" value="男" ><span>男</span>
                                                            </label>
                                                            <label class="ftdms-radio radio-inline radio-primary">
                                                                <input type="radio" name="s_sex" value="女" checked="checked"><span>女</span>
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                </div>
                                                <div class="form-group">
                                                    <label for="example-nf-tel">电话</label>
                                                    <input class="form-control" name="s_tel" type="text" id="example-nf-tel" value="${s_tel}" required="required">
                                                </div>
                                                <div class="form-group">
                                                    <label for="example-nf-email">邮箱</label>
                                                    <input class="form-control" name="s_email" type="email" id="example-nf-email" value="${s_email}" required="required">
                                                </div>
                                                    <label>班级选择</label>
                                                    <div class="example-box"  style="text-align: center">
                                                        <label class="checkbox-inline" style="width: 307px" for="f_id">
                                                            <select class="form-control"  name="f_id" id="f_id" >
                                                                <option value="-1">请选择院系</option>
                                                                <c:forEach var="f" items="${requestScope.get('faculty')}" >
                                                                    <option value="${f.f_id}" >${f.f_name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </label>
                                                        <label class="checkbox-inline" style="width: 307px" for="p_id">
                                                            <select class="form-control"  id="p_id" name="p_id">
                                                                <option value="-1">请选择专业</option>
                                                            </select>
                                                        </label>
                                                        <label class="checkbox-inline" style="width: 307px" for="cl_id">
                                                            <select class="form-control"  id="cl_id" name="cl_id">
                                                                <option value="-1">请选择班级</option>
                                                            </select>
                                                        </label>
                                                    </div>


                                                <div class="form-group">
                                                    <label for="example-nf-username">用户名</label>
                                                    <input class="form-control" name="s_userName" type="text" id="example-nf-username" value="${s_userName}" required="required">
                                                </div>
                                                <div class="form-group">
                                                    <label for="example-nf-psw">密码</label>
                                                    <input class="form-control" name="s_psw" type="text" id="example-nf-psw" value="${s_psw}" required="required">
                                                </div>
                                                <div class="example-box" style="text-align: center">
                                                    <input class="btn btn-success btn-w-md" type="submit" value="提交" />
                                                    <input class="btn btn-warning" type="reset" value="重置" />
                                                    <a href="${pageContext.request.contextPath}/admin/stuPerson"><input class="btn btn-warning" type="button" value="返回"></a>
                                                </div>

                                            </form>

                                        </div>
                                    </div>

                                </div>
                            </div>

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
<script type="text/javascript">
    function deleteStu(sid,cname){
        //用户安全提示
        if (confirm("你确定要删除吗？")) {
            location.href="${pageContext.request.contextPath}/teacher/deleteStuScoreById?sid="+sid+"&cname="+cname;
        }
    }

        //ajax发送查找专业请求
        var f = document.getElementById("f_id");//获取院系选择栏
        var p = document.getElementById("p_id");//获取专业选择栏
        var cl = document.getElementById("cl_id");//获取班级选择栏
        f.onchange=function () {
            var xhr = new XMLHttpRequest();
            xhr.open("GET","${pageContext.request.contextPath}/admin/findProfession?f_id="+f.value,true);
            xhr.send();
            //状态回响
            xhr.onreadystatechange=function () {
                //清理子节点
                p.length=1;
                cl.length=1;
                new Option()
                if (xhr.readyState==4 && xhr.status==200){
                    var s = xhr.responseText;
                    var json = JSON.parse(s);
                    for(i = 0; i < json.length; i++){
                        p.options.add(new Option(json[i].p_name,json[i].p_id))
                    }
                }

            }
        }

        //ajax发送查找班级请求
        p.onchange=function () {
            var xhr = new XMLHttpRequest();
            xhr.open("GET","${pageContext.request.contextPath}/admin/findClazz?p_id="+p.value,true);
            xhr.send();
            //状态回响
            xhr.onreadystatechange=function () {
                cl.length=1;
                if (xhr.readyState==4 && xhr.status==200){
                    var s = xhr.responseText;
                    var json = JSON.parse(s);
                    for(i = 0; i < json.length; i++){
                        cl.options.add(new Option(json[i].class_name,json[i].class_id))
                    }
                }
            }
    }
</script>
</body>
</html>
