<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="./css/write.css"/>
</head>
<body>
<header>
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h1>Customer-Edit</h1>
	</div>
	<div class="col-md-2"></div>
	</div>
	</div>

</header>

<main>

<section>
<div class="container-fluid">
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">

<div class="customer-reg wrap">
<form name= "frm" method="post" action="update?id=${customer.id}" enctype="multipart/form-data" class="wrap-test"> <!-- 폼태그내 파일업로드시 enctype 작성-->
<div class="card" style="width: 18rem;">
 <img src="./personImg.png" class="card-img-top" alt="사진등록">
 <c:if test="${customer.img != null}">
	<img alt="업로드 이미지" src="${customer.img}" width="100"/>
	</c:if>
	<input type="hidden" name="origin_file" value="${customer.img}">
 <div class="card-body">
<label style="font-size: 1.4rem; padding-right: 20px;" for="file">사진 등록</label>
<br>
<input type="file" name="file" id="file" />
</div>
</div>

<div class="card" style="width: 18rem;">
<div class="card-body">
  
<dl>
<dt>Name:</dt>
<dd><input type="text" name="name" maxlength="25" placeholder="이름입력할것" value="${customer.name }"/></dd>
</dl>
<dl>
<dt>Address:</dt>
<dd><input type="text" name="address" maxlength="50" placeholder="주소입력할것"value="${customer.address }" /></dd>
</dl>
<dl>
<dt>Phone:</dt>
<dd><input type="text" name="phone" maxlength="15" placeholder="휴대폰입력할것" value="${customer.phone }"/></dd>
</dl>
<dl>
<dt>Age:</dt>
<dd><input type="text" name="age" maxlength="5" placeholder="나이입력할것"value="${customer.age }" /></dd>
</dl>
</div>
</div>

<div class="card" style="width: 18rem;">
<div class="card-body">
<dl>
<dt>Point:</dt>
<dd><input type="text" name="point" maxlength="5" placeholder="포인트입력할것" /></dd>
</dl>
						
<dl>
<dt>Gender:</dt>
<dd><input type="radio" name="gender" maxlength="10" value="male" />남성</dd>
<dd><input type="radio" name="gender" maxlength="10" value="female" />여성</dd>
</dl>
						
<dl>
<dt>Grade</dt>
<dd>
<select name="grade">
<option value="silver">silver</option>
<option value="gold">gold</option>
<option value="vip">vip</option>
</select>
</dd>
</dl>
						
</div>
</div>
			
</form>
		
		
		

</div>
<div class="col-md-1"></div>
</div>
</div>
</section>

<div class="btn-write">

<div class="container-fluid">
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">

<div class="bt_wrap">
<a class="on" onclick="chkForm(${customer.id}); return false;">수정</a> 
<a class="on" href="index">취소</a>
</div>

</div>
</div>
</div>

</div>

</main>

<footer></footer>

<script type ="text/javascript" src="./js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>