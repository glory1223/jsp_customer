<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css"/>
</head>
<body>

<div class="customer_wrap">
		<div class="customer_title">
			<strong>고객리스트</strong>
		</div>
		<div class="customer_view_wrap">
			<div class="customer_view">
				<div class="title"> ${customer.name} </div>
				<div class="info" style="position:relative;">
					
					<dl>
						<dt>아이디:</dt>
						<dd> ${customer.id} </dd>
					</dl>
					<dl>
						<dt>주소:</dt>
						<dd> ${customer.address} </dd>
					</dl>
					<dl>
						<dt>휴대폰:</dt>
						<dd> ${customer.phone} </dd>
					</dl>
					<dl>
						<dt>성별:</dt>
						<dd> ${customer.gender} </dd>
					</dl>
					<dl>
						<dt>나이:</dt>
						<dd> ${customer.age} </dd>
					</dl>
					<dl>
						<dt>포인트:</dt>
						<dd> ${customer.point} </dd>
					</dl>
					<dl>
						<dt>등급:</dt>
						<dd> ${customer.grade} </dd>
					</dl>
					<dl>
						<dt>성별:</dt>
						<dd> ${customer.gender} </dd>
					</dl>
					<dl style="position: absolute; right:0;">
						<dt>
							<a onclick="chkDelete(${customer.id}); return false;">고객정보삭제</a>
						</dt>
						 					
					</dl>
					
				</div>
				
				<c:if test="${customer.img != null}">
					<div class="cont"><img src="${customer.img}" alt="고객 이미지"></div>
				</c:if>
				
			</div>
			<div class="bt_wrap">
				<a href="index" class="on">목록</a>
				<a href="edit?id=${customer.id}">수정</a>
			</div>
		</div>
	</div>

	<script type ="text/javascript" src="./js/script.js"></script>
</body>
</html>