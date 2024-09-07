<%@ page import="cn.petmanagementsystem.domain.common.Pager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 引入 layui CSS -->
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        /* 自定义样式，使表格的宽度更适合 */
        .layui-table td, .layui-table th {
            text-align: center; /* 中心对齐 */
            white-space: nowrap; /* 防止内容换行 */
            overflow: hidden; /* 内容溢出隐藏 */
            text-overflow: ellipsis; /* 内容溢出显示省略号 */
            word-wrap: normal; /* 防止长单词或URL换行 */
        }

        .layui-table {
            width: 100%; /* 确保表格宽度占满容器 */
        }

        /* 调整搜索表单样式 */
        .layui-form {
            display: flex;
            flex-wrap: wrap; /* 允许换行 */
            gap: 10px; /* 项目之间的间距 */
        }

        .layui-form-item {
            margin-right: 0; /* 去除右边距 */
            margin-bottom: 0; /* 去除下边距 */
        }

        .layui-form-label {
            width: 100px; /* 标签宽度 */
        }

        .layui-input-block, .layui-input-inline {
            flex: 1; /* 输入框占据剩余空间 */
        }

        .layui-inline {
            margin-right: 0; /* 去除右边距 */
        }

        .layui-btn-container {
            margin-bottom: 20px; /* 按钮容器底部间距 */
        }

        /* 新增样式：调整表单容器的最小高度 */
        .layui-btn-container, .layui-form {
            min-height: 100px; /* 设置最小高度 */
        }

        /* 表格的容器设置 */
        .layui-table-view {
            margin-top: 20px; /* 表格和搜索表单的间距 */
        }
    </style>
</head>
<body>

<div style="padding: 16px;">
    <table class="layui-hide" id="adoptionList" lay-filter="adoptionList"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <form class="layui-form" lay-filter="searchForm">
            <div class="layui-form-item layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="userName" autocomplete="off" class="layui-input"
                           placeholder="请输入用户名">
                </div>
            </div>
            <div class="layui-form-item layui-inline">
                <label class="layui-form-label">宠物名称</label>
                <div class="layui-input-block">
                    <input type="text" name="petName" autocomplete="off" class="layui-input"
                           placeholder="请输入宠物名称">
                </div>
            </div>
            <div class="layui-form-item layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" autocomplete="off" class="layui-input" placeholder="请输入手机号">
                </div>
            </div>
            <div class="layui-form-item layui-inline">
                <label class="layui-form-label">领养方式</label>
                <div class="layui-input-inline">
                    <select name="adoptMethod" class="layui-select">
                        <option value="0">自提</option>
                        <option value="1">物流</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-inline">
                <button class="layui-btn" lay-submit lay-filter="search">搜索</button>
            </div>
        </form>
    </div>
</script>

<script type="text/html" id="barDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-xs" lay-event="edit">操作</a>
    </div>
</script>

<script>
    layui.use(['table', 'form'], function () {
        var table = layui.table;
        var form = layui.form;

        var savedData = {};

        // 创建渲染实例
        table.render({
            elem: '#adoptionList',
            url: '/getAdoptionList', // 实际使用时需换成真实接口
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter'],
            height: 'full-35', // 最大高度减去其他容器已占有的高度差

            cellMinWidth: 250, // 调整最小单元格宽度
            page: true,
            cols: [[
                {field: 'id', fixed: 'left', width: 200, title: 'ID'},
                {field: 'userName', width: 300, title: '领养人'},
                {field: 'phone', width: 150, title: '手机号'},
                {field: 'petName', width: 100, title: '宠物名称'},
                {field: 'adoptTime', width: 150, title: '领养时间'},
                {field: 'adoptMethodStr', width: 150, title: '领养方式'},
                {field: 'address', width: 450, title: '领养地址'},
                {field: 'approvalStatusStr', width: 250, title: '审批状态'},
                {fixed: 'right', title: '操作', width: 250, toolbar: '#barDemo'}
            ]],
            error: function (res, msg) {
                console.log(res, msg);
            }
        });

        // 监听搜索表单
        form.on('submit(search)', function (data) {
            savedData = data.field;
            table.reload('adoptionList', {
                where: savedData
            });
            return false;
        });

        form.val('searchForm', savedData);
    });
</script>
</body>
</html>