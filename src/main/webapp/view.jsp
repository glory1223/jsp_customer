<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="./css/view.css"/>
</head>
<body>
<header>
	<div class="container-fluid">
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h1>Customer-Info</h1>
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


<div class="wrap-test">

<div class="card" style="width: 18rem;">
  <c:if test="${customer.img != null}">
            <div class="customer-image">
              <img src="${customer.img}" alt="고객 이미지" class="img-fluid">
            </div>
          </c:if>
</div>

<div class="card" style="width: 18rem;">
<div class="card-body">
  
 <p><strong>ID:</strong> ${customer.id}</p> 
  
  
<dl>
<dt>Name:</dt>
<dd>  <p><strong>이름:</strong> ${customer.name}</p></dd>
</dl>
<dl>
<dt>Address:</dt>
<dd><p><strong>주소:</strong> ${customer.address}</p></dd>
</dl>
<dl>
<dt>Phone:</dt>
<dd><p><strong>전화번호:</strong> ${customer.phone}</p></dd>
</dl>
<dl>
<dt>Age:</dt>
<dd><p><strong>나이:</strong> ${customer.age}</p></dd>
</dl>
</div>
</div>

<div class="card" style="width: 18rem;">
<div class="card-body">
<dl>
<dt>Point:</dt>
<dd> <p><strong>포인트:</strong> ${customer.point}</p></dd>
</dl>
						
<dl>
<dt>Gender:</dt>
<dd><p><strong>성별:</strong> ${customer.gender}</p></dd>
</dl>
						
<dl>
<dt>Grade</dt>
<dd>
<p><strong>등급:</strong> ${customer.grade}</p>
</dd>
</dl>
						
</div>
</div>


</div>
</div>
<div class="col-md-1"></div>
</div>
</section>

<div class="container-fluid">
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">

<div class="bt_wrap">
<a href="index" class="on">목록</a>
<a href="edit?id=${customer.id}" class="on">수정</a>
<a href="#" onclick="chkDelete(${customer.id}); return false;" class="btn btn-danger">삭제</a>
</div>

</div>
<div class="col-md-1"></div>
</div>
</div>

</main>



<footer></footer>


<script type ="text/javascript" src="./js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>