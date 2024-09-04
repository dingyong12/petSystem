<%@ page import="cn.petmanagementsystem.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>宠物领养管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e3f2fd; /* 更加温暖的背景颜色 */
        }

        .container {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .banner {
            text-align: center; /* 使Banner居中 */
            margin-bottom: 10px;
        }

        .banner img {
            max-width: 100%; /* 保持图片在容器内 */
            height: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f44336; /* 红色主色调 */
            color: #ffffff;
            padding: 0 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .header .logo {
            font-size: 24px;
            font-weight: bold;
            display: flex;
            align-items: center;
        }

        .header .logo img {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .header .nav {
            display: flex;
            justify-content: center;
            gap: 20px;
            width: 80%;
        }

        .header .nav-item {
        }

        .header .nav-item a {
            color: #ffffff;
            text-decoration: none;
            padding: 15px;
            display: block;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .header .nav-item a:hover,
        .header .nav-item a.active {
            background-color: #fb8c00; /* 橙色悬停效果或选中效果 */
        }

        .header .nav-item .sub-menu {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #fb8c00; /* 橙色子菜单背景 */
            border-radius: 4px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        .header .nav-item:hover .sub-menu {
            display: block;
        }

        .header .sub-menu a {
            color: #ffffff;
            padding: 10px 20px;
        }

        .header .sub-menu a:hover {
            background-color: #ef6c00; /* 橙色子菜单悬停效果 */
        }

        .header .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-left: auto; /* 将用户信息区域对齐到右侧 */
        }

        .header .user-info span {
            font-size: 18px; /* 增大字体尺寸 */
            font-weight: 500; /* 设置字体粗细 */
        }

        .header .logout-button {
            background-color: #ff5722; /* 橙色背景按钮 */
            border: none;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
            padding: 8px 16px; /* 增加内边距 */
            border-radius: 4px; /* 圆角按钮 */
            transition: background-color 0.3s, color 0.3s; /* 添加过渡效果 */
        }

        .header .logout-button:hover {
            background-color: #e64a19; /* 悬停时的背景颜色 */
            color: #ffffff; /* 悬停时字体颜色 */
        }

        .main-content {
            flex: 1;
            padding: 20px;
            background-color: #ffffff;
        }

        iframe {
            width: 100%;
            height: calc(100vh - 80px);
            border: none;
        }

        .footer {
            background-color: #f44336; /* 与header一致的颜色 */
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
            position: relative;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="banner">
        <img src="${pageContext.request.contextPath}/pic/adoption-logo.png" alt="Banner Image">
    </div>
    <!-- Header -->
    <div class="header">
        <div class="nav">
            <c:if test="${not empty sessionScope.user}">
            <c:choose>
            <c:when test="${sessionScope.user.authority eq 1}">
                <!-- Admin Menu -->
                <div class="nav-item">
                    <a href="userManagement">用户管理</a>
                </div>
                <div class="nav-item">
                    <a href="petManagement">待领养宠物</a>
                </div>
                <div class="nav-item">
                    <a href="adoptionRecords">领养记录管理</a>
                </div>
                <div class="nav-item">
                    <a href="adoptionTerms">领养条款</a>
                </div>
            </c:when>
            <c:when test="${sessionScope.user.authority eq 0}">
            <!-- Manager Menu -->
            <div class="nav-item">
                <a href="petManagement">待领养宠物</a>
            </div>
            <div class="nav-item">
                <a href="adoptionTerms">领养条款</a>
            </div>
        </div>
        </c:when>
        </c:choose>
        </c:if>
    </div>
    <div class="user-info">
        <c:if test="${empty sessionScope.user}">
            <c:redirect url="login"/>
        </c:if>
        <%
            User user = (User) session.getAttribute("user");
        %>
        <span>欢迎, <%= user.getName() %>!</span>
        <form action="logout" method="get" style="display: inline;">
            <button type="submit" class="logout-button">退出</button>
        </form>
    </div>
</div>

<!-- Main content -->
<div class="main-content">
    <iframe id="contentFrame"></iframe>
</div>
<!-- Footer -->
<div class="footer">
    <p>© 2024 宠物领养管理系统 | 关爱每一个小生命</p>
</div>

<script>
    layui.use('element', function () {
        var element = layui.element;
    });

    document.addEventListener('DOMContentLoaded', function () {
        const links = document.querySelectorAll('.nav-item a');
        const iframe = document.getElementById('contentFrame');

        links.forEach(link => {
            link.addEventListener('click', function (event) {
                event.preventDefault();
                iframe.src = this.getAttribute('href');
            });
        });
    });

    window.onload = function () {
        var userInfo = document.querySelector('.user-info span');
        const iframe = document.getElementById('contentFrame');
        if (userInfo) {
            // 如果用户信息存在，自动重定向到 petManagement 页面
            iframe.src = "petManagement";
        }
    };
</script>
</body>
</html>