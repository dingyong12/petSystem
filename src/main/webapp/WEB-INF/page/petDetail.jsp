<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>宠物详情</title>
    <!-- 引入 layui CSS -->
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        body {
            background-color: #f0f2f5;
            font-family: Arial, sans-serif;
        }

        .pet-detail {
            width: 80%;
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .pet-container {
            display: flex;
            padding: 20px;
            align-items: center;
            border-bottom: 1px solid #ddd;
        }

        .pet-image {
            width: 250px;
            height: 250px;
            border-radius: 8px;
            object-fit: cover;
            margin-right: 20px;
        }

        .pet-info {
            flex: 1;
        }

        .pet-info div {
            margin-bottom: 15px;
        }

        .pet-info label {
            font-weight: bold;
            color: #333;
        }

        .pet-info p {
            margin: 0;
            color: #555;
        }

        .adopt-button {
            display: inline-block;
            background-color: #ff6f61;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            position: absolute;
            bottom: 20px;
            right: 20px;
            transition: background-color 0.3s ease;
        }

        .adopt-button:hover {
            background-color: #e55a50;
        }
    </style>
</head>
<body>
<div class="layui-container pet-detail">
    <!-- 宠物容器 -->
    <div class="pet-container">
        <!-- 宠物图片 -->
        <img id="petImage" class="pet-image" alt="宠物图片">
        <!-- 宠物信息 -->
        <div class="pet-info">
            <div>
                <label>名字：</label>
                <span id="petName"></span>
            </div>
            <div>
                <label>性别：</label>
                <span id="petGender"></span>
            </div>
            <div>
                <label>简介：</label>
                <p id="petDescription"></p>
            </div>
        </div>
        <!-- 选择领养按钮 -->
        <button type="button" class="adopt-button" id="adoptButton" disabled>选择领养</button>

    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 从 sessionStorage 获取宠物数据
        var pet = JSON.parse(sessionStorage.getItem('pet'));

        if (pet) {
            // 更新页面内容
            document.getElementById('petImage').src = pet.picture;
            document.getElementById('petImage').alt = pet.name;
            document.getElementById('petName').textContent = pet.name;
            document.getElementById('petGender').textContent = pet.genderName;
            document.getElementById('petDescription').textContent = pet.petDescription;
            // 根据领养状态设置按钮
            var adoptButton = document.getElementById('adoptButton');
            if (pet.adoptStatus == '1') {  // 假设 '1' 表示已领养
                adoptButton.textContent = '已领养';
                adoptButton.disabled = true;  // 禁用按钮
                adoptButton.style.backgroundColor = '#ccc';  // 设置为灰色
                adoptButton.style.cursor = 'not-allowed';    // 改变鼠标样式
            } else {
                adoptButton.disabled = false;  // 启用按钮
            }
        } else {
            console.error("没有找到宠物数据");
        }
    });

    // 绑定选择领养按钮的点击事件
    document.getElementById('adoptButton').addEventListener('click', function () {
        // 使用 layui 的 layer 模块打开弹窗
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.open({
                type: 2, // iframe 类型
                area: ['100%', '100%'], // 弹窗宽高
                content: ['redirectAdoptPet'] // iframe 的 URL
            });
        });
    });

</script>
</body>
</html>