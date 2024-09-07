<%@ page import="cn.petmanagementsystem.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 引入 layui CSS -->
<link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
<!-- 引入 layui.js -->
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>宠物管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .flow-demo {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #pet-flow ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        #pet-flow li {
            width: calc(25% - 20px);
            box-sizing: border-box;
            padding: 10px;
            background-color: #fafafa;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }

        #pet-flow li:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        #pet-flow img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            display: block;
        }

        .gender-img {
            width: 16px !important;
            height: 16px !important;
            border-radius: 50%;
            display: inline-block;
        }

        p {
            margin: 5px 0;
            color: #333;
            line-height: 1.5;
        }

        .pet-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
        }

        .pet-name {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .pet-details {
            color: #666;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .filter-buttons {
            margin-bottom: 20px;
            text-align: center;
        }

        .filter-buttons .layui-btn {
            margin-right: 10px;
            position: relative;
            padding-right: 30px;
        }

        .filter-buttons .layui-btn:last-child {
            margin-right: 0;
        }

        .filter-buttons .layui-btn img {
            width: 16px;
            height: 16px;
            vertical-align: middle;
            margin-left: 8px;
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
        }

        .add-pet-button-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .add-pet-button {
            text-align: center;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .add-pet-button:hover {
            background-color: #45a049;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
<div class="filter-buttons">
    <button type="button" class="layui-btn layui-btn-primary layui-btn-radius" id="filterAll">所有<img
            src="https://www.pethaven.com.hk/catalog/adoption/icons/adoption-icons/all-icon.svg"></button>
    <button type="button" class="layui-btn layui-btn-primary layui-btn-radius" id="filterDog">狗<img
            src="https://www.pethaven.com.hk/catalog/adoption/icons/adoption-icons/dog-icon.svg"></button>
    <button type="button" class="layui-btn layui-btn-primary layui-btn-radius" id="filterCat">猫<img
            src="https://www.pethaven.com.hk/catalog/adoption/icons/adoption-icons/cat-icon.svg"></button>
    <!-- 添加更多筛选按钮 -->
</div>

<!-- 添加宠物按钮 -->
<div class="add-pet-button-container">
    <button type="button" class="add-pet-button" id="addPetButton">添加宠物</button>
</div>
<div class="flow-demo" id="pet-flow">
    <ul></ul>
</div>

<script>


    layui.use(['flow', 'jquery', 'layer'], function () {
        var flow = layui.flow;
        var $ = layui.jquery;
        var layer = layui.layer;

        var filter = -1;

        function loadPetList(page, filter, next) {
            $.ajax({
                url: '/getPetList',
                method: 'GET',
                data: {page: page, limit: 8, petType: filter},
                success: function (res) {
                    if (res.code === 0) {
                        var lis = [];
                        $.each(res.data, function (index, item) {
                            lis.push(
                                '<li data-id="' + item.id + '">' +
                                '<img lay-src="' + item.picture + '">' +
                                '<div class="pet-info">' +
                                '<p class="pet-name">' + item.name + '<img class="gender-img" src="' + item.petPic + '"></p>' + // 添加图标到右侧
                                '' +
                                '<p class="pet-details"><img class="gender-img" src="' + item.genderPic + '"> ' + item.genderName + '</p></div>' + // 添加图标到左侧
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
            elem: '#pet-flow ul',
            isAuto: false,
            isLazyimg: true,
            done: function (page, next) {
                loadPetList(page, filter, next);
            }
        });

        $('#filterAll').on('click', function () {
            filter = -1;
            resetFlow();
        });
        $('#filterDog').on('click', function () {
            filter = 0;
            resetFlow();
        });
        $('#filterCat').on('click', function () {
            filter = 1;
            resetFlow();
        });

        function resetFlow() {
            var $ul = $('#pet-flow ul');
            $ul.empty(); // 清空现有列表

            flow.load({
                elem: '#pet-flow ul',
                isAuto: false,
                isLazyimg: true,
                done: function (page, next) {
                    loadPetList(page, filter, next);
                }
            });
        }


        $('#pet-flow').on('click', 'li', function () {
            var id = $(this).data('id');
            $.ajax({
                url: '/getPetDetail',
                method: 'GET',
                data: {id: id},
                success: function (res) {
                    var pet = res;
                    sessionStorage.setItem('pet', JSON.stringify(pet));
                    layer.open({
                        type: 2,
                        title: '宠物详情',
                        area: ['700px', '500px'],
                        skin: 'layui-layer-rim', // 加上边框
                        content: ['/petDetail', 'no'],
                    });

                },
                error: function () {
                    console.error('网络请求失败');
                }
            });
        });
        // 绑定添加宠物按钮的点击事件
        document.getElementById('addPetButton').addEventListener('click', function () {
            // 使用 layui 的 layer 模块打开弹窗
            layer.open({
                type: 2, // iframe 类型
                title: '添加宠物',
                area: ['900px', '700px'], // 弹窗宽高
                content: 'redirectAddPet' // iframe 的 URL
            });
        });
    })


</script>

</body>
</html>