<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Rum+Raisin&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/search&like.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
window.onload = function(){
	
	
	const log = console.log;
	let count = 0;
	let countdiv = 1;
	let pagecount = 1;
	let id1 = "<c:out value='${id}'/>";
	$.ajax({
		url : 'mypagepost.jsp',
		type : 'get',
		dataType : 'json',
		data : {id : id1},
		success : ((data)=>{
			
		if(data.length==0){
			$(".default-page").show()
		}else{
			$(".default-page").hide()
		}
			for (i = data.length; i>0; i-=3){
				let divmain = document.createElement('div');
				divmain.setAttribute("id", "divmain"+countdiv);
				divmain.setAttribute("class", "divmain");
				
				document.querySelector('#sec').appendChild(divmain);
			for(var j = 3; j>0; j--){
				if(data[count]!=null){
				let a = document.createElement("a");
				let img = document.createElement("img");
				document.querySelector("#divmain"+countdiv).appendChild(a);
					
				
				img.setAttribute("src", data[count].id);
				img.setAttribute("height" , "300");
				img.setAttribute("width" , "300");
				img.setAttribute("alt" , "instapic");
				img.setAttribute("class" , "mainimg");
				a.setAttribute("href" , "showPost.do?post_id="+data[count].postid);
				
				$(a).addClass("apic");
				document.querySelector("#divmain"+countdiv).lastElementChild.appendChild(img);
				count++;
				}
			}
				countdiv++;
			if(data.length >= 9 && count==9){
				break;
				
			}
			
				
			}
			
		}),
		error : ((e)=>{
			alert('실패'+e);			
		})
		
	
	 
	
	})
	
	  $(window).scroll(function(){
		  if ( $(window).scrollTop() == $(document).height() - $(window).height() ) {
			  pagecount++;	
			  $.ajax({
					url : 'mypagepost.jsp',
					type : 'get',
					dataType : 'json',
					data : {id : id1},
					success : ((data)=>{
						loop:
						for (i = data.length-count; i>0; i-=3){
							let divmain = document.createElement('div');
							divmain.setAttribute("id", "divmain"+countdiv);
							divmain.setAttribute("class", "divmain");
							
							document.querySelector('#sec').appendChild(divmain);
						for(var j = 3; j>0; j--){
							if(data[count]!=null){
							let a = document.createElement("a");
							let img = document.createElement("img");
							document.querySelector("#divmain"+countdiv).appendChild(a);
								
							
							img.setAttribute("src", data[count].id);
							img.setAttribute("height" , "300");
							img.setAttribute("width" , "300");
							img.setAttribute("alt" , "instapic");
							img.setAttribute("class" , "mainimg");
							a.setAttribute("href" , "post.do?id="+data[count].postid);
							
							$(a).addClass("apic");
							document.querySelector("#divmain"+countdiv).lastElementChild.appendChild(img);
							count++;
							}else{
								break loop;
							}
							
						}
						countdiv++;
						if(data.length >= 9*pagecount && count==9*pagecount){
							break;
							
						}
						
						}
						
					}),
					error : ((e)=>{
						alert('실패'+e);			
					})
					
				
				 
				
				})
		    }



		
		  
		  
	  })
	
	
	  $('#up_cancel').click(function() {

			location.href = 'home.do';

		});

		// 글자 등록 

		$('#up_submit').click(insertPost);

		$('#content').keyup(countPost);


	function insertPost() {

		let str = $("#content").val();

		str = str.replace(/(?:\r\n|\r|\n)/g, '<br />'); //엔터 처리

		$("#content").val(str);

		$('#insertForm').submit();

	};

	function countPost() {

		let textLength = $(this).val().length;

		$('#textCount').text(textLength + '/150');

		if (textLength > 150) {

			$(this).val($(this).val().substr(0, 150));

		}
	}
		
	$('.insert-post-a').click(function upload(){
			$('#uploaddiv').css('display','block');
		
	})
	$('#uploadbtn').click(function upload(){
			$('#uploaddiv').css('display','block');
		
	})
	

	
$("#myfile").change(function() {
	        readURL(this);
		});


	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#img_preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
	
	var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }

        $(this).siblings('.upload-name').val(filename);
    });
    
    $('.realbtn').click(()=>{
		$('#uploaddiv').css('display', 'none');
		
		
	})
	$('#btn3').click(function fcheck(){
	 var fileCheck = document.getElementById("myfile").value;
    if(!fileCheck){
        alert("파일을 첨부해 주세요");
        return false;
    }
    })
	}
</script>
<style type="text/css">
body {
	margin: 10px
}

.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}
a:hover{
	text-decoration: none;
	
}
#btnEdit2{
	margin-top: 5px !important;

}
.profile-user-name{
	color : black;
}
.uploadpostimage input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

#upload_label {
	text-align: center;
	height: 50px !important;
	width: 70% !important;
	font-size: 28px;
	cursor: pointer;
	margin-bottom: 10px;
	padding-top: 5px;
	position: relative;
	left: 15%;
}

#btn3 {
	height: 50px !important;
	width: 70% !important;
	margin: 0px;
	position: relative;
	left: 15%;
	margin-bottom: 7px;
}

.uploadpostimage {
	width: 400px;
	max-height: calc(100% - 40px);
	background: white;
	border-radius: 20px;
	-webkit-overflow-scrolling: touch;
	overflow-x: hidden;
	overflow-y: auto;
	padding: 0;
	border: 1px solid #efefef;
	color: #999;
	font-size: 14px;
	padding: 15px;
	z-index: 2;
	left: 40%;
	top: 5%;
}

.uploadpostimage label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* named upload */
.uploadpostimage #myfile {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.uploadpostimage label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}

#content {
	display: block;
	width: 100%;
	height: 180px;
	overflow-y: hidden;
}

#btnEdit2 {
	background: #3897f0 !important;
	color: white !important;
}

.apic {
	display: inline !important;
	margin-right: 28px;
}

.divmain {
	display: inline-block !important;
	position: relative;
	left: 20%;
	margin-bottom: 28px;
}

.mainimg {
	display: inline;
	width: 300px;
	height: 300px;
}

.mainimg:hover {
	opacity: 0.5;
}

.section1 {
	margin-top: 30px;
}

.profile-edit-btn2 {
	text-align: center;
	font-size: 1.0rem;
	font-weight: bold;
	background-color: rgba(0, 0, 0, 0);
	line-height: 1.6;
	width: 100px;
	border-radius: 0.3rem;
	padding: 0 0.8rem;
	margin: 20px auto;
	border: 1px solid #3399ff;
	color: #3399ff;
	padding: 5px;
	position: absolute;
	bottom: 17%;
	right: 0;
	z-index: 1;
}
.profile-edit-btn3{
	right: 0;
	position: absolute;
	bottom: 17%;
	text-align: center;
	font-size: 1.0rem;
	font-weight: bold;
	line-height: 1.6;
	width: 100px;
	border-radius: 0.3rem;
	padding: 0 0.8rem;
	margin: 20px auto;
	border: 1px solid #3399ff;
	padding: 5px;
	background-color: #3399ff;
	color: white;
	float: left;
	z-index: 1;

}
.profile-edit-btn1, .profile-edit-btn0 {
	right: 0;
	position: absolute;
	bottom: 17%;
	text-align: center;
	font-size: 1.0rem;
	font-weight: bold;
	line-height: 1.6;
	width: 100px;
	border-radius: 0.3rem;
	padding: 0 0.8rem;
	margin: 20px auto;
	border: 1px solid #3399ff;
	padding: 5px;
	background-color: #3399ff;
	color: white;
	float: left;
	z-index: 1;
}

.default-page {
	text-align: center;
}

#uploaddiv {
	align-items: center;
	background-color: rgba(0, 0, 0, .65);
	bottom: 0;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	left: 0;
	overflow-y: auto;
	position: fixed;
	right: 0;
	top: 0;
	z-index: 1;
	display: none;
}

#img_preview {
	width: 300px;
	height: 300px;
	position: relative;
	left: 7%;
	margin-bottom: 10px;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 20px;
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
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
</style>
<title>Insert title here</title>
</head>

<body>



	<%@include file="common/header.jsp"%>
	<header>

		<div class="container">

			<div class="profile">

				<div class="profile-image">

					<img id="profileImage" src="${img}" title="default-profile.png"
						style="width: 150px; height: 150px;" /> <input id="imageUpload"
						type="file" name="profile_photo" placeholder="Photo">


				</div>
				<div class="profile-user">
					<div class="profile-user-settings">

						<a class="profile-user-name">${name}</a>

						<button class="btn profile-edit-btn" id="btnEdit">프로필 편집</button>
						<button class="btn profile-edit-btn" id="btnEdit2">로그아웃</button>
						<form action="profile.do" id="frmEdit" method="post"></form>
						<form action="logout.do" id="frmlogout" method="get"></form>
					</div>
					<div class="profile-stats">

						<div class="back" id="backfollower">
							<div>
								<div class="followerlist_class"></div>
							</div>
						</div>
						<div class="back" id="backfollow">
							<div>
								<div class="followlist_class"></div>
							</div>
						</div>
						<ul>
							<li><span class="profile-stat-count">${count}</span> 게시글</li>
							<li id="followerlist"><span class="profile-stat-count"
								id="follow">${follower}</span> 팔로워</li>
							<li id="followlist"><span class="profile-stat-count"
								id="follower">${follow}</span> 팔로잉</li>
						</ul>

					</div>
					<br>


					<div class="profile-bio">
						<p>
							<span class="profile-real-name">${name}</span> ${info}
						</p>

					</div>
				</div>
			</div>

		</div>

	</header>
	<div id="uploaddiv">
		<div class='uploadpostimage'>
			<div class='headdiv'>
				<div class='leftdiv'></div>
				<h1 class='headmain'>
					<div class='headfont'>게시물 등록</div>
				</h1>
				<div class='rightdiv'>
					<button class='realbtn'>
						<span class='lastspan' aria-lable='닫기'></span>
					</button>
				</div>
			</div>
			<form action="insertPost.do" method="post" id="insertForm"
				enctype="multipart/form-data">
				<img id="img_preview" src="https://i.imgur.com/yXQ2AEu.png"
					title="images.png" /> <label for="myfile" id="upload_label">사진
					업로드<input type="file" id="myfile" name="myfile" multiple="multiple"
					accept="image/*">
				</label>
				<button id="btn3" class="button" style="vertical-align: middle">
					<span>등록 </span>
				</button>
				<textarea form="insertForm" id="content" name="content"
					placeholder="    ...게시할 글을 작성하세요..." maxlength="150"></textarea>
				<span id="textCount">0/150</span>

			</form>
		</div>
	</div>



	<a class="insert-post-a"><img src="https://i.imgur.com/lOwg0em.png"
		class="insert-post-img"></a>
	<section class="section1">
		<main>
		<section id="sec">
			<%-- 		<c:set var="size" value="${fn:length(list)}" />   아작스가 아닌 서블릿방법--%>
			<%-- 		<c:set var="count" value="0" /> --%>
			<%-- 		<c:forEach var="data" items="${list}" begin="1" end="${size}" step="3"> --%>
			<!-- 			<div class="divmain">	 -->
			<%-- 			<c:forEach var="data2" items="${list}" begin="0" end="2" step="1" varStatus="status"> --%>
			<%-- 			<a href="" class="apic"><img class="mainimg" src="${list[count].img}" ></a> --%>
			<%-- 		<c:set var="count" value="${count+1}" /> --%>

			<%-- 			</c:forEach> --%>
			<!-- 			</div> -->
			<%-- 		</c:forEach> --%>
			<div class="default-page">
				<h1 style="font-size: 30px; font-weight: 30">게시물 업로드</h1>
				<br>
				<h4>친구들과 사진 및 글을 공유해 보세요!</h4>
				<br> <a id="uploadbtn"><button class="upload-btn">업로드</button></a>
			</div>
		</section>
		</main>
		<%@include file="common/footer.jsp"%>
	</section>
	<script src="./script.js/insta.js"></script>
</body>
</html>