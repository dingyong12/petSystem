<%@ page import="cn.petmanagementsystem.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加宠物</title>
    <!-- 引入 layui CSS -->
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        .layui-form {
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }

        .layui-form-item {
            margin-bottom: 20px; /* 增加间隔 */
            display: flex; /* 使用 Flexbox 布局 */
            align-items: center; /* 垂直居中对齐 */
        }

        .layui-form-label {
            width: 120px; /* 标签宽度 */
            text-align: right; /* 标签右对齐 */
            margin-right: 15px; /* 标签与输入框之间的间隔 */
        }

        .layui-input-block {
            flex: 1; /* 输入块占据剩余空间 */
        }

        .layui-upload-drag {
            border: 1px dashed #ddd;
            border-radius: 4px;
            padding: 15px; /* 减少内边距 */
            text-align: center;
            cursor: pointer;
        }

        .layui-upload-img {
            max-width: 150px; /* 调整图片预览最大宽度 */
            max-height: 150px; /* 调整图片预览最大高度 */
            margin-top: 10px;
        }

        .layui-form-select {
            width: 100%;
        }

        .layui-textarea {
            width: 100%;
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
<div class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">宠物图片</label>
        <div class="layui-input-block">
            <div id="upload" class="layui-upload-drag">
                <i class="layui-icon"></i>
                <p>点击上传宠物图片</p>
                <input type="hidden" name="picture" id="petImagePath">
            </div>
            <img id="petImagePreview" class="layui-upload-img" style="display: none;">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">宠物昵称</label>
        <div class="layui-input-block">
            <input type="text" name="name" required lay-verify="required" placeholder="请输入宠物昵称"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <select name="gender" lay-verify="required">
                <option value="">请选择性别</option>
                <option value="0">雄性</option>
                <option value="1">雌性</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">简介</label>
        <div class="layui-input-block">
            <textarea name="petDescription" placeholder="请输入宠物简介" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">自提地址</label>
        <div class="layui-input-block">
            <textarea name="petAddress" class="layui-textarea"><%= user.getAddress() %></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">品种</label>
        <div class="layui-input-block">
            <select name="petTypeId" id="petBreedSelect" lay-verify="required">
                <option value="">请选择品种</option>
                <!-- 品种选项将由脚本动态加载 -->
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="addPetForm">提交</button>
        </div>
    </div>
</div>

<script>
    layui.use(['layer', 'form', 'upload'], function () {
        var layer = layui.layer;
        var form = layui.form;
        var upload = layui.upload;

        // 图片上传
        upload.render({
            elem: '#upload',
            url: '/picUpload', // 需要替换成实际的上传接口
            accept: 'images',
            done: function (res) {
                // 图片上传成功后的回调
                console.log(res);
                document.getElementById('petImagePath').value = res.data; // 假设返回的图片路径在 res.data.src
                var imgPreview = document.getElementById('petImagePreview');
                console.log(res.data);
                imgPreview.src = res.data;

                imgPreview.style.display = 'block';
            },
            error: function () {
                layer.msg('上传失败');
            }
        });

        form.on('submit(addPetForm)', function (data) { // 确保 `addPetForm` 与表单的 `lay-filter` 匹配
            console.log('表单数据:', data.field); // 输出表单数据
            fetch('/addPet', { // 需要替换成实际的提交接口
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data.field)
            })
                .then(response => response.json())
                .then(result => {
                    if (result.code === 200) {
                        layer.msg('提交成功');
                    } else {
                        layer.msg('提交失败: ' + result.message);
                    }
                })
                .catch(error => {
                    console.error('提交失败:', error); // 打印错误信息
                    layer.msg('网络错误');
                });
            return false; // 阻止表单跳转
        });


        // 品种下拉框获取数据
        function loadPetBreeds() {
            fetch('/getPetTypeList') // 替换成实际获取品种的接口
                .then(response => response.json())
                .then(data => {
                    var select = document.getElementById('petBreedSelect');
                    // 清除现有选项
                    select.innerHTML = '<option value="">请选择品种</option>';
                    // 添加新选项
                    data.forEach(breed => {
                        var option = document.createElement('option');
                        option.value = breed.id;
                        option.textContent = breed.typeName;
                        select.appendChild(option);
                    });
                    form.render('select'); // 更新layui渲染
                })
                .catch(error => {
                    layer.msg('获取品种数据失败');
                });
        }

        // 初始化时加载品种数据
        loadPetBreeds();
    });
</script>
</body>
</html>