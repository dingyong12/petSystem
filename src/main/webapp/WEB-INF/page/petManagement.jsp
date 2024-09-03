<%@ page import="cn.petmanagementsystem.domain.Pet" %>
<%@ page import="cn.petmanagementsystem.domain.PetType" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>宠物管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .pet-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .pet-item {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            width: 200px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s;
        }

        .pet-item img {
            width: 100%;
            height: auto;
            display: block;
        }

        .pet-item h2 {
            margin: 10px 0;
            font-size: 16px;
            color: #333;
        }

        .pet-item:hover {
            transform: scale(1.05);
        }

        .pet-item a {
            display: block;
            color: #007bff;
            text-decoration: none;
        }

        .pet-item a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>待领养宠物</h1>
    <form class="filter-form" id="filterForm" action="getPetList" method="get">
        <!-- Hidden fields to keep track of pagination -->
        <input type="hidden" name="pageNum" value="${param.pageNum != null ? param.pageNum : 1}">
        <input type="hidden" name="offset" value="${param.offset != null ? param.offset : 10}">
        <input type="text" name="name" placeholder="宠物名称" value="${param.name}">
        <!-- Filter options -->
        <select name="gender">
            <option value="-1">所有性别</option>
            <option value="0" <c:if test="${param.gender == 0}">selected</c:if>>公</option>
            <option value="1" <c:if test="${param.gender == 1}">selected</c:if>>母</option>
        </select>

        <select id="petTypeSelect" name="petTypeId">
            <option value="-1">品种未选择</option>
        </select>
        <select name="adoptStatus">
            <option value="-1">领养状态未选择</option>
            <option value="0" <c:if test="${param.adoptStatus == 0}">selected</c:if>>已领养</option>
            <option value="1" <c:if test="${param.adoptStatus == 1}">selected</c:if>>未领养</option>
        </select>
        <button type="submit">筛选</button>
    </form>

    <!-- Pet grid -->
    <div class="pet-grid" id="petGrid">
        <!-- Pet items will be added here -->
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const filterForm = document.getElementById("filterForm");
        const petGrid = document.getElementById('petGrid');

        // Function to build URL with parameters
        function buildUrl() {
            const formData = new FormData(filterForm);
            const queryParams = new URLSearchParams();

            formData.forEach((value, key) => {
                if (value) {
                    queryParams.append(key, value);
                }
            });
            return `/getPetList?${queryParams.toString()}`;
        }

        // Fetch pets when page loads
        function fetchPets() {
            fetch(buildUrl())
                .then(response => response.json())
                .then(pets => {
                    console.log("Fetched pets:", pets); // 添加调试信息
                    if (Array.isArray(pets)) {
                        // Clear existing pet items
                        petGrid.innerHTML = '';

                        pets.forEach(pet => {
                            console.log(pet);

                            // Create pet item element
                            const petItem = document.createElement('div');
                            petItem.className = 'pet-item';

                            // Create pet link
                            const petLink = document.createElement('a');
                            petLink.href = `petDetail?petId=${pet.id}`;

                            // Create pet image
                            const petImage = document.createElement('img');
                            petImage.src = pet.picture;
                            petImage.alt = pet.name;

                            // Create pet name
                            const petName = document.createElement('h2');
                            petName.textContent = pet.name;

                            // Append elements to pet link
                            petLink.appendChild(petImage);
                            petLink.appendChild(petName);

                            // Append pet link to pet item
                            petItem.appendChild(petLink);

                            // Append pet item to pet grid
                            petGrid.appendChild(petItem);
                        });
                    } else {
                        console.error("Pets data is not an array:", pets);
                    }
                })
                .catch(error => console.error('Error:', error));
        }

        // Fetch pets initially
        fetchPets();

        // Handle form submission
        filterForm.addEventListener("submit", function (event) {
            event.preventDefault(); // Prevent default form submission
            fetchPets(); // Fetch pets based on the current filter parameters
        });
    });
</script>
</body>
</html>