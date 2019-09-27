<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log-in</title>
<link href="https://fonts.googleapis.com/css?family=Rum+Raisin&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<script type="text/javascript">
$(function () {
	$('.w3-input').each(function(i, element) {
		$(element).keyup(function() { //입력창에 키보드 입력시 에러 메시지 지우기
			clearAll();
		})
	});
	$('#name')[0].oninvalid = function() {
		if (!this.validity.valid && $($(this)[0]).val().length > 0) {
			this.setCustomValidity('2자 이상 15자 이하로 입력하세요.');
		}
	}
	$('#pw2')[0].oninvalid = function() {
		if (!this.validity.valid && $($(this)[0]).val().length > 0){
			this.setCustomValidity('영문자, 숫자, 특수문자 포함 6자 이상 15자 이하로 입력하세요.');
		}
	}
	$('#name')[0].oninput= function () {
	    this.setCustomValidity("");
	};
	$('#pw2')[0].oninput= function () {
        this.setCustomValidity("");
	};
})

function clearAll() { // 입력창_에러메세지 지우기
	$('#errMsg1').html("");
	$('#errMsg2').html("");
}
</script>

<script type="text/javascript">
	window.onload = function (){
		let count =0;
			let imgArray=new Array(); 
			imgArray[0]="https://i.imgur.com/wHJE18E.jpg"; 
			imgArray[1]="https://i.imgur.com/7FPDZtO.jpg"; 
			imgArray[2]="https://i.imgur.com/ku8Flwk.jpg"; 
			imgArray[3]="https://i.imgur.com/zpAIxKu.jpg"; 
			imgArray[4]="https://i.imgur.com/v3CaeK9.jpg"; 

		function showImage(){ 
			//let imgNum=Math.round(Math.random()*4); 

			let objImg=document.getElementById("inner-img");  
			
			objImg.src=imgArray[count]; 
			count++;
			if(count==4){
				count = 0;
				
			}
			setTimeout(showImage,1500); 	
		}
		showImage();
		
		$('#addform').hide();
		$('#btnreal').click(()=>{
			$('#loginform').slideDown('slow');
			$('#addform').slideUp('slow');
			
		})
		
		$('#btnreal2').click(()=>{
			$('#addform').slideDown('slow');
			$('#loginform').slideUp('slow')
		})
	}		
		
</script>


<style type="text/css">

.w3-display-middle {
	left : 35% !important;
}
.whole{
	position: absolute;
	left: 50%;

    max-width: 380px;
    width: 100%; 
    height: 740px;

}

.whole-01  {
    background-color: #FFFFFF;
    margin-top: 12px;
    height : 600px;
    width:  450px;
    border : 1px solid #e6e6e6;
    position: relative;
    top : 10%;
}

.whole-01__fieldset{
	border-color: rgba(255,255,255,.5);
	height:430px;
}

.whole-01__header{
	color: #262626; 
	font-family: 'Rum Raisin', cursive;
	font-size: 60px;
	margin-bottom: 65px;
}


.whole-01__body--email, .need  {
	
	position: absolute;
	left: 10px;
	margin-left: 34px;
	width: 270px; 
	height: 30px;
	background-color: #FAFAFA;
	padding: 7px 7px 7px 8px;
	font-size: 20px;
}

.whole-01__body--errMsg{
	color: #ed4956;
	text-align: center;
}

.whole-01__body--login-btn{
	position: absolute;
	left: 43px;
	bottom: 308px;
	width: 290px; 
	height: 46px;
	font-size: 22px;
	font-weight: 600;
	border-radius: 5px 5px 5px 5px;
	background-color:#2E9AFE ;
	color: #FFFFFF;

	
	
}

.whole-01__body--divide-line {
	position:absolute;
	bottom: 330px;
	left: 1px;
	width: 99%; 
	height: 1px;
	border: 0.4pt solid #efefef;

}

.whole-01__body--search-question{
	position: absolute;
	bottom: 180px;
	left: 140px;
}

.whole-01__body--search-password{
	position: absolute;
	bottom: 147px;
	left: 180px;
	text-decoration: none;
	font-weight: 550;
	color: #2E9AFE;
}


.whole-02 {
	margin-top: 20px;
	border-color: rgba(255,255,255,.5);
	color: #262626; 
	text-align: center;
}

.whole-02--href{
	text-decoration: none;
	font-weight: 550;
	color: #2E9AFE;
}

.hp-img{ /*핸드폰 이미지 감싸고 있는 div 클래스명*/
	position:absolute;
	top: 10%;
	left: 25%;
	width:368px;
	height:685px;
	display: inline-block;
}

#hp-img{ /*핸드폰 이미지요소의 id 이름 */
	
}

.inner-img { 

	display: auto;
    position: absolute;
    top : 0px;
    left : 31.2%;
    width: 243px; 
    height: 385px;

}

#inner-img {
	
	position:relative;
    width: 243px;
    top : 22%;
    height: 435px;
}
.w3-container {
	background-color: rgba(255, 255, 255, 0.5);
}

#head {
	font-size: 100px !important;
}

#centermain {
}

#bitimg {
	left: 35%; 
	position: absolute;
	top: 80px;
}

#centermain2 {
	position: relative;
}

#center {
	border-radius: 10px;
	position : absolute;
	width: 1200px;
	height: 600px;
	left: 200px;
	top : 70px;
	background: white;
}



.w3-teal {
	background-color: rgba(0, 149, 255) !important;
}

.w3-bar-item w3-button {
	background: black;
}

.w3-btn, .w3-button {
	color: black;
}

.w3-animate-left {
	position: absolute;
}

#btn1, #btn2 {
	background-color: rgba(255, 255, 255, 0);
	border: none;
	color: white;
}

.idpw {
	color: black;
}

.submit {
	background: white;
	border: none;
	color: black;
}

.w3-animate-left {
	animation: none;
}

.w3-sidebar {
	height: auto;
}

#btnreal, #btnreal2 {
	width: 414.86px;
	border: none;
	background: #4099f9;
	padding-top: 5px;
	padding-bottom: 5px;
	color: white;
	font-size: 2em;
	text-align: left;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	position: relative;
	left: 15%;
}

input {
	color: black;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	padding: 20px;
	width: 200px;
	transition: all 0.5s;
	font-size: 28px;
	cursor: pointer;
	margin: 5px;
	height: 70px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

#loginform, #addform {
	position: relative;
	left: 15%;
	width: 414.86px;
}

#addform {
	padding-top: 15px;
}
.w3-display-middle{
		
}
.error{
 color: red;
 margin: 10px;
}
</style>


</head>
<body style="background-color: #FAFAFA">
<article class="article-01">
  <div class="whole">
	 <div class="whole-01">
                                                       
		<fieldset class="whole-01__fieldset">
<div class="w3-display-middle">
			<h1 class="whole-01__header" style="text-align: center;">Instagram</h1>

			<button type="button" class="w3-animate-top" id="btnreal">로그인</button>



			<form action="login.do" id="loginform" class="w3-container" method="post">
				<br>
				<p>
					<label class="idpw">EMAIL</label> <input class="w3-input" type="text"
						id="email" name="email" required="required"  placeholder="이메일을 입력하세요">
				</p>
				<p>
					<label class="idpw">PASSWORD</label> <input class="w3-input"
						type="password" id="pw" name="pw"  placeholder="비밀번호를 입력하세요" required="required">
				</p>
					<span class="error" id="errMsg1">${msg}</span>
				<p>
					<button id="btn3" type="submit" class="button"
						style="vertical-align: middle">
						<span>LOGIN </span>
					</button>
				</p>
			</form>
			<br>
			<br>
			<button type="button" id="btnreal2" class="w3-animate-top">회원가입</button>



			<form action="signUp.do" id="addform" class="w3-container"
				method="post">

				<label class="idpw">EMAIL</label> <input class="w3-input" type="email"
					id="email2" name="email2" required="required" placeholder="이메일을 입력하세요"> <label class="idpw">PASSWORD</label> <input
					class="w3-input" type="password" placeholder="영문자, 숫자, 특수문자 포함 6자 이상" pattern="(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,15}"  id="pw2" name="pw2" required="required"> <label
					class="idpw" >NAME</label> <input class="w3-input" type="text"
					id="name" placeholder="이름을 입력하세요" name="name" required="required" pattern=".{2,15}"><br>
				<span class="error" id="errMsg2">${msg2}</span>
				<button id="btn4" type="submit" class="button"
					style="vertical-align: middle">
					<span>가입 </span>
				</button>
				</p>
			</form>
		</div>
</fieldset>
  </div>
  </div>
</article>	

<article class="article-02">
	
	<div class="img-container">
		<div class="hp-img">
			<img id="hp-img" alt="핸드폰사진" src="https://i.imgur.com/DJF3nO5.png">
		<div class="inner-img">
			<img id="inner-img" src="./img/img03.jpg">
		</div>
		</div>
	
	
	</div>
</article>	

</body>
</html>