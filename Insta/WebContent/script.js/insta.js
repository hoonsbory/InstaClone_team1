/**
 * 
 */

let id1 = "<c:out value='${id}'/>";
$('.search_input').keyup(function(){
	$('#scroll_mid').css('display', 'block');
	$('#shape_mid').css('display', 'block');
	
		$('#divdelete_mid').remove();
		$.ajax({
			url : 'search.jsp',
			type : 'get',
			dataType : 'json',
			data : {id2 : $('.search_input').val().trim()},
			success : ((data)=>{
				if(data.length==0){
					$('#scroll_mid').html('찾는 사용자가 없습니다.');
				}else{
					$('#scroll_mid').html('');
				}
		if($('.search_input').val()!=""){
			let count2 = 0;
			let divSearch2 = document.createElement('div');
		document.querySelector('#scroll_mid').appendChild(divSearch2);
	divSearch2.setAttribute("class" , "divdelete")
	divSearch2.setAttribute("id" , "divdelete_mid")
		for(var i = 1; i<data.length+1; i++){
			let aSearch = document.createElement('a');
			let SearchImg = document.createElement('div');
			let userimg = document.createElement('img');
			let divName = document.createElement('div');
			let divEmail = document.createElement('div');
			let EmailSpan = document.createElement('span');
	userimg.setAttribute("class" , "userimg");
	
	aSearch.setAttribute("class" , "aSearch");
	aSearch.setAttribute("id" , "aSearch"+i);
	aSearch.setAttribute("href" , "search.do?id="+data[count2].id);
	
	SearchImg.setAttribute("id" , "SearchImg"+i)
	SearchImg.setAttribute("class" , "SearchImg")
	divName.setAttribute("class" , "divName")
	divName.setAttribute("id" , "divName"+i)
	divEmail.setAttribute("class" , "divEmail")
	divEmail.setAttribute("id" , "divEmail"+i)
	EmailSpan.setAttribute("class" , "EmailSpan")
	EmailSpan.setAttribute("id" , "EmailSpan"+i)
		document.querySelector('#divdelete_mid').appendChild(aSearch);
	
		document.querySelector('#aSearch'+i).appendChild(SearchImg);
		
		document.querySelector('#aSearch'+i).appendChild(divName);
		$('#divName'+i).html(data[count2].name);
		if(data[count2]!=null){
	userimg.setAttribute("src", data[count2].img);
		}
			
		
		document.querySelector('#SearchImg'+i).appendChild(userimg);
		document.querySelector('#divName'+i).appendChild(divEmail);
		document.querySelector('#divEmail'+i).appendChild(EmailSpan);
		$('#EmailSpan'+i).html(data[count2].email);
		count2++;
		
		}
		}else{
			$('#scroll_mid').hide();
			$('#shape_mid').hide();
		}
		
			}),
			
					error : ((e)=>{
					alert('실패');
			})
			
			
			
		})
		
	
})

$('.like_account').click(()=>{
	$('#scroll_like').css('display', 'block');
	$('#shape_like').css('display', 'block');
	
		$('#divdelete_like').remove();
		$.ajax({
			url : 'likesList.jsp',
			type : 'get',
			dataType : 'json',
			success : ((data)=>{
				if(data.length==0){
					$('#scroll_like').html('기록이 없습니다.');
				}else{
					$('#scroll_like').html('');
				}
		
			let count2 = 0;
			let divSearch2 = document.createElement('div');
		document.querySelector('#scroll_like').appendChild(divSearch2);
	divSearch2.setAttribute("class" , "divdelete")
	divSearch2.setAttribute("id" , "divdelete_like")
		for(var i = 1; i<data.length+1; i++){
			let aSearch = document.createElement('a');
			let SearchImg = document.createElement('div');
			let divImg = document.createElement('div');
			let userimg = document.createElement('img');
			let postimg = document.createElement('img');
			let divName = document.createElement('div');
			let divEmail = document.createElement('div');
			let EmailSpan = document.createElement('span');
	userimg.setAttribute("class" , "userimg");
	postimg.setAttribute("class" , "postimg");
	
	aSearch.setAttribute("class" , "aSearch");
	aSearch.setAttribute("id" , "aSearch_like"+i);
	aSearch.setAttribute("href" , "search.do?id="+data[count2].id);
	
	SearchImg.setAttribute("id" , "SearchImg_like"+i)
	SearchImg.setAttribute("class" , "SearchImg")
	divImg.setAttribute("id" , "divImg"+i)
	divImg.setAttribute("class" , "divImg")
	divName.setAttribute("class" , "divName")
	divName.setAttribute("id" , "divName_like"+i)
	divEmail.setAttribute("class" , "divEmail")
	divEmail.setAttribute("id" , "divEmail_like"+i)
	EmailSpan.setAttribute("class" , "EmailSpan")
	EmailSpan.setAttribute("id" , "EmailSpan_like"+i)
		document.querySelector('#divdelete_like').appendChild(aSearch);
	
		document.querySelector('#aSearch_like'+i).appendChild(SearchImg);
		
		document.querySelector('#aSearch_like'+i).appendChild(divName);
		document.querySelector('#aSearch_like'+i).appendChild(divImg);
		if(data[count2].post!='f'){
		if(data[count2]!=null){
		$('#divName_like'+i).html(data[count2].name+" 님이 회원님의 게시글에 좋아요를 표시했습니다."+"<br>");
	userimg.setAttribute("src", data[count2].img);
	postimg.setAttribute("src", data[count2].post);
		document.querySelector('#SearchImg_like'+i).appendChild(userimg);
		//document.querySelector('#divName_like'+i).appendChild(divEmail);
		document.querySelector('#divName_like'+i).appendChild(EmailSpan);
		$('#EmailSpan_like'+i).html(data[count2].time);
		document.querySelector('#divImg'+i).appendChild(postimg);
		}
			
		
		}else{
			if(data[count2]!=null){
				$('#divName_like'+i).html(data[count2].name+" 님이 회원님을 팔로우 했습니다."+"<br>");
			userimg.setAttribute("src", data[count2].img);
			//postimg.setAttribute("src", data[count2].post);
				document.querySelector('#SearchImg_like'+i).appendChild(userimg);
				//document.querySelector('#divName_like'+i).appendChild(divEmail);
				document.querySelector('#divName_like'+i).appendChild(EmailSpan);
				$('#EmailSpan_like'+i).html(data[count2].time);
				//document.querySelector('#divImg'+i).appendChild(postimg);
				}
			
		}
		count2++;
		
		}
		
		
			}),
			
					error : ((e)=>{
					alert(e);
			})
			
			
			
		})
		
	
})
$('body').click(function(e) { if(!$('#divdelete_mid').hasClass("area")) {  //해당 영역 바깥 클릭 시 이벤트
	
	$('#scroll_mid').hide();
	$('#shape_mid').hide();
} });
$(document).mouseup((e)=>{
	var container = $('.like_account');
	if(container.has(e.target).length ===0)
		$('#scroll_like').hide();
	$('#shape_like').hide();
})
$('#btnEdit').click(()=>{
			$('#frmEdit').submit();
		
	})
	$('#btnEdit2').click(()=>{
			$('#frmlogout').submit();
		
	})	
	
	
	
	
	$('#followlist').click(function(){
		let idnum;
	$('#backfollow').css('display', 'block');
		$.ajax({
			url : 'followlist.jsp',
			type : 'get',
			dataType : 'json',
			success : ((data)=>{
				if(data.length==0){
					$('.followlist_class').html('찾는 사용자가 없습니다.');
				}
				let tag="";
				tag= "<div class= 'headdiv'><div class='leftdiv'></div>" +
						"<h1 class='headmain'><div class='headfont'>팔로잉" +
						"</div></h1>" +
						"<div class='rightdiv'>" +
						"<button class='realbtn'><span class='lastspan' aria-lable='닫기'></span></button></div></div>";
				$('.followlist_class').html(tag);
				
				$('.realbtn').click(()=>{
					$('#backfollow').css('display', 'none');
					
					
				})
			let count2 = 0;
		for(var i = 1; i<data.length+1; i++){
			let aSearch = document.createElement('a');
			let centerdiv = document.createElement('div');
			let SearchImg = document.createElement('div');
			let userimg = document.createElement('img');
			let divName = document.createElement('div');
			let divEmail = document.createElement('div');
			let EmailSpan = document.createElement('span');
			let fbtn2 = document.createElement('button');
			let fbtn1 = document.createElement('button');
	userimg.setAttribute("class" , "userimg");
	fbtn2.setAttribute("class" , "profile-edit-btn2");
	fbtn2.setAttribute("id" , "follow-btn0"+i);
	fbtn2.setAttribute("onclick" , "ufbtn2("+data[count2].id+","+i+")");
	fbtn1.setAttribute("class" , "profile-edit-btn3");
	fbtn1.setAttribute("id" , "follow-btn1"+i);
	fbtn1.setAttribute("onclick" , "fbtn2("+data[count2].id+","+i+")");
	fbtn1.setAttribute("style" , "display:none");
	fbtn2.setAttribute("style" , "display:none");
	
	
	centerdiv.setAttribute("class" , "centerdiv");
	centerdiv.setAttribute("id" , "centerdiv"+i);
	aSearch.setAttribute("class" , "aSearchf");
	aSearch.setAttribute("id" , "aSearch"+i);
	
	
	SearchImg.setAttribute("id" , "SearchImg"+i)
	SearchImg.setAttribute("class" , "SearchImg")
	divName.setAttribute("class" , "divName")
	divName.setAttribute("onclick" , "location.href='search.do?id="+data[count2].id+"'");

	divName.setAttribute("id" , "divName"+i)
	divEmail.setAttribute("class" , "divEmail")
	divEmail.setAttribute("id" , "divEmail"+i)
	EmailSpan.setAttribute("class" , "EmailSpan")
	EmailSpan.setAttribute("id" , "EmailSpan"+i)
		document.querySelector('.followlist_class').appendChild(centerdiv);
	
	document.querySelector('#centerdiv'+i).appendChild(aSearch);
	document.querySelector('#centerdiv'+i).appendChild(fbtn2);
	document.querySelector('#centerdiv'+i).appendChild(fbtn1);
		document.querySelector('#aSearch'+i).appendChild(SearchImg);
		
		document.querySelector('#aSearch'+i).appendChild(divName);
		$('#divName'+i).html(data[count2].name);
		$('.profile-edit-btn2').html('팔로잉');
		$('.profile-edit-btn3').html('팔로우');
		if(data[count2]!=null){
	userimg.setAttribute("src", data[count2].img);
		}
			
		
		document.querySelector('#SearchImg'+i).appendChild(userimg);
		document.querySelector('#divName'+i).appendChild(divEmail);
		document.querySelector('#divEmail'+i).appendChild(EmailSpan);
		$('#EmailSpan'+i).html(data[count2].email);
		
		
			
		
		
		idnum = data[count2].id;
		count2++;
		$.ajax({
			url : 'followcheck.jsp',
			type : 'get',
			dataType : 'json',
			data : {"yourid" : idnum},
			success : ((data1)=>{
				if(data1==1){
					$('.profile-edit-btn3').hide();
					$('.profile-edit-btn2').show();
				}else{
					$('.profile-edit-btn2').hide();
					$('.profile-edit-btn3').show();
				}
			}),
			error : ((e)=>{
				
			})

			})
		
		}
		

			}),
			
					error : ((e)=>{
					alert('실패');
			})
			
			
			
		})
		
	
})
$('#followerlist').click(function(){
		let idnum;
	$('#backfollower').css('display', 'block');
		$.ajax({
			url : 'followerlist.jsp',
			type : 'get',
			dataType : 'json',
			success : ((data)=>{
				if(data.length==0){
					$('.followerlist_class').html('찾는 사용자가 없습니다.');
				}
				let tag="";
				tag= "<div class= 'headdiv'><div class='leftdiv'></div>" +
						"<h1 class='headmain'><div class='headfont'>팔로워" +
						"</div></h1>" +
						"<div class='rightdiv'>" +
						"<button class='realbtn'><span class='lastspan' aria-lable='닫기'></span></button></div></div>";
				$('.followerlist_class').html(tag);
				
				$('.realbtn').click(()=>{
					$('#backfollower').css('display', 'none');
					
					
				})
			let count2 = 0;
		for(var i = 1; i<data.length+1; i++){
			let aSearch = document.createElement('a');
			let SearchImg = document.createElement('div');
			let userimg = document.createElement('img');
			let divName = document.createElement('div');
			let divEmail = document.createElement('div');
			let EmailSpan = document.createElement('span');
			let fbtn2 = document.createElement('button');
			let fbtn1 = document.createElement('button');
	userimg.setAttribute("class" , "userimg");
	fbtn2.setAttribute("class" , "profile-edit-btn2");
	fbtn2.setAttribute("id" , "follow-btn2"+i);
	fbtn2.setAttribute("onclick" , "ufbtn("+data[count2].id+","+i+")");
	fbtn1.setAttribute("class" , "profile-edit-btn3");
	fbtn1.setAttribute("id" , "follow-btn3"+i);
	fbtn1.setAttribute("onclick" , "fbtn("+data[count2].id+","+i+")");
	fbtn1.setAttribute("style" , "display:none");
	fbtn2.setAttribute("style" , "display:none");
	
	
	aSearch.setAttribute("class" , "aSearch");
	aSearch.setAttribute("id" , "aSearch2"+i);
	aSearch.setAttribute("href" , "search.do?id="+data[count2].id);
	
	SearchImg.setAttribute("id" , "SearchImg2"+i)
	SearchImg.setAttribute("class" , "SearchImg")
	divName.setAttribute("class" , "divName")
	divName.setAttribute("id" , "divName2"+i)
	divEmail.setAttribute("class" , "divEmail")
	divEmail.setAttribute("id" , "divEmail2"+i)
	EmailSpan.setAttribute("class" , "EmailSpan")
	EmailSpan.setAttribute("id" , "EmailSpan2"+i)
		document.querySelector('.followerlist_class').appendChild(aSearch);
	
	document.querySelector('.followerlist_class').appendChild(fbtn2);
	document.querySelector('.followerlist_class').appendChild(fbtn1);
		
		document.querySelector('#aSearch2'+i).appendChild(SearchImg);
		
		document.querySelector('#aSearch2'+i).appendChild(divName);
		$('#divName2'+i).html(data[count2].name);
		$('.profile-edit-btn2').html('팔로잉');
		$('.profile-edit-btn3').html('팔로우');
		if(data[count2]!=null){
	userimg.setAttribute("src", data[count2].img);
		}
			
		
		document.querySelector('#SearchImg2'+i).appendChild(userimg);
		document.querySelector('#divName2'+i).appendChild(divEmail);
		document.querySelector('#divEmail2'+i).appendChild(EmailSpan);
		$('#EmailSpan2'+i).html(data[count2].email);
		
		
			
		
		
		idnum = data[count2].id;
		count2++;
		$.ajax({
			url : 'followcheck.jsp',
			type : 'get',
			dataType : 'json',
			data : {"yourid" : idnum},
			success : ((data1)=>{
				if(data1==1){
					$('.profile-edit-btn3').hide();
					$('.profile-edit-btn2').show();
				}else{
					$('.profile-edit-btn2').hide();
					$('.profile-edit-btn').show();
				}
			}),
			error : ((e)=>{
				
			})

			})
		
		}
		

			}),
			
					error : ((e)=>{
					alert('실패');
			})
			
			
			
		})
		
	
})

	function fbtn(va,num){
			$.ajax({
				url : 'follow2.jsp',
				type : 'get',
				dataType : 'json',
				data : {yourid : va ,
						
				},
				
				success : ((data)=>{
					if(data.insert==1){
						 $('#follower').html(data.follow);
						 $('#follow-btn3'+num).hide();
						 $('#follow-btn2'+num).show();
						
					}
			}),
				error : ((e)=>{
					alert(e);
					
				})
			
			})
}
function ufbtn(va,num){
	$.ajax({
			url : 'unfollow2.jsp',
			type : 'get',
			dataType : 'json',
			data : {yourid : va
					
			},
			
			success : ((data)=>{
				if(data.delete1==1){
					 $('#follower').html(data.follow);
					 $('#follow-btn2'+num).hide();
					 $('#follow-btn3'+num).show();
				}
		}),
			error : ((e)=>{
				alert('실팽');
				
			})
		
		})
}
function fbtn2(va,num){
	$.ajax({
		url : 'follow2.jsp',
		type : 'get',
		dataType : 'json',
		data : {yourid : va ,
				
		},
		
		success : ((data)=>{
			if(data.insert==1){
				 $('#follower').html(data.follow);
				 $('#follow-btn1'+num).hide();
				 $('#follow-btn0'+num).show();
				
			}
	}),
		error : ((e)=>{
			alert(e);
			
		})
	
	})
}
function ufbtn2(va,num){
$.ajax({
	url : 'unfollow2.jsp',
	type : 'get',
	dataType : 'json',
	data : {yourid : va
			
	},
	
	success : ((data)=>{
		if(data.delete1==1){
			 $('#follower').html(data.follow);
			 $('#follow-btn0'+num).hide();
			 $('#follow-btn1'+num).show();
		}
}),
	error : ((e)=>{
		alert('실팽');
		
	})

})
}