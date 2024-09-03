<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宠物领养系统 - 注册</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/pic/login.jpg'); /* 替换成你的背景图片地址 */
            background-size: cover; /* 使图片覆盖整个背景 */
            background-position: center; /* 使图片居中 */
            background-repeat: no-repeat; /* 不重复背景图片 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
        }
        h1 {
            margin: 0 0 20px;
            color: #333;
            font-size: 24px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-group button:hover {
            background-color: #45a049;
        }
        .link {
            margin-top: 20px;
        }
        .link a {
            color: #4CAF50;
            text-decoration: none;
        }
        .link a:hover {
            text-decoration: underline;
        }
        /* 提示框样式 */
        .alert {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #4CAF50;
            color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            text-align: center;
            z-index: 1000;
        }
        .alert p {
            margin: 0;
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>注册</h1>
    <c:if test="${not empty errMsg}">
        <p style="color: red;">${errMsg}</p>
    </c:if>
    <form id="registerForm" action="${pageContext.request.contextPath}/register/user" method="post">
        <div class="form-group">
            <input type="text" id="name" name="name" placeholder="昵称" required>
        </div>
        <div class="form-group">
            <input type="text" id="accountName" name="accountName" placeholder="用户名" required>
        </div>
        <div class="form-group">
            <input type="tel" id="phone" name="phone" pattern="[0-9]{11}" placeholder="请输入11位手机号" required>
        </div>
        <div class="form-group">
            <input type="password" id="password" name="password" placeholder="密码" required>
        </div>
        <div class="form-group">
            <button type="submit">注册</button>
        </div>
        <div class="link">
            <p>已经拥有账号? <a href="${pageContext.request.contextPath}/login">登陆</a>.</p>
        </div>
    </form>
</div>


</body>
</html>