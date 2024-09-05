<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>宠物详情</title>
    <!-- 引入layui CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.3/css/layui.css" />
    <style>
        .pet-detail {
            margin: 20px;
        }
        .pet-image {
            width: 300px;
            height: 300px;
            margin-bottom: 20px;
        }
        .pet-info {
            margin-bottom: 20px;
        }
        .pet-info label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="layui-container pet-detail" id="petDetailContainer">
    <!-- 宠物详情将通过 JavaScript 动态添加 -->
</div>

<!-- 引入layui JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.3/layui.all.js"></script>

<script>
    window.onload = function () {
        var petDetail = sessionStorage.getItem('petDetail');
        if (petDetail) {
            var pet = JSON.parse(petDetail);
            console.log(pet);
            var container = document.getElementById('petDetailContainer');
            container.innerHTML = `
                <div class="layui-row">
                    <div class="layui-col-md6">
                        <img src="${pet.picture}" alt="${pet.name}" class="pet-image">
                    </div>
                    <div class="layui-col-md6">
                        <div class="pet-info">
                            <label>名字：</label>
                            <span>${pet.name}</span>
                        </div>
                        <div class="pet-info">
                            <label>年龄：</label>
                            <span>${pet.age}</span>
                        </div>
                        <div class="pet-info">
                            <label>性别：</label>
                            <span>${pet.gender}</span>
                        </div>
                        <div class="pet-info">
                            <label>简介：</label>
                            <p>${pet.description}</p>
                        </div>
                    </div>
                </div>
            `;
        } else {
            document.getElementById('petDetailContainer').innerHTML = '<p>没有找到宠物信息。</p>';
        }
    };
</script>

</body>
</html>