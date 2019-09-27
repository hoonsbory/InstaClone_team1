<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="service.FollowServiceImpl"%>
<%@page import="service.FollowService"%>
<%@page import="dao.FollowDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    FollowDAO dao = new FollowDAO();
    FollowService service = new FollowServiceImpl(dao);
    
    
    int myid = (int)session.getAttribute("id");
    int yourid = Integer.parseInt(request.getParameter("yourid"));
    
 
   int insert = service.insertFollow(myid, yourid);
    int follow = service.follownum(myid).size();
   
   JSONObject obj = new JSONObject();
	obj.put("follow", follow);
	obj.put("insert", insert);
   
    %>
    
    
	<%=obj%>
    