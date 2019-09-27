package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import dao.UsersDAO;
import service.UsersService;
import service.UsersServiceImpl;
import vo.UsersVO;

@WebServlet("/signUp.do")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String email=request.getParameter("email2");
		String pw=request.getParameter("pw2");
		String hashed=BCrypt.hashpw(pw, BCrypt.gensalt(10));
		String name=request.getParameter("name");
		
		UsersDAO dao=new UsersDAO();
		UsersService service=new UsersServiceImpl(dao);
		UsersVO vo=new UsersVO(email,hashed,name);
		int result=service.addUser(vo);
		if(result==0) {
			request.setAttribute("msg", "이미 가입된 이메일입니다.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		response.sendRedirect("./login.jsp");
		
	}

}
