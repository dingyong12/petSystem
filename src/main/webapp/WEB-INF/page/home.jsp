<%@ page import="cn.petmanagementsystem.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <title>宠物领养管理系统</title>
    <!-- 引入 layui CSS -->
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>

        .main-content {
            flex: 1;
            padding: 20px;
            background-color: #ffffff;
        }

        iframe {
            width: 100%;
            height: calc(100vh - 150px); /* 150px 是 header 和 footer 的总高度 */
            border: none;
        }

        .layui-footer {
            background-color: #f2f2f2;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -1px 5px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<c:if test="${empty sessionScope.user}">
    <c:redirect url="login"/>
</c:if>
<%
    User user = (User) session.getAttribute("user");
%>
<div class="container">
    <!-- Header -->
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo layui-hide-xs layui-bg-black">宠物领养平台</div>
            <!-- 头部区域（可配合layui 已有的水平导航） -->
            <ul class="layui-nav layui-layout-left">
                <!-- 移动端显示 -->
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                    <i class="layui-icon layui-icon-spread-left"></i>
                </li>
                <c:if test="${not empty sessionScope.user}">
                    <c:choose>
                        <c:when test="${sessionScope.user.authority eq 1}">
                            <li class="layui-nav-item layui-hide-xs"><a href="userManagement">用户管理</a></li>
                            <li class="layui-nav-item layui-hide-xs"><a href="petManagement">待领养宠物</a></li>
                            <li class="layui-nav-item layui-hide-xs"><a href="adoptionManagement">领养记录管理</a></li>
                            <li class="layui-nav-item layui-hide-xs"><a href="forum">论坛</a></li>
                            <li class="layui-nav-item layui-hide-xs"><a href="adoptionTerms">领养条款</a></li>
                        </c:when>
                        <c:when test="${sessionScope.user.authority eq 0}">
                            <li class="layui-nav-item layui-hide-xs"><a href="petManagement">待领养宠物</a></li>
                            <li class="layui-nav-item layui-hide-xs"><a href="forum">论坛</a></li>
                            <li class="layui-nav-item layui-hide-xs"><a href="adoptionTerms">领养条款</a></li>
                        </c:when>
                    </c:choose>
                </c:if>

            </ul>
            <ul class="layui-nav layui-layout-right" style="display: inline">
                <li class="layui-nav-item layui-hide layui-show-sm-inline-block">
                    <a href="javascript:;">
                        <img src="//unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img">
                        <%=user.getName()%>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">个人信息</a></dd>
                        <dd><a href="logout">登出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
</div>

<div id="contentDemo" class="main-content">
    <!-- 这里将加载内容 -->
    <div id="content"></div>
</div>
<!-- Main content -->
<div id="contentArea" class="main-content">
    <!-- Main content -->
    <iframe id="contentFrame" src="petManagement"></iframe>
</div>
<!-- Footer -->
<div class="layui-footer">
    <!-- 底部固定区域 -->
    <p>© 2024 宠物领养管理系统 | 关爱每一个小生命</p>
</div>

<script>
    layui.use('element', function () {
        var element = layui.element;
    });

    document.addEventListener('DOMContentLoaded', function () {
        const links = document.querySelectorAll('.layui-nav-item a');
        const iframe = document.getElementById('contentFrame');

        links.forEach(link => {
            link.addEventListener('click', function (event) {
                event.preventDefault();
                iframe.src = this.getAttribute('href');
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        const logoutLink = document.querySelector('a[href="logout"]');
        logoutLink.addEventListener('click', function (event) {
            event.preventDefault();
            window.location.href = '/login'; // 登出后重定向到登录页面
        });
    });
</script>
</body>
</html>