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

#withdraw_menu{
	border-left: 2px solid black !important;
}

#withdraw_menu a{
	font-weight: bold;
	color: #444444;
}


#center div{
	padding-top:50px;
}

#center a{
	font-weight: bold;
	font-size: 12pt;
	color: #3399ff;
}

#center h4{
	font-weight: bold;
	font-size: 12pt;
	line-height: 30px;
}

</style>
<script type="text/javascript">
	$(function() {
		if(${empty login}){
			$('#msg').val('로그인이 필요한 서비스입니다.');
			$('#hidden_form').submit();
		}
	})
</script>
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
		<div>
		<h4>탈퇴 이후 본 계정의 모든 게시글과 댓글은 삭제됩니다.</h4>
		<h4>탈퇴하시려면 아래의 '탈퇴하기'를 눌러주세요.</h4>
		<br><br>
			<a href="withdraw.do" onclick="return confirm('정말 탈퇴하시겠습니까?')">탈퇴하기</a>
			</div>
		</aside>
	</section>
	<form style="visibility:hidden" action="login.jsp" method="post" id="hidden_form">
		<input type="hidden" id="msg" name="msg" value="">
	</form>
	
	<%@include file="common/footer.jsp"%>
	<script src="./script.js/insta.js"></script>
</body>
</html>