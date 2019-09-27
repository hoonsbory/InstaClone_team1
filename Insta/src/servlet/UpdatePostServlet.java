package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PostsDAO;
import service.PostsService;
import service.PostsServiceimpl;
import vo.PostsVO;

@WebServlet("/updatePost.do")
public class UpdatePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8"); 
        
        HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			int user_id=(int)session.getAttribute("id");
			PostsDAO dao=new PostsDAO();
			PostsService service=new PostsServiceimpl(dao);
			PostsVO vo=new PostsVO();
			int id=Integer.parseInt(request.getParameter("post_id"));
			String content=request.getParameter("post_content");
			vo.setId(id);
			vo.setContent(content);
			int result=service.updatePosts(vo);
			if(result==0)
				System.out.println("수정 실패");
			response.sendRedirect("showPost.do?post_id="+id);
		}
	}

}
