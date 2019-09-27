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

@WebServlet("/showComment.do")
public class ShowCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		CommentsDAO dao = new CommentsDAO();
		CommentsService service = new CommentsServiceImpl(dao);
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
