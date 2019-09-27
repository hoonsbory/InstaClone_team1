<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id2");
	
	HttpSession session2 = request.getSession();
	
	int id2 = (int)session2.getAttribute("id");
	
	UsersDAO dao = new UsersDAO(); 
	
	
	
	
    
    
    %>
    
     <%=dao.searchusers(id2,id)%>