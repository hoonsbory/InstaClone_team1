package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import dao.UsersDAO;
import service.UsersService;
import service.UsersServiceImpl;
import vo.UsersVO;

@WebServlet("/passwordEdit.do")
public class PasswordEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login"); // login="id/name"
		int id = Integer.parseInt(login.substring(0, login.lastIndexOf('/')));
		UsersDAO dao = new UsersDAO();
		UsersService service = new UsersServiceImpl(dao);
		UsersVO vo = service.searchUser(id);
		if(BCrypt.checkpw(request.getParameter("past_pw"), vo.getPassword())){
			String pw=request.getParameter("new_pw");
			String hashed=BCrypt.hashpw(pw, BCrypt.gensalt(10));
			vo.setPassword(hashed);
			service.updateUserPassword(vo);
			response.sendRedirect("profile.do");
		}else {
			request.setAttribute("msg", "입력한 이전 비밀번호가 틀립니다.");
			request.getRequestDispatcher("passwordEdit.jsp").forward(request, response);
		}
		
	}

}
