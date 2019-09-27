<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/profileEdit.css">
<link rel="stylesheet" href="css/search&like.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
#profile_menu {
	border-left: 2px solid black !important;
}

#profile_menu a {
	font-weight: bold;
	color: #444444;
}
</style>
<script type="text/javascript">
	$(function() {
		if(${empty login}){
			$('#msg').val('로그인이 필요한 서비스입니다.');
			$('#hidden_form').submit();
		}
		$('.need').each(function(i, element) {
			$(element).keyup(function() { //입력창에 키보드 입력시 에러 메시지 지우기
				clearAll();
			});
		});

		function clearAll() { //에러 메시지 지우기
			$('#errMsg').html("");
		}

		$('#img_change_btn').click(function() { //프사 편집 버튼 클릭시 프사 편집 선택 화면 보이기
			if ("<c:out value='${user.img}'/>" == "./userpic/default.png") //프사가 기본 이미지일 경우 바로 이미지파일 선택 창으로. 되는지 확인해야..
				$('#myfile').trigger('click');
			else
				$('#img_change_opt').css('visibility', 'visible');
		});
		$('#delete').click(function() { //프사 삭제 버튼 클릭시 value변경 -> 서블릿에서 val 확인해서 프사 삭제할것임
			if (confirm('삭제하시겠습니까?')) {
				$(this).val('delete');
				$('#imgForm').submit();
			}
		});
		$('#cancel').click(function() { //취소 버튼 클릭시 프사 편집 선택 화면 감추기
			$('#delete').val(''); //프사 삭제 버튼 초기화
			$('#img_change_opt').css('visibility', 'hidden');
		});
		
	});
</script>
<style type="text/css">



</style>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<section id="sect">
		<div id="left">
			<div id="menu">
				<div id="profile_menu">
					<a href="profile.do">프로필 편집</a>
				</div>
				<div id="password_menu">
					<a href="passwordEdit.jsp">비밀번호 변경</a>
				</div>
				<div id="withdraw_menu">
					<a href="withdraw.jsp">회원 탈퇴</a>
				</div>
			</div>
		</div>
		<div id="center">
			<div id="prof_info">
				<img src="${user.img}" alt="" id="prof_img" width=100 height=100>
				<div id="prof_info_sub">
					<div>${user.email}</div>
					<div>
						<h4 id="img_change_btn">프로필 사진 바꾸기</h4>
					</div>
				</div>
			</div>
			<form action="./profileEdit.do" method="post" id="prof_form">
				<table>
					<tr>
						<td class="input_name"><span>이름</span></td>
						<td><input type="text" class="need" id="name" name="name"
							value="${user.name}" required="required"></td>
					</tr>
					<tr>
						<td class="input_name"><span>이메일</span></td>
						<td><input type="email" class="need" id="email" name="email"
							value="${user.email}" required="required"></td>
					</tr>
					<tr>
						<td class="input_name"><span>자기소개</span></td>
						<td><input type="text" class="need" id="info" name="info"
							 value="${user.info}" ></td>
					</tr>
				</table>
				<div id="msg_space">
					<span class="error" id="errMsg">${msg}</span>
				</div>
				<div>
					<input type="submit" class="form_btn" value="수정">
				</div>
			</form>
		</div>
	</section>
	<div id="img_change_opt">
		<div>
			<!-- 수직 정렬 도와줘.....-->
			<div>프로필 사진 바꾸기</div>
			<form action="./profImgChange.do" method="post"
				enctype="multipart/form-data" id="imgForm">
				<hr>
				<div>
					<label for="myfile" id="upload_label"><input type="file"
						id="myfile" name="myfile" multiple="multiple" accept="image/*"
						onchange="form.submit()" >사진 업로드</label>
				</div>
				<hr>
				<div>
					<label for="delete" id="delete_label"><input type="text"
						id="delete" name="delete" value="">현재 사진 삭제</label>
				</div>
				<hr>
			</form>
			<h4 id="cancel">취소</h4>

		</div>
	</div>
	<form style="visibility:hidden" action="login.jsp" method="post" id="hidden_form">
		<input type="hidden" id="msg" name="msg" value="">
	</form>
	<%@include file="common/footer.jsp"%>
	<script src="./script.js/insta.js"></script>
</body>

</html>