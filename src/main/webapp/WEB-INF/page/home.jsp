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
    </style>
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>管理系统</h2>
        <a href="userManagement.jsp">用户管理</a>
        <a href="petManagement.jsp">宠物管理</a>
        <a href="adoptionRecords.jsp">领养记录管理</a>
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
    </div>
</div>
</body>
</html>