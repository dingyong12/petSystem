<%@ page import="cn.petmanagementsystem.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>确认领养</title>
    <!-- 引入 layui CSS -->
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        .hidden {
            display: none;
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


<div class="layui-container">
    <div class="layui-form">
        <!-- 用户姓名 -->
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" value="<%= user.getName() %>"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <!-- 用户电话 -->
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" name="phone" required lay-verify="required" value="<%= user.getPhone() %>"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <!-- 领养宠物名称 -->
        <div class="layui-form-item">
            <label class="layui-form-label">宠物名称</label>
            <div class="layui-input-block">
                <input type="text" name="petName" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <!-- 用户地址 -->
        <div class="layui-form-item" id="userAddressItem">
            <label class="layui-form-label">宠物自提地址</label>
            <div class="layui-input-block">
                <input type="text" name="userAddress" value="<%= user.getAddress()%>" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <!-- 自提地址 -->
        <div class="layui-form-item hidden" id="pickupAddressItem">
            <label class="layui-form-label">物流地址</label>
            <div class="layui-input-block">
                <input type="text" name="pickupAddress" placeholder="请输入您的收货地址" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <!-- 领养方式 -->
        <div class="layui-form-item">
            <label class="layui-form-label">领养方式</label>
            <div class="layui-input-block">
                <select name="adoptMethod" lay-filter="adoptionMethod" id="adoptionMethod" lay-verify="required">
                    <option value="">请选择领养方式</option>
                    <option value="0">自提</option>
                    <option value="1">物流</option>
                </select>
            </div>
        </div>

        <!-- 隐藏的用户ID -->
        <input type="hidden" name="userId" value="<%= user.getId() %>">

        <!-- 隐藏的宠物ID -->
        <input type="hidden" name="petId">

        <!-- 提交按钮 -->
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button lay-submit lay-filter="adoptPet" class="layui-btn layui-btn-normal">确认领养</button>
            </div>
        </div>
    </div>
</div>

<script>
    // 从 sessionStorage 获取宠物数据
    var pet = JSON.parse(sessionStorage.getItem('pet'));
    document.querySelector('input[name="petName"]').value = pet.name;
    document.querySelector('input[name="petId"]').value = pet.id;

    layui.use(['form'], function () {
        var form = layui.form;

// 监听领养方式选择事件
        form.on('select(adoptionMethod)', function (data) {
            console.log(data.value);
            if (data.value == '0') {
                document.getElementById('userAddressItem').classList.remove('hidden');
                document.getElementById('pickupAddressItem').classList.add('hidden');
            } else if (data.value == '1') {
                document.getElementById('userAddressItem').classList.add('hidden');
                document.getElementById('pickupAddressItem').classList.remove('hidden');
            } else {
                document.getElementById('userAddressItem').classList.add('hidden');
                document.getElementById('pickupAddressItem').classList.add('hidden');
            }
        });

        form.on('submit(adoptPet)', function (data) { // 确保 `addPetForm` 与表单的 `lay-filter` 匹配
            console.log('表单数据:', data.field); // 输出表单数据
            fetch('/adoptPet', { // 需要替换成实际的提交接口
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
                        setTimeout(function () {
                            var index = parent.layer.getFrameIndex(window.name); // 先得到当前 iframe 层的索引
                            parent.layer.close(index); // 再执行关闭
                            // 跳转到指定页面并刷新
                            window.parent.location.href = 'petDetail'; // 替换成你想跳转的页面地址
                            window.parent.location.reload(); // 刷新页面
                        }, 500);
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

        // 初始化时根据当前选项设置显示隐藏状态
        var initialMethod = document.getElementById('adoptionMethod').value;
        if (initialMethod == '0') {
            document.getElementById('userAddressItem').classList.remove('hidden');
            document.getElementById('pickupAddressItem').classList.add('hidden');
        } else if (initialMethod == '1') {
            document.getElementById('userAddressItem').classList.add('hidden');
            document.getElementById('pickupAddressItem').classList.remove('hidden');
        }
    });
</script>
</body>
</html>