<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>论坛首页</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
        }
        .header .post-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .header .post-button:hover {
            background-color: #0056b3;
        }
        .posts {
            margin-bottom: 20px;
        }
        .post {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .post h2 {
            margin: 0;
            font-size: 1.2em;
        }
        .post p {
            margin: 5px 0;
        }
        .pagination {
            text-align: center;
        }
        .pagination a {
            color: #007bff;
            padding: 10px;
            text-decoration: none;
        }
        .pagination a:hover {
            text-decoration: underline;
        }
        .pagination .active {
            font-weight: bold;
            color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>论坛首页</h1>
        <a href="post.jsp" class="post-button">发帖</a>
    </div>

    <!-- 论坛帖子列表 -->
    <div class="posts">
        <%-- 假设你有一个帖子列表的 JavaBean 或对象 --%>
        <%-- 在这里用 JSP 标签来遍历并展示帖子 --%>
        <%
            // 示例帖子数据
            String[] postTitles = {"帖子标题1", "帖子标题2", "帖子标题3"};
            String[] postContents = {"帖子内容1", "帖子内容2", "帖子内容3"};

            for (int i = 0; i < postTitles.length; i++) {
        %>
        <div class="post">
            <h2><%= postTitles[i] %></h2>
            <p><%= postContents[i] %></p>
        </div>
        <% } %>
    </div>

    <!-- 分页 -->
<%--    <div class="pagination">--%>
<%--        <a href="?page=1" class="<%= (page == 1) ? "active" : "" %>">首页</a>--%>
<%--        <a href="?page=<%= page - 1 %>" class="<%= (page == 1) ? "disabled" : "" %>">上一页</a>--%>
<%--        <a href="?page=<%= page + 1 %>" class="<%= (page == totalPages) ? "disabled" : "" %>">下一页</a>--%>
<%--        <a href="?page=<%= totalPages %>" class="<%= (page == totalPages) ? "active" : "" %>">末页</a>--%>
<%--    </div>--%>
</div>
</body>
</html>