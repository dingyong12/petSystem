<%@ page import="cn.petmanagementsystem.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>写文章</title>
    <!-- 引入 layui CSS -->
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>

    <c:if test="${empty sessionScope.user}">
        <c:redirect url="login"/>
    </c:if>
    <%
        User user = (User) session.getAttribute("user");
    %>

    <style>
        .container {
            max-width: 1500px;
            max-height: 1500px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: inline-block;
            width: 100px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: calc(100% - 120px); /* 留出label宽度 */
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group textarea {
            resize: vertical;
        }

        .upload-image {
            margin-top: 10px;
        }

        .layui-upload-drag {
            border: 1px dashed #ddd;
            padding: 20px;
            text-align: center;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .layui-upload-drag:hover {
            background-color: #f1f1f1;
        }

        .layui-upload-list {
            margin-top: 10px;
        }

        .layui-upload-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 10px;
        }

        .submit-btn {
            display: block;
            width: auto;
            padding: 8px 16px;
            background-color: #1e9FFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            margin-top: 20px;
        }

        .submit-btn:hover {
            background-color: #009688;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="layui-form">
        <div class="form-group">
            <label for="title">标题</label>
            <input type="text" id="title" name="title" required placeholder="请输入文章标题">
        </div>
        <div class="form-group">
            <label for="content">内容</label>
            <textarea id="content" name="content" rows="10" required placeholder="请输入文章内容"></textarea>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章图片</label>
            <div class="layui-input-block">
                <div id="upload" class="layui-upload-drag">
                    <i class="layui-icon"></i>
                    <p>点击上传文章图片</p>
                    <input type="hidden" name="forumPic" id="petImagePath">
                </div>
                <img id="ImagePreview" class="layui-upload-img" style="display: none;">
            </div>
        </div>
        <input id="userId" value="<%= user.getId() %>" type="hidden">
        <button class="layui-btn" lay-submit lay-filter="addForumInfo">提交文章</button>
    </div>
</div>

<script>
    layui.use(['upload', 'form'], function () {
        var upload = layui.upload;
        var form = layui.form;

        // 图片上传
        upload.render({
            elem: '#upload',
            url: '/picUpload', // 需要替换成实际的上传接口
            accept: 'images',
            done: function (res) {
                // 图片上传成功后的回调
                console.log(res);
                document.getElementById('petImagePath').value = res.data; // 假设返回的图片路径在 res.data
                var imgPreview = document.getElementById('ImagePreview');
                imgPreview.src = res.data;
                imgPreview.style.display = 'block';
            },
            error: function () {
                layer.msg('上传失败');
            }
        });
        // 表单提交
        form.on('submit(addForumInfo)', function (data) {
            // 获取表单数据
            var formData = data.field;
            // 手动添加 userId 到表单数据
            var userId = document.getElementById('userId').value;
            formData.userId = userId;
            // 发送 AJAX 请求
            fetch('/addForumInfo', { // 需要替换成实际的提交接口
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
                .then(response => response.json())
                .then(result => {
                    if (result.code === 200) {
                        layer.msg('文章提交成功', {icon: 1});
                        setTimeout(function () {
                            var index = parent.layer.getFrameIndex(window.name); // 先得到当前 iframe 层的索引
                            parent.layer.close(index); // 再执行关闭
                            // 跳转到指定页面并刷新
                            window.parent.location.href = 'forum'; // 替换成你想跳转的页面地址
                            window.parent.location.reload(); // 刷新页面
                        }, 2000); // 2秒后执行
                    } else {
                        layer.msg('提交失败: ' + result.message, {icon: 2});
                    }
                })
                .catch(error => {
                    layer.msg('提交失败', {icon: 2});
                    console.error('Error:', error);
                });

            // 阻止表单的默认提交行为
            return false;
        });

    });
</script>
</body>
</html>