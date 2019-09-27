package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.CommentsDAO;
import service.CommentsService;
import service.CommentsServiceImpl;
import vo.CommentsVO;

@WebServlet("/insertComment.do")
public class InsertCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");  
		
		HttpSession session = request.getSession();
		PrintWriter out=response.getWriter();
		if (session.getAttribute("login") != null) {
			String login = (String) session.getAttribute("login"); // login="id/name"
			int user_id=Integer.parseInt(login.substring(0,login.lastIndexOf('/')));
			int post_id=Integer.parseInt(request.getParameter("post_id"));
			CommentsDAO dao=new CommentsDAO();
			CommentsService service=new CommentsServiceImpl(dao);
			CommentsVO vo=new CommentsVO();
			vo.setUser_id(user_id);
			vo.setPost_id(post_id);

			vo.setContent(request.getParameter("content"));
			int result=0;
			try {
				result=service.insertComment(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result==0) {
				System.out.println("추가 실패");
			}
			String data2=null;
			try {
				data2=service.selectAllComments(post_id);
				out.print(data2);
				out.flush();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			Map<String,String> map=new HashMap<String,String>();
			map.put("msg","로그인이 필요한 서비스입니다.");
			JSONObject obj=new JSONObject(map);
			out.print(obj);
			out.flush();
		}
	}

}
