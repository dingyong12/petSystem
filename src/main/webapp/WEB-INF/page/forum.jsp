<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>论坛页面</title>
    <!-- 引入 layui CSS -->
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        .image-container {
            width: 100%;
            height: 100px;
            overflow: hidden;
            text-align: center;
            background-color: #f0f0f0;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
        }

        .flow-demo {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .forum-title {
            text-align: center;
            font-size: 28px;
            font-weight: 700;
            color: #333;
            margin-bottom: 30px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .write-post-btn {
            display: block;
            width: 200px;
            margin: 0 auto 20px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #1e9FFF;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
        }

        .write-post-btn:hover {
            background-color: #009688;
        }

        .forum-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .forum-list li {
            border-bottom: 1px solid #ddd;
            padding: 20px;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            transition: background-color 0.3s, transform 0.3s;
        }

        .forum-list li:hover {
            background-color: #f9f9f9;
            transform: translateY(-2px);
        }

        .forum-list .title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
        }

        .forum-list .author {
            font-size: 14px;
            color: #666;
            margin-bottom: 4px;
        }

        .forum-list .date {
            font-size: 12px;
            color: #999;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="image-container">
    <!-- 单张图片 -->
    <img src="${pageContext.request.contextPath}/pic/adoption-logo.png" alt="Single Image">
</div>
<div class="flow-demo">
    <div class="forum-title">宠物论坛</div>
    <!-- 写文章按钮 -->
    <button class="write-post-btn" id="write-post-btn">写文章</button>
    <ul class="forum-list" id="forum-list">
        <!-- 帖子列表项将由 JavaScript 动态生成 -->
    </ul>
</div>

<script>
    layui.use(['flow', 'jquery', 'layer'], function () {
        var flow = layui.flow;
        var $ = layui.jquery;
        var layer = layui.layer;

        function loadForumList(page, next) {
            $.ajax({
                url: '/getForumList',
                method: 'GET',
                data: {page: page, limit: 8},
                success: function (res) {
                    if (res.code === 0) {
                        var lis = [];
                        $.each(res.data, function (index, item) {
                            lis.push(
                                '<li data-id="' + item.id + '">' +
                                '<div class="title">' + item.title + '</div>' +
                                '<div class="author">发帖人：' + item.userName + '</div>' +
                                '<div class="date">' + item.createdTime + '</div>' +
                                '</li>'
                            );
                        });

                        next(lis.join(''), page < Math.ceil(res.count / 8));
                    } else {
                        console.error('数据加载失败');
                    }
                },
                error: function () {
                    console.error('网络请求失败');
                }
            });
        }

        flow.load({
            elem: '#forum-list',
            isAuto: false,
            isLazyimg: true,
            done: function (page, next) {
                loadForumList(page, next);
            }
        });

        $('#forum-list').on('click', 'li', function () {
            var id = $(this).data('id');
            $.ajax({
                url: '/getForumDetail',
                method: 'GET',
                data: {id: id},
                success: function (res) {
                    var forum = res;
                    sessionStorage.setItem('forum', JSON.stringify(forum));
                    layer.open({
                        type: 2,
                        title: '文章详情',
                        area: ['1500px', '1000px'],
                        content: ['/forumDetail'],
                    });
                },
                error: function () {
                    console.error('网络请求失败');
                }
            });
        });

        $('#write-post-btn').on('click', function () {
            layer.open({
                type: 2,
                title: '写文章',
                area: ['1000px', '550px'],
                content: ['addForum'], // 替换为实际的写文章页面URL
            });
        });
    });
</script>
</body>
</html>