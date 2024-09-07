<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>论坛文章详情</title>
    <!-- 引入 layui CSS -->
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <style>
        .detail-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .detail-title {
            font-size: 32px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 15px;
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 10px;
        }

        .detail-content {
            font-size: 18px;
            color: #34495e;
            line-height: 1.8;
            margin-bottom: 20px;
            white-space: pre-wrap; /* 保持内容中的换行符 */
        }

        .detail-meta {
            margin-top: 20px;
            color: #7f8c8d;
            font-size: 16px;
        }

        .back-button {
            margin-top: 20px;
            display: inline-block;
            padding: 12px 24px;
            background-color: #3498db;
            color: #ffffff;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #2980b9;
        }

        .image-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
            max-height: 400px; /* 限制图片的最大高度 */
            border-radius: 12px; /* 为图片添加圆角 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 图片阴影效果 */
        }
    </style>
</head>
<body>
<div class="detail-container">
    <div class="image-container">
        <img id="article-image" src="" alt="文章图片">
    </div>
    <div class="detail-title" id="title"></div>
    <div class="detail-content" id="content"></div>
    <div class="detail-meta" id="meta"></div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var forum = JSON.parse(sessionStorage.getItem('forum'));

        if (forum) {
            document.getElementById('title').textContent = forum.title;
            document.getElementById('content').textContent = forum.content;
            document.getElementById('meta').textContent = '发布时间：' + forum.createdTime;

            // 如果有图片 URL，设置图片的 src
            if (forum.forumPic) {
                document.getElementById('article-image').src = forum.forumPic;
            }
        } else {
            document.getElementById('title').textContent = '未找到文章详情';
        }
    });
</script>
</body>
</html>