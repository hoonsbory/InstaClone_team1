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
import javax.websocket.Session;

import org.mindrot.jbcrypt.BCrypt;

import dao.FollowDAO;
import dao.UsersDAO;
import service.FollowService;
import service.FollowServiceImpl;
import service.UsersService;
import service.UsersServiceImpl;
import vo.InstaPost;
import vo.UsersVO;

 @WebServlet({"/home.do"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			                                      throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8"); 
		
		UsersDAO dao = new UsersDAO();
		UsersService service = new UsersServiceImpl(dao);
		
		
		HttpSession session = request.getSession();
		 int id = (int) session.getAttribute("id");
		UsersVO vo = new UsersVO();
        UsersVO user = new UsersVO();
        FollowDAO dao3 = new FollowDAO();
		FollowService service3 = new FollowServiceImpl(dao3);
		  try {
				int followernum = service3.followernum(id).size();
				int follownum = service3.follownum(id).size();
				System.out.println(follownum);
				request.setAttribute("follower", followernum);
	        	request.setAttribute("follow", follownum);
			} catch (Exception e) {
				e.printStackTrace();
			}
       
        	
        	int count = service.postnum(id); //포스트갯수
        	user = service.profileImg(id); //프로필 부분 db
        	request.setAttribute("img", user.getImg());	//프로필부분 db가져오기
        	request.setAttribute("name", user.getName());
        	request.setAttribute("info", user.getInfo());
        	request.setAttribute("count", count);
			request.getRequestDispatcher("/mypage.jsp").forward(request, response);
        	
        
	}
}