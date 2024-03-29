// 고객정보 등록 전 체크
function chkForm() {
	var f = document.frm; //form태그 전체요소 돔객체 가져옴.
	
	if(f.name.value == '') { // title은 form태그안에 name임.
		alert("이름을 입력해주세요.");
		return false; //함수 종료시킴(걸리면 뒤에 있는 코드 실행안함)
	}
	
	if(f.address.value == '') {
		alert("주소를 입력해주세요.");
		return false;
	}
	
	if(f.phone.value == '') {
		alert("내용을 입력해주세요.");
		return false;
	}
	
	if(f.gender.value == '') {
		alert("성별을 선택해주세요.");
		return false;
	}
	
	if(f.age.value == '') {
		alert("나이를 입력해주세요.");
		return false;
	}
	
	
	
	if(f.point.value == '') {
		alert("포인트를 입력해주세요.");
		return false;
	}
	
	if(f.grade.value == '') {
		alert("등급을 선택해주세요.");
		return false;
	}
	
	f.submit(); //서버로 폼태그안의 데이터를 전송
}

function chkDelete(id) {
	const result = confirm("고객정보를 삭제하겠습니까?")
	
	if(result) {
		const url = location.origin; //경로에서 프로젝트명 이전?
		
		//페이지이동(request)
		location.href = url + "/jsp_customer/delete?id=" + id;
	} else {
		return false;
	}
}