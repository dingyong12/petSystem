<%@ page import="cn.petmanagementsystem.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>宠物领养管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 200px;
            background-color: #f4f4f4;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar a {
            display: block;
            padding: 10px;
            color: #333;
            text-decoration: none;
            margin-bottom: 10px;
        }

        .sidebar a:hover {
            background-color: #ddd;
        }

        .main-content {
            flex: 1;
            padding: 20px;
        }

        .header {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            text-align: right;
            position: relative;
        }

        .logout-button {
            color: #fff;
            background: none;
            border: none;
            font-size: 16px;
            cursor: pointer;
            text-decoration: underline;
        }

        .logout-button:hover {
            color: #ddd;
        }

        .hidden {
            display: none;
        }

        iframe {
            width: 100%;
            height: calc(100vh - 60px); /* 根据 header 高度调整 */
            border: none;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>管理系统</h2>
        <c:if test="${not empty sessionScope.user}">
            <c:choose>
                <c:when test="${sessionScope.user.authority eq 1}">
                    <!-- Admin Menu -->
                    <a href="userManagement">用户管理</a>
                    <a href="petManagement">待领养宠物</a>
                    <a href="adoptionRecords">领养记录管理</a>
                </c:when>
                <c:when test="${sessionScope.user.authority eq 0}">
                    <!-- Manager Menu -->
                    <a href="petManagement">待领养宠物</a>
                    <a href="petManagement">领养条款</a>
                </c:when>
            </c:choose>
        </c:if>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <div class="header">
            <%-- Display logged-in user information --%>
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
        <h1>欢迎来到宠物领养管理系统</h1>
        <p>请选择左侧的管理模块进行操作。</p>


        <!-- Embedded content -->
        <iframe id="contentFrame"></iframe>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 获取所有菜单链接
        const links = document.querySelectorAll('.sidebar a');
        const iframe = document.getElementById('contentFrame');
        const h1 = document.querySelector('h1');
        const p = document.querySelector('p');

        links.forEach(link => {
            link.addEventListener('click', function (event) {
                event.preventDefault(); // 阻止默认链接跳转行为
                const href = this.getAttribute('href'); // 获取链接的 href 属性值
                iframe.src = href; // 更新 iframe 的 src 属性

                h1.classList.add('hidden');
                p.classList.add('hidden');
            });
        });
    });
</script>
</body>
</html>