<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$('#dislike').click(function(){
	$.ajax({
		url : 'like.jsp',
		type : 'get',
		dataType : 'json',
		data : {user_id : user_id,
				post_id : post_id},
		success : ((data)=>{
			if(data.insert==1){
				 $('#like_count').html(data.count);
				 $('#dislike').hide();
				 $('#like').show();
			}
	}),error : ((e)=>{
			alert('실패');	
		})
	})
});
$('#like').click(function(){
	$.ajax({
		url : 'dislike.jsp',
		type : 'get',
		dataType : 'json',
		data : {user_id : user_id,
				post_id : post_id},
		success : ((data)=>{
			if(data.delete1 == 1){
				 $('#like_count').html(data.count);
				 $('#like').hide();
				 $('#dislike').show();
			}
	}),error : ((e)=>{
			alert('실패');	
		})
	})
});

</script>
</head>
<body>


<a href = 'like.jsp' class="like_btn" id="dislike"><img class="like_img" src="https://i.imgur.com/7FQcmdR.png"></a>
<a href = 'dislike.jsp' class="like_btn" id="like"><img class="like_img" src="https://i.imgur.com/3N1sUeC.png"></a>
</body>
</html>