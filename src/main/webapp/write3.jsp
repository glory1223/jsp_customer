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
	<div class= "board_wrap">
		<div class= "board_title">
			<strong>고객리스트</strong>
		</div>
		
		<div class="board_write wrap">
			<form name= "frm" method="post" action="insert" enctype="multipart/form-data" > <!-- 폼태그내 파일업로드시 enctype 작성-->
				<div class="board_write">
						
					<div class="name">
						<dl>
							<dt>고객명:</dt>
							<dd><input type="text" name="name" maxlength="10" placeholder="이름입력할것" /></dd>
						</dl>
					</div>
					
					<div class="address">
						<dl>
							<dt>고객주소:</dt>
							<dd><input type="text" name="address" maxlength="50" placeholder="주소입력할것" /></dd>
						</dl>
					</div>
					
					<div class="phone">
						<dl>
							<dt>휴대폰:</dt>
							<dd><input type="text" name="phone" maxlength="15" placeholder="휴대폰입력할것" /></dd>
						</dl>
					</div>
					
					<div class="gender">
						<dl>
							<dt>고객성별:</dt>
							<dd><input type="radio" name="gender" maxlength="10" value="male" />남성</dd>
							<dd><input type="radio" name="gender" maxlength="10" value="female" />여성</dd>
						</dl>
					</div>
					
					<div class="age">
						<dl>
							<dt>나이:</dt>
							<dd><input type="text" name="age" maxlength="10" placeholder="나이입력할것" /></dd>
						</dl>
					</div>
					
					<div style="padding-top:10px;">
						<label style="font-size: 1.4rem; padding-right: 20px;" for="file">이미지 업로드</label>
						<input type="file" name="file" id="file" />
					</div>
					
					<div class="point">
						<dl>
							<dt>포인트:</dt>
							<dd><input type="text" name="point" maxlength="10" placeholder="포인트입력할것" /></dd>
						</dl>
					</div>
					
					<div class="grade">
						<dl>
							<dt>등급</dt>
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
			<div class="bt_wrap">
				<a class="on" onclick="chkForm(); return false;">등록</a> 
				<a href="index">취소</a>
			</div>
		</div>
	</div>

<script type ="text/javascript" src="./js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>