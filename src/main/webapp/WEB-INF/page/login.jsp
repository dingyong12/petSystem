<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宠物领养系统 - 登录</title>
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
        .login-container {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
        }
        .login-container h2 {
            margin: 0 0 20px;
            color: #333;
        }
        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-container button:hover {
            background-color: #45a049;
        }
        .login-container p {
            margin-top: 20px;
            font-size: 14px;
        }
        .login-container a {
            color: #4CAF50;
            text-decoration: none;
        }
        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>宠物领养系统</h2>
    <% if (request.getParameter("error") != null) { %>
    <script>
        window.onload = function() {
            alert("登录失败，请检查用户名和密码。");
        };
    </script>
    <% } %>
    <form action="${pageContext.request.contextPath}/login/user" method="post">
        <input type="text" name="username" placeholder="用户名" required>
        <input type="password" name="password" placeholder="密码" required>
        <button type="submit">登录</button>
    </form>
    <p>还没有账户？ <a href="${pageContext.request.contextPath}/register">注册</a></p>
</div>
</body>
</html>