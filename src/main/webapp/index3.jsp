<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<div class="wrap">
		<table class="board_list"> <!-- 게시판은 보통 테이블로 -->
			
				<h1>고객리스트</h1>
			
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>등급</th>
				</tr>
			</thead>
			<tbody>
				<!-- JSTL로 내용은 foreach돌림 --> 
				<!-- for(Customer customer : coustomerList) -->
				<c:forEach var="customer" items="${customerList}" > <!-- list: 고객리스트 전체목록 -->
					<tr>
						<td>${customer.id}</td>
						<td class="name"><a href="./view?id=${customer.id}">${customer.name}</a></td>
						<td>${customer.gender}</td>
						<td>${customer.grade}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 글쓰기 버튼 -->
		<div class="bt_wrap bt_list">
			<a href="write">글쓰기</a>
		</div>
		
		<!-- 페이징처리 버튼-->
		<div class="board_page">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>