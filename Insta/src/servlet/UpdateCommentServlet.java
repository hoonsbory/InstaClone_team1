package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.CommentsDAO;
import service.CommentsService;
import service.CommentsServiceImpl;
import vo.CommentsVO;

@WebServlet("/updateComment.do")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		CommentsDAO dao = new CommentsDAO();
		CommentsService service = new CommentsServiceImpl(dao);
		CommentsVO vo = new CommentsVO();
		String data = request.getParameter("id");
		int id = Integer.parseInt(data.substring(data.lastIndexOf('_') + 1));
		vo.setId(id);
		vo.setContent(request.getParameter("content"));
		int result = 0;
		try {
			result = service.updateComment(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result == 0) {
			System.out.println("수정 실패");
		}
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		String data2 = null;
		try {
			data2 = service.selectAllComments(post_id);
			out.print(data2);
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
