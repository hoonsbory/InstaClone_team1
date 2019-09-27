package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDAO;
import service.UsersService;
import service.UsersServiceImpl;

@WebServlet("/withdraw.do")
public class WithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			String login = (String) session.getAttribute("login"); // login="id/name"
			int id = Integer.parseInt(login.substring(0, login.lastIndexOf('/')));
			UsersDAO dao = new UsersDAO();
			UsersService service = new UsersServiceImpl(dao);
			List<String> list = service.searchUserAllImgs(id);
			// list.forEach(i->System.out.println(i));
			String path = request.getRealPath("/upload/");
			list.forEach((img) -> {
				if (img != null) {
					String fname = img.substring(img.lastIndexOf('/') + 1);
					System.out.println(path+fname);
					File f = new File(path + fname);
					if (f.exists()) {
						f.delete(); // 업로드된 폴더에서 이미지 파일 삭제
					}
				}
			});
			String uimg=service.searchUser(id).getImg();
			if (!uimg.equals("./userpic/default.jpg")) { //디폴트 이미지가 아니면
				String path2 = request.getRealPath("/userpic/");
				String fname2 = uimg.substring(uimg.lastIndexOf('/') + 1);
				File f = new File(path + fname2);
				if (f.exists()) {
					f.delete(); // 업로드된 폴더에서 이미지 파일 삭제
				}
			}

			service.dropUser(id); // 유저 삭제
			session.invalidate(); // 세션공간에서 로그인 정보 삭제
		}
		response.sendRedirect("./login.jsp");
	}

}
