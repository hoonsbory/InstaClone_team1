<%@page import="service.FollowServiceImpl"%>
<%@page import="service.FollowService"%>
<%@page import="dao.FollowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	HttpSession session2 = request.getSession();
	
	int myid = (int)session2.getAttribute("id");
	
	FollowDAO dao = new FollowDAO();
	FollowService service = new FollowServiceImpl(dao);
	
    %>
    
     <%=service.followList(myid)%>