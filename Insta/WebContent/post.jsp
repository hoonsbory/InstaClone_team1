<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/post.css">
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/footer.css">
<link rel="stylesheet" href="css/search&like.css">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style type="text/css">
.cDels {
	float: right;
	background-color: rgba(255, 255, 255, 0);
	border: none;
}
.commentName {
	font-weight: bold;
	margin: 5px;
}
#like {
	float: left;
	margin-left: 10px;
	display: inline;
	height: 30px;
}
#like img {
	display: inline;
	vertical-align: baseline;
}
#like span {
	width: 100px;
	display: inline;
	vertical-align: 9px;
}
.form-inline {
	clear: both;
	text-align: center;
	display: block;
	margin: 0 auto;
}
.form-group2 {
	display: inline;
	margin-top: 5px;
	margin-bottom: 5px;
}
.form-control {
	width: 100% !important;
}
#post_info {
	display: block;
	margin-top: 15px;
}
.this_user, .commenterImage, .commentName {
	cursor: pointer;
}
.userImage, .user-name{
	margin-top: 15px;
}
#next_left {
	-webkit-transform: scaleX(-1);
	-moz-transform: scaleX(-1);
	-o-transform: scaleX(-1);
	transform: scaleX(-1);
	filter: FlipH;
	-ms-filter: "FlipH";
	left: 20px;
}
#next_right {
	right: 20px;
}
.next {
	width: 50px;
	position: fixed;
	top: 320px;
	cursor: pointer;
}
#dot_menu {
	position: absolute;
	right: 20px;
	top: 10px;
	cursor: pointer;
}
#dot_menu_opt {
	background-color: rgba(0, 0, 0, .5);
	bottom: 0;
	left: 0;
	position: fixed;
	right: 0;
	top: 0;
	z-index: 1;
	visibility: hidden;
	vertical-align: middle;
}
#dot_menu_opt>div{
	border-radius: 20px;
	margin: 0 auto;
	text-align: center;
	vertical-align: middle;
	background-color: white;
}
#optBox {
	width: 300px;
	height: 200px;
	margin-top: 18% !important;
}
#updateBox {
	width: 450px;
	height: 250px;
	margin-top: 17% !important;
	display: none;
	cursor: pointer;
}
#optBox>h4 {
	padding: 25px;
}
#delete {
	font-size: 12pt;
	font-weight: bold;
	color: #ff3300;
	cursor: pointer;
	border-top: 1px solid gray;
}
#update {
	font-size: 12pt;
	font-weight: bold;
	color: #3399ff;
	cursor: pointer;
}
#cancel {
	font-size: 12pt;
	font-weight: bold;
	cursor: pointer;
	border-top: 1px solid gray;
}
#updateBox>div {
	border-top: 1px solid gray;
	margin-top: 5.9%;
	margin-bottom: 5%;
	display: block;
}
#updateBox>div>h4{
	display: inline;
	width: 50%;
	float: left;
	padding-top: 20px;
	padding-bottom: 20px;
	font-size: 12pt;
	font-weight: bold;
	cursor: pointer;
}
#up_submit{
	border-right: 1px solid gray;
	color: #3399ff;
}
#post_content{
	margin-top: 6.8%;
	margin-bottom: 0;
	margin-right: 1%;
	height: 130px;
	width: 80%;
}
.like_img {
	cursor: pointer;
	display: none;
}
#date {
	position: absolute;
	right: 10px;
	bottom: -22px;
	color: gray;
}
#form_button {
	padding: 5px;
	color: #3399ff;
	font-weight: bold;
}
</style>
<script type="text/javascript">
$(function(){
	showComm();
	setLike();
	showUpdatePost();
	setFollow();
	follow();
	
	if(${empty login}){
		$('.form-control').attr('placeholder','로그인 후 이용 가능합니다.');
		$('.form-control').focus(function(){
			location.href="login.jsp";
		});
	}
	if('${beside.past_id}'=='-1'){
		$('#next_left').hide();
	}
	if('${beside.next_id}'=='-1'){
		$('#next_right').hide();
	}
	
	$('.this_user').click(thisUserPage);
	
	$('#next_left').click(function(){
		location.href="showPost.do?post_id=${beside.past_id}";
	});
	$('#next_right').click(function(){
		location.href="showPost.do?post_id=${beside.next_id}";
	});
	$('#dot_menu').click(function(){
		$('#dot_menu_opt').css('visibility', 'visible');
	});
	$('#delete').click(function() {
		if (confirm('삭제하시겠습니까?')) {
			location.href="deletePost.do?post_id=${post.post_id}&img=${post.post_img}";
		}
	});
	$('#update').click(function(){
		$('#updateBox').css('display', 'block');
		$('#optBox').css('display', 'none');
	});
	
	$('.cancel').click(cancelButton);
	
	$('#up_submit').click(updatePost);
	
	$('#post_content').keyup(countPost);
	
});
function setFollow(){
	let check = '${check}';
	if(check==1){
		$('#follow-btn').hide();
	}else{
		$('#follow-btn2').hide();
	}
}
function follow(){
	$('#follow-btn2').click(function(){
		$.ajax({
			url : 'unfollow.jsp',
			type : 'get',
			dataType : 'json',
			data : {yourid : ${post.user_id} ,
					myid : ${id}
			},
			
			success : ((data)=>{
				if(data.delete1==1){
					 $('#follower').html(data.follower);
					 $('#follow-btn2').hide();
					 $('#follow-btn').show();
				}
		}),
			error : ((e)=>{
				alert('실팽');
				
			})
		
		})
	});
	
	$('#follow-btn').click(function(){
		$.ajax({
			url : 'follow.jsp',
			type : 'get',
			dataType : 'json',
			data : {yourid : ${post.user_id} ,
					myid : ${id}
			},
			
			success : ((data)=>{
				if(data.insert==1){
					 $('#follower').html(data.follower);
					 $('#follow-btn').hide();
					 $('#follow-btn2').show();
					
				}
		}),
			error : ((e)=>{
				alert(e);
				
			})
		
		})
	});
}
function cancelButton(){
	$('#dot_menu_opt').css('visibility', 'hidden');
	$('#updateBox').css('display', 'none');
	$('#optBox').css('display', 'block');
	showUpdatePost();
    $('#textCount').text($('#post_content').val().length+'/150');
}
function thisUserPage(){
	if('${post.user_id}'=='${id}'){
    	location.href="home.do";
     }
     else{
	 	 location.href="search.do?id=${post.user_id}";
     }
}
function updatePost(){
	let str = $("#post_content").val();
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br />'); //엔터 처리
    $("#post_content").val(str);
	$('#updateForm').submit();
}
function showUpdatePost(){
	let str = '${post.post_content}';
	str = str.replace(/<br\s*\/?>/img, '\n');
	$("#post_content").val(str);
}
function countPost(){
	 let textLength = $(this).val().length;
     $('#textCount').text(textLength+'/150');
     if (textLength > 150) {
         $(this).val($(this).val().substr(0, 150));
     }
}
function setLike(){
	$('#dislike_btn').click(function(){
		if(${!empty login}){
		$.ajax({
			url : 'like.jsp',
			type : 'get',
			dataType : 'json',
			data : {user_id : '${id}',
					post_id : '${post.post_id}'},
			success : function(data){
				if(data.insert==1){
					$('#like_num').html('좋아요 '+data.count+'개');
					 $('#dislike_btn').hide();
					 $('#like_btn').show();
				}
			},
			error : function(e){
				alert('실패');	
			}
		});
		}
	});
	$('#like_btn').click(function(){
		$.ajax({
			url : 'dislike.jsp',
			type : 'get',
			dataType : 'json',
			data : {user_id : '${id}',
					post_id : '${post.post_id}'},
			success : function(data){
				if(data.delete1==1){
					$('#like_num').html('좋아요 '+data.count+'개');
					$('#like_btn').hide();
					$('#dislike_btn').show();
				}
			},
			error : function(e){
				alert('실패');	
			}
		});
	});
}
function showComm(){
	$.ajax(
			{
				 url:'showComment.do',
				 type:'get',
				 dataType:'json',
				 data: {post_id:${post.post_id}},
				 success:function(data){
					if(data.msg!=undefined){
						//location.href="login.jsp?msg="+data.msg;
						$('#msg').val(data.msg);
						$('#hidden_form').submit();
					} else
						display(data);
				 },
				 error:function(error){
					 alert("error "+error.name);
				 }
			 }		
	);
	if('${mylike}'==0){
		$('#like_btn').hide();
		$('#dislike_btn').show();
	}else{
		$('#dislike_btn').hide();
		$('#like_btn').show();
	}
}
function insComm(){
	if($('#form-comment').val().length>100){
		alert('100자 이하로 입력하세요');
	} else{
	$.ajax(
			{
				 url:'insertComment.do',
				 type:'post',
				 dataType:'json',
				 data:{content:$('#form-comment').val(),post_id:${post.post_id}},
				 success:function(data){
					if(data.msg!=undefined){
						//location.href="login.jsp?msg="+data.msg;
						$('#msg').val(data.msg);
						$('#hidden_form').submit();
					} else{
						//alert('추가되었습니다.');
						display(data);
					}
				 },
				 error:function(error){
					 alert("error "+error.name);
				 }
			 }		
	);
	$('#form-comment').val('');
	}
}
function delComm(delId){
	$.ajax(
			{
				 url:'deleteComment.do',
				 type:'post',
				 dataType:'json',
				 data: {id:delId,post_id:${post.post_id}},
				 success:function(data){
					if(data.msg!=undefined){
						//location.href="login.jsp?msg="+data.msg;
						$('#msg').val(data.msg);
						$('#hidden_form').submit();
					} else{
						//alert('삭제되었습니다.');
						display(data);
					}
				 },
				 error:function(error){
					 alert("error "+error.name);
				 }
			 }		
	);
}
function display(data){
	let tag = "";
	let login_id='${fn:substringBefore(login,"/")}';
	$(data).each((i,item)=>{
		 tag += "<li id='c_"+item.id+"'><div class='commenterImage' id='i_"+item.id+"'>";
	     tag += "<img src='"+item.img+"'/></div>";
	     tag += "<div class='commentText'><p><span class='commentName' id='n_"+item.id+"'>";
	     tag += item.name+"</span><span class=''>"+item.content+"</span>";
	     if(item.user_id==login_id||'${post.user_id}'==login_id){
	     	tag += "<button class='cDels'><img src='img/delete-x.png' width=6 height=6></button>";
	     }
		 tag += "</p><span class='date sub-text'>";
	     tag += item.timestamp.substring(0,item.timestamp.length-4)+"</span></div></li>";	 	
	     	
	});
	$('.commentList').html(tag);
	$(data).each((i,item)=>{
		if(item.user_id==login_id){
	    	$('#i_'+item.id).click(function(){
	    		location.href="home.do";
	 	 	});	 	
	 	 	$('#n_'+item.id).click(function(){
	 	 		location.href="home.do";
	 	 	});
	     }
	     else{
	    	 $('#i_'+item.id).click(function(){
		 	 	location.href="search.do?id="+item.user_id;
		 	 });	 	
		 	 $('#n_'+item.id).click(function(){
		 	 	location.href="search.do?id="+item.user_id;
		 	 });
	     }
	});
	$('.cDels').each((i,item)=>{
		$(item).click(function(){
			delComm($(item.parentNode.parentNode.parentNode).attr('id'));
		});
	});
	$(".commentList").scrollTop($(".commentList")[0].scrollHeight);
	
	
}
</script>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<img class="next" id="next_left" src="img/next2.png">
	<section id="sect">
		<header>
			<span class="this_user"> <span class="userImage"> <img
					src="${post.user_img}" width=50 height=50 />
			</span> <span class="user-name">${post.user_name}</span>
			</span>
			<c:if test='${post.user_id ne id}'>
				<button class="btn profile-edit-btn" id="follow-btn" >팔로우</button>
				<button class="btn profile-edit-btn" id="follow-btn2" >팔로잉 중</button>
			</c:if>
		</header>

		<div class="container">
			<div class="uploadimage">
				<img id="uploadimage_img" alt="" src="${post.post_img}">
			</div>


			<div class="detailBox">
				<c:if test='${post.user_id eq id}'>
					<img class="" id="dot_menu" src="img/three-dots.png" width="20">
				</c:if>
				<div class="commentBox">
					<p class="taskDescription">${post.post_content}</p>
				</div>
				<div class="titleBox">
					<label>댓글</label>
				</div>
				<div class="actionBox">
					<ul class="commentList">
					</ul>
				</div>
				<div id="post_info">
					<div id="like">
						<img class="like_img" id="dislike_btn"
							src="https://i.imgur.com/7FQcmdR.png" width=30 height=25> <img
							class="like_img" id="like_btn"
							src="https://i.imgur.com/3N1sUeC.png" width=30 height=28> <span
							id="like_num">좋아요 ${like}개</span>
					</div>
					<div id="date">
						${fn:substring(post.post_timestamp,0,fn:length(post.post_timestamp)-4)}</div>
				</div>
				<div class="form-inline">
					<div class="form-group2">
						<input class="form-control" id="form-comment" type="text"
							placeholder="Your comments" pattern=".{,100}" />
					</div>
					<div class="form-group2">
						<button class="btn btn-default" id="form_button"
							onclick="insComm()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="dot_menu_opt">
		<div id="optBox">
			<h4 id="update">수정</h4>
			<h4 id="delete">삭제</h4>
			<h4 class="cancel" id="cancel">취소</h4>
		</div>
		<div id="updateBox">
			<form action="updatePost.do" method="post" id="updateForm">
				<textarea form="updateForm" id="post_content" name="post_content"></textarea>
				<span id="textCount">${fn:length(post.post_content)}/150</span>
				<input type="hidden" name="post_id" value="${post.post_id}">
			</form>
			<div>
				<h4 id="up_submit">확인</h4>
				<h4 class="cancel" id="up_cancel">취소</h4>
			</div>
		</div>
	</div>
	<form style="visibility: hidden" action="login.jsp" method="post"
		id="hidden_form">
		<input type="hidden" id="msg" name="msg" value="">
	</form>
	<img class="next" id="next_right" src="img/next2.png">
	<%@include file="common/footer.jsp"%>
<script src="./script.js/insta.js"></script>
</body>
</html>