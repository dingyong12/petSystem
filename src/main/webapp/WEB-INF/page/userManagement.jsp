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
    <link href="//unpkg.com/layui@2.9.16/dist/css/layui.css" rel="stylesheet">
    <style>
        /* 自定义样式，使表格的宽度更适合 */
        .layui-table td, .layui-table th {
            text-align: center; /* 中心对齐 */
            white-space: nowrap; /* 防止内容换行 */
            overflow: hidden; /* 内容溢出隐藏 */
            text-overflow: ellipsis; /* 内容溢出显示省略号 */
        }
        .layui-table {
            width: 100%; /* 确保表格宽度占满容器 */
        }
    </style>
</head>
<body>

<div style="padding: 16px;">
    <table class="layui-hide" id="userList" lay-filter="userList"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="accountName" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <select name="status">
                    <option value="0">无效</option>
                    <option value="1">有效</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <button class="layui-btn" lay-submit lay-filter="search">搜索</button>
        </div>
    </div>
</script>

<script type="text/html" id="barDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </div>
</script>

<script src="//unpkg.com/layui@2.9.16/dist/layui.js"></script>
<script>
    layui.use(['table', 'form'], function () {
        var table = layui.table;
        var form = layui.form;

        // 创建渲染实例
        table.render({
            elem: '#userList',
            url: '/getUserList', // 实际使用时需换成真实接口
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter'],
            height: 'full-35', // 最大高度减去其他容器已占有的高度差

            cellMinWidth: 120, // 调整最小单元格宽度
            page: true,
            cols: [[
                {field: 'id', fixed: 'left', width: 300, title: 'ID'},
                {field: 'accountName', width: 400, title: '用户名'},
                {field: 'phone', width: 450, title: '手机号'},
                {field: 'status', width: 250, title: '用户状态'},
                {fixed: 'right', title: '操作', width: 250, toolbar: '#barDemo'}
            ]],
            error: function (res, msg) {
                console.log(res, msg);
            }
        });

        // 监听搜索表单
        form.on('submit(search)', function (data) {
            table.reload('userList', {
                where: data.field
            });
            return false;
        });
    });
</script>
</body>
</html>