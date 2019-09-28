<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/profile.css?after">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/search&like.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	
window.onload = function(){
	var myid = <%=(int)session.getAttribute("id")%>;
	let check = "<c:out value='${check}'/>";
	if(check==1){
		$('#follow-btn').hide();
	}else{
		$('#follow-btn2').hide();
	}
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
							a.setAttribute("href" , "showPost.do?id="+data[count].postid);
							
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
	
	
	$('#follow-btn2').click(function(){
		$.ajax({
			url : 'unfollow.jsp',
			type : 'get',
			dataType : 'json',
			data : {yourid : id1 ,
					myid : myid},
			
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
	}
)
	$('#follow-btn').click(function(){
		$.ajax({
			url : 'follow.jsp',
			type : 'get',
			dataType : 'json',
			data : {yourid : id1 ,
					myid : myid},
			
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
	}
)







	}
</script>
<style type="text/css">
.mainimg:hover {
	opacity: 0.5;
}
#btnEdit2{
	background:  #3897f0 !important;
	color: white !important;
}

.apic{
	display: inline !important;
	margin-right: 28px;
}
.divmain{
	display: inline-block !important;
	position: relative;
	left : 20%;
	margin-bottom: 28px;
}
.mainimg{
	display: inline;
	width: 300px;
	height: 300px;
}
.section1{
	margin-top: 30px;
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
				
					<img id="profileImage" src="${img}"
						title="default-profile.png" style="width:150px ;height:150px;"/>
						 <input id="imageUpload"
						type="file" name="profile_photo" placeholder="Photo" >
						
					
				</div>
				<div class="profile-user">
				<div class="profile-user-settings">

					<a class="profile-user-name">${name}</a>

					<%-- <form action="follow.do">
						<input type="hidden" name="id" value="${id}">
					<input type="submit" class="follow-btn" value="팔로우">
					</form> --%>
					<button class="btn profile-edit-btn" id="follow-btn" >팔로우</button>
					<button class="btn profile-edit-btn" id="follow-btn2" >팔로잉</button>


				</div>
				<div class="profile-stats">

					<ul>
						<li><span class="profile-stat-count">${count}</span> 게시글</li>
						<li><span class="profile-stat-count" id="follower">${follower}</span> 팔로워</li>
						<li><span class="profile-stat-count" id="following">${follow}</span> 팔로잉</li>
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


	<section class="section1">
		<main>
		<section id="sec">
		<%-- <c:set var="size" value="${fn:length(list)}" />
		<c:set var="count" value="0" />
		<c:forEach var="data" items="${list}" begin="1" end="${size}" step="3">
			<div class="divmain">	
			<c:forEach var="data2" items="${list}" begin="0" end="2" step="1" varStatus="status">
			<a href="" class="apic"><img class="mainimg" src="${list[count].img}" ></a>
		<c:set var="count" value="${count+1}" />
			
			</c:forEach>
			</div>
		</c:forEach> --%>
		</section>
		</main>
		<%@include file="common/footer.jsp"%>
	</section>
	<script src="./script.js/insta.js"></script>
</body>
</html>