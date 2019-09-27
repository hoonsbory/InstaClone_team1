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
#password_menu {
	border-left: 2px solid black !important;
}

#password_menu a {
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
		$('.need').each(function(i, element) { //입력창에 키보드 입력시 에러 메시지 지우기
			$(element).keyup(function() {
				clearAll();
			})
		});
		$('#new_pw')[0].oninvalid = function() {
			if (!this.validity.valid && $($(this)[0]).val().length > 0){
				this.setCustomValidity('영문자, 숫자, 특수문자 포함 6자 이상 15자 이하로 입력하세요.');
			}
		}
		$('#new_pw')[0].oninput= function () {
	        this.setCustomValidity("");
		};
		
	})

	function clearAll() { //에러 메시지 지우기
		$('#errMsg').html("");
	}

	function check() { //새로운 패스워드 두 개 같은지 확인
		if ($('#new_pw').val() != $('#new_pw2').val()) {
			$('#errMsg').html("입력한 새 패스워드 두 개가 일치하는지 확인하세요");
			$('#new_pw').focus();
			return false;
		}
		return true;
	}
</script>
<style type="text/css">


</style>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<section id="sect">
		<aside id="left">
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
		</aside>
		<aside id="center">
			<form action="passwordEdit.do" method="post"
				onsubmit="return check()" onreset="clearAll()" id="password_form">
				<table>
					<tr>
						<td class="input_name"><span>이전 비밀번호</span></td>
						<td><input type="password" id="past_pw" name="past_pw"
							class="need" required="required"></td>
					</tr>
					<tr>
						<td class="input_name"><span>새 비밀번호</span></td>
						<td><input type="password" id="new_pw" name="new_pw"
							class="need" required="required"
							pattern="(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,15}"></td>
					</tr>
					<tr id="small_tr">
						<td></td>
						<td><span id="pattern">영문자, 숫자, 특수문자 포함 6자 이상</span></td>
					</tr>
					<tr>
						<td class="input_name"><span>새 비밀번호 확인</span></td>
						<td><input type="password" id="new_pw2" name="new_pw2"
							class="need" required="required"></td>
					</tr>
				</table>

				<div id="msg_space">
					<span class="error" id="errMsg">${msg}</span>
				</div>
				<input type="submit" class="form_btn" id="submit_btn"
					value="비밀번호 변경"> <input type="reset" class="form_btn"
					id="reset_btn" value="초기화">
			</form>
		</aside>
	</section>
	<form style="visibility:hidden" action="login.jsp" method="post" id="hidden_form">
		<input type="hidden" id="msg" name="msg" value="">
	</form>
	<%@include file="common/footer.jsp"%>
	<script src="./script.js/insta.js"></script>
</body>
</html>