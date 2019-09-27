<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="service.LikesServiceimpl"%>
<%@page import="service.LikesService"%>
<%@page import="dao.LikesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    
    LikesDAO dao = new LikesDAO();
    LikesService service = new LikesServiceimpl(dao);
    
    
    int user_id = Integer.parseInt(request.getParameter("user_id"));
    int post_id = Integer.parseInt(request.getParameter("post_id"));
    
 
   int delete = service.deleteLikes(post_id, user_id);
   int count = service.countLikes(post_id).size();
   
   	JSONObject obj = new JSONObject();
	obj.put("count", count);
	obj.put("delete1", delete);
   
%>
    
    
<%=obj%>