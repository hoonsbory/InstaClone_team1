package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FollowDAO;
import dao.UsersDAO;
import service.FollowService;
import service.FollowServiceImpl;
import service.UsersService;
import service.UsersServiceImpl;
import vo.InstaPost;
import vo.UsersVO;

/**
 * Servlet implementation class yourpageServlet
 */
@WebServlet("/search.do")
public class yourpageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			
			UsersDAO dao = new UsersDAO();
			UsersService service = new UsersServiceImpl(dao);
			UsersVO vo = new UsersVO();
			UsersVO user = new UsersVO();
			
			
			int check=0;
			HttpSession session = request.getSession();
			int myid = (int)session.getAttribute("id");
			FollowDAO dao2 = new FollowDAO();
			FollowService service2 = new FollowServiceImpl(dao2);
			try {
				check = service2.checkFollow(myid, id);
				int follower = service2.followernum(id).size();
				int follow = service2.follownum(id).size();
				request.setAttribute("follower", follower);
				request.setAttribute("follow", follow);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		 int count = service.postnum(id);
		 
			request.setAttribute("id", id);
			user = service.profileImg(id);
        	request.setAttribute("img", user.getImg());
        	request.setAttribute("name", user.getName());
        	request.setAttribute("info", user.getInfo());
        	request.setAttribute("count", count);
        	request.setAttribute("check", check);
        	
			getServletContext().getRequestDispatcher("/yourpage.jsp").forward(request, response);
			
	}

}
