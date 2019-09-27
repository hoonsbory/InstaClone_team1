<%@page import="java.lang.Object"%>
<%@page import="service.FollowServiceImpl"%>
<%@page import="service.FollowService"%>
<%@page import="dao.FollowDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="service.LikesServiceimpl"%>
<%@page import="service.LikesService"%>
<%@page import="dao.LikesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    int id = (int)session.getAttribute("id");

    
    LikesDAO dao = new LikesDAO();
    LikesService service = new LikesServiceimpl(dao);
	
	
    %>
	
	<%=service.selectLikes(id)%>