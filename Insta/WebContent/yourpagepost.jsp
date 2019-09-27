<%@page import="service.PostsServiceimpl"%>
<%@page import="service.PostsService"%>
<%@page import="dao.PostsDAO"%>
<%@page import="service.FollowServiceImpl"%>
<%@page import="service.FollowService"%>
<%@page import="dao.FollowDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String id = request.getParameter("id");
	
	
	PostsDAO dao = new PostsDAO();
	
	PostsService service = new PostsServiceimpl(dao);
	
	
	
    
    
    %>
    
    
    <%=service.getAllPost(Integer.parseInt(id))%>