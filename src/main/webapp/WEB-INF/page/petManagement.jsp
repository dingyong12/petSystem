<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="//unpkg.com/layui@2.9.16/dist/css/layui.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>宠物管理</title>
    <link href="//unpkg.com/layui@2.9.16/dist/css/layui.css" rel="stylesheet">
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

        p {
            margin: 5px 0;
            color: #333;
            line-height: 1.5;
        }

        .pet-name {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .pet-details {
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="flow-demo" id="pet-flow">
    <ul></ul>
</div>

<script src="//unpkg.com/layui@2.9.16/dist/layui.js"></script>
<script>
    layui.use(['flow', 'jquery', 'layer'], function () {
        var flow = layui.flow;
        var $ = layui.jquery;
        var layer = layui.layer;

        flow.load({
            elem: '#pet-flow ul',
            isAuto: false,
            isLazyimg: true,
            done: function (page, next) {
                $.ajax({
                    url: '/getPetList',
                    method: 'GET',
                    data: {page: page, limit: 8},
                    success: function (res) {
                        if (res.code === 0) {
                            var lis = [];
                            $.each(res.data, function (index, item) {
                                lis.push(
                                    '<li data-id="' + item.id + '">' +
                                    '<img lay-src="' + item.picture + '">' +
                                    '<p class="pet-name">名称：' + item.name + '</p>' +
                                    '<p class="pet-details">性别：' + item.genderName + '</p>' +
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
        });

        $('#pet-flow').on('click', 'li', function () {
            var id = $(this).data('id');
            $.ajax({
                url: '/getPetDetail',
                method: 'GET',
                data: {id: id},
                success: function (res) {
                    var pet = res;
                    sessionStorage.setItem('petDetail', JSON.stringify(pet));
                    layer.open({
                        type: 2,
                        title: '宠物详情',
                        area: ['500px', '730px'],
                        skin: 'layui-layer-rim', // 加上边框
                        content: '/petDetail',
                    });

                },
                error: function () {
                    console.error('网络请求失败');
                }
            });
        });
    });
</script>

</body>
</html>