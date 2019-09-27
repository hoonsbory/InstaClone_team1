package servlet;

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

import dao.FollowDAO;
import dao.PostsDAO;
import dao.UsersDAO;
import service.FollowService;
import service.FollowServiceImpl;
import service.PostsService;
import service.PostsServiceimpl;
import service.UsersService;
import service.UsersServiceImpl;
import vo.InstaPost;
import vo.PostsVO;
import vo.UsersVO;

@WebServlet("/insertPost.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class insertPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		PostsDAO dao = new PostsDAO();
		PostsVO post = new PostsVO();
		UsersDAO dao2 = new UsersDAO();
		UsersVO user = new UsersVO();
		UsersService service = new UsersServiceImpl(dao2);
		PostsService service2=new PostsServiceimpl(dao);
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("id");
		post.setContent(request.getParameter("content"));
		post.setUser_id(id);

		String path = request.getRealPath("/upload/");

		Collection<Part> parts = request.getParts();

		for (Part p : parts) {
			if (p.getContentType() != null) {
				String filename = p.getSubmittedFileName();
				if (filename != null && filename.length() != 0) {
					//파일명_postid하고 싶었으나 지금 insert할 postid는 dao에서 sql구문으로 자동으로 들어가고있으므로
					//postid를 알려면 db를 따로 접근해서 현재 max postid가져와야함(비효율적)
					//따라서 다른 방법 쓰기로함
					String fileForm=filename.substring(filename.lastIndexOf('.'));
					String index="_"+id;
					SimpleDateFormat df = new SimpleDateFormat("_yyyyMMdd_HHmmss");
					Date time = new Date();
					String time1 = df.format(time);
					filename=filename.substring(0,filename.lastIndexOf('.'))+index+time1+fileForm;
					//파일명_유저id_날짜_시간.확장자
					p.write(path + filename);
					post.setImg("./upload/" + filename);
				}
			}
		}
		try {
			FollowDAO dao3 = new FollowDAO();
			FollowService service3 = new FollowServiceImpl(dao3);
			int followernum = service3.followernum(id).size();
			int follownum = service3.follownum(id).size();

			request.setAttribute("follower", followernum);
			request.setAttribute("follow", follownum);
			
			int result=service2.insertPosts(post);
			
			int count = service.postnum(id);
			user = service.profileImg(id);
			request.setAttribute("img", user.getImg()); // 프로필 부분 db가져오기.
			request.setAttribute("name", user.getName());
			request.setAttribute("info", user.getInfo());
			request.setAttribute("count", count);
			request.getRequestDispatcher("mypage.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("exception", e);
			getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
			// 에러가 발생하면 error라는 페이지로 포워딩을하는데, 서블릿에서 addbook함수를 실행할때 이미 함수에 catch문으로
			// 에러를 다 잡았기 때문에 넘어가지않는다. addbook에서 throw로 넘겨줘야 이 서블릿에서 에러가 발생해서 catch문으로 넘어감.
		}

	}

}
