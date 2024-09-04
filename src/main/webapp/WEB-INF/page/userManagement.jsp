<%@ page import="cn.petmanagementsystem.domain.common.Pager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        .filter-form {
            margin-bottom: 20px;
        }

        .filter-form input, .filter-form select {
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .filter-form button {
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            border-radius: 4px;
        }

        .filter-form button:hover {
            background-color: #0056b3;
        }

        .pagination {
            margin: 20px 0;
            text-align: center;
        }

        .pagination a {
            padding: 10px 15px;
            border: 1px solid #ddd;
            margin: 0 5px;
            text-decoration: none;
            color: #007bff;
            border-radius: 4px;
        }

        .pagination a:hover {
            background-color: #f4f4f4;
        }

        .pagination .active {
            background-color: #007bff;
            color: #fff;
            border-color: #007bff;
        }

        .pagination .disabled {
            color: #ccc;
            pointer-events: none;
        }
    </style>

    <script>
        function submitPage(pageNum) {
            var form = document.getElementById('filterForm');
            form.pageNum.value = pageNum;
            form.submit();
        }

        function autoSubmit() {
            var form = document.getElementById('filterForm');
            form.submit();
        }

        window.onload = function() {
            if (!sessionStorage.getItem('autoSubmitted')) {
                sessionStorage.setItem('autoSubmitted', 'true');
                autoSubmit();
            }
        };
    </script>

</head>
<body>
<div class="container">
    <!-- Filter form -->
    <form class="filter-form" id="filterForm" action="getUserList" method="get">
        <!-- Hidden fields to keep track of pagination -->
        <input type="hidden" name="pageNum" value="${param.pageNum != null ? param.pageNum : 1}">
        <input type="hidden" name="offset" value="${param.offset != null ? param.offset : 10}">
        <input type="text" name="accountName" placeholder="用户名" value="${param.accountName}">
        <select name="status">
            <option value="-1">未选择</option>
            <option value="0" <c:if test="${param.status == '0'}">selected</c:if>>可用</option>
            <option value="1" <c:if test="${param.status == '1'}">selected</c:if>>不可用</option>
        </select>
        <input type="text" name="phone" placeholder="用户手机号" value="${param.phone}">
        <button type="submit">筛选</button>
    </form>

    <!-- User table -->
    <table>
        <thead>
        <tr>
            <th>昵称</th>
            <th>用户名</th>
            <th>手机号</th>
            <th>用户状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${sessionScope.pager.rows}">
            <tr>
                <td>${user.name}</td>
                <td>${user.accountName}</td>
                <td>${user.phone}</td>
                <td>${user.status ? '可用' : '不可用'}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="pagination">
        <!-- Page Number Links -->
        <c:forEach var="i" begin="1" end="${sessionScope.pager.total / sessionScope.pager.size + (sessionScope.pager.total % sessionScope.pager.size == 0 ? 0 : 1)}">
            <a href="javascript:void(0);" onclick="submitPage(${i})" class="<c:if test='${i == sessionScope.pager.page}'>active</c:if>">${i}</a>
        </c:forEach>
    </div>
</div>
</body>
</html>