package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FollowDAO;
import service.FollowService;
import service.FollowServiceImpl;

/**
 * Servlet implementation class InsertFollow
 */
@WebServlet("/follow.do")
public class InsertFollow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FollowDAO dao = new FollowDAO();
		FollowService service = new FollowServiceImpl(dao);
		
		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		
		int target_id = (int)session.getAttribute("id");
		
		try {
			int result = service.insertFollow(Integer.parseInt(id), target_id);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	

}
