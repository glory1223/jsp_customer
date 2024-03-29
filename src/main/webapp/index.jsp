<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

</head>
<body>
<header>
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h1>Customer-List</h1>
	</div>
	<div class="col-md-2"></div>
	</div>
	</div>

</header>

<main>
	<section>
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8 table-out">
		
		
	<table>
    
    <thead>
    <tr>
    <th>Id</th>				
    <th>Name</th>
	<th>Gender</th>		
	<th>Grade</th>
	<th>Point</th>
	</tr>
    </thead>
    
    <tbody>
    <!-- JSTL로 내용은 foreach돌림 --> 
	<!-- for(Customer customer : coustomerList) -->
	<c:forEach var="customer" items="${customerList}" > <!-- list: 고객리스트 전체목록 -->
    <tr>
    <td>${customer.id}</td>
	<td><a href="./view?id=${customer.id}">${customer.name}</a></td>
	<td>${customer.gender}</td>
	<td>${customer.grade}</td>
	<td>${customer.point}</td>
    </tr>
    
    </c:forEach>
    </tbody>
    </table>
	</div>	
	<div class="col-md-2	"></div>
	</div>
	</div>
	</section>
	
	<section class= "main-button">
		
		<div class="container-fluid">
		<div class="row regist-button">
		<div class="col-md-2"></div>	
		<div class="col-md-8">
		
		<!-- 고객정보등록 버튼 -->
		<div class="btn-write">
			<a class="write" href="write">고객정보 등록</a>
		</div>
		
		<!-- 페이징처리 버튼-->
		<div class="customer_page">
			<a href="#" class="bt first">&lt;&lt;</a>
			<a href="#" class="bt prev">&lt;</a>
			<a href="#" class="num on">1</a>
			<a href="#" class="num">2</a>
			<a href="#" class="num">3</a>
			<a href="#" class="num">4</a>
			<a href="#" class="num">5</a>
			<a href="#" class="bt next">&gt;</a>
			<a href="#" class="bt last">&gt;&gt;</a>
		</div>
		
		
		</div>
		<div class="col-md-2"></div>
		</div>
		</div>
	</section>
		
		
		

</main>

<footer>

</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>