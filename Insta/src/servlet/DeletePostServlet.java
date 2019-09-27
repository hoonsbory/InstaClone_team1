package servlet;

import java.io.File;
import java.io.IOException;
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

@WebServlet("/deletePost.do")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8"); 
        
        HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			int user_id=(int)session.getAttribute("id");
			String pastName=request.getParameter("img");
			String delImg=pastName.substring(pastName.lastIndexOf('/')+1);
			String path = request.getRealPath("/upload/");
			File f = new File(path + delImg);
			if (f.exists()) {
				f.delete(); // 업로드된 폴더에서 사진 삭제
			}	
			
			PostsDAO dao=new PostsDAO();
			PostsService service=new PostsServiceimpl(dao);
			int id=Integer.parseInt(request.getParameter("post_id"));
			int result=service.deletePosts(id);
			if(result==0)
				System.out.println("삭제 실패");
			response.sendRedirect("home.do");
		}
	}

}
