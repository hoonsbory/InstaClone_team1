package servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.UsersDAO;
import service.UsersService;
import service.UsersServiceImpl;
import vo.UsersVO;

@WebServlet("/profileEdit.do")
public class ProfileEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { // 개인정보변경
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login"); // login="id/name"
		int id = Integer.parseInt(login.substring(0, login.lastIndexOf('/')));
		UsersDAO dao = new UsersDAO();
		UsersService service = new UsersServiceImpl(dao);
		UsersVO vo = new UsersVO();
		int result = 0;
		vo.setId(id);
		vo.setEmail(request.getParameter("email"));
		vo.setName(request.getParameter("name"));
		vo.setInfo(request.getParameter("info"));
		result = service.updateUserEmailNameInfo(vo);
		if (result == 0) {
			request.setAttribute("msg", "이미 가입된 이메일입니다.");
		}
		request.getRequestDispatcher("profile.do").forward(request, response);

	}

}
