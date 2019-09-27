package servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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

@WebServlet("/profImgChange.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class ProfImgChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("login") != null) {
			String login = (String) session.getAttribute("login"); // login="id/name"
			int id = Integer.parseInt(login.substring(0, login.lastIndexOf('/')));
			UsersDAO dao = new UsersDAO();
			UsersService service = new UsersServiceImpl(dao);
			UsersVO vo = new UsersVO();
			int result = 0;
			String path = request.getRealPath("/userpic/");
			System.out.println(1);
			Collection<Part> parts = request.getParts();
			for (Part p : parts) {
				if (p.getContentType() != null) {
					String fileName = p.getSubmittedFileName();
					System.out.println(2);
					if (fileName != null && fileName.length() != 0
							 || request.getParameter("delete").equals("delete")) { // 프사파일이 선택되었거나 프사 삭제버튼이 눌렸으면
						String pastName = service.searchUser(id).getImg();
						if (!pastName.equals("./userpic/default.png")) {
							String pastImg=pastName.substring(pastName.lastIndexOf('/')+1);
							File f = new File(path + pastImg);
							System.out.println(3);
							if (f.exists()) {
								f.delete(); // 업로드된 폴더에서 기존 프사 삭제
							}
						}
						System.out.println(4);
						String img = "";
						if (fileName.length() != 0) { // 프사 파일이 선택되었으면 새 프사로
							//파일명 중복방지
							//파일명에 날짜시간 붙인다면
//							SimpleDateFormat df = new SimpleDateFormat ( "_yyyyMMdd_HHmmss");
//							Date time = new Date();
//							String time1 = df.format(time);
//							String fileForm=fileName.substring(fileName.lastIndexOf('.'));
//							fileName=fileName.substring(0,fileName.lastIndexOf('.'))+time1+fileForm;
							
							//파일명에 유저번호나 게시글번호 붙인다면(유저번호는 로그인정보로 이미 가진상태)
							String fileForm=fileName.substring(fileName.lastIndexOf('.'));
							String index="_"+id;
							fileName=fileName.substring(0,fileName.lastIndexOf('.'))+index+fileForm;
							
							p.write(path + fileName);
							img = "./userpic/" + fileName;
						} else {// 프사 삭제 버튼이 눌렸으면 기본 프사로
							img = "./userpic/default.png";
						}
						vo.setId(id);
						vo.setImg(img);
						result = service.updateUserImg(vo);
					}
				}
			}
			if (result == 0)
				System.out.println("프사변경실패");
			else
				System.out.println("프사변경성공");

		}
		request.getRequestDispatcher("profile.do").forward(request, response); // 다른 서블릿으로 이동 가능한가?
	}

}
