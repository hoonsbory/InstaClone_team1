package servlet;

import java.util.List;

import dao.UsersDAO;
import service.UsersService;
import service.UsersServiceImpl;

public class Test01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String login="1/김상희";
		int id=Integer.parseInt(login.substring(0,login.lastIndexOf('/')));
		UsersDAO dao=new UsersDAO();
		UsersService service=new UsersServiceImpl(dao);
		List<String> list=service.searchUserAllImgs(id);
		System.out.println(list);
		list.forEach(i->System.out.println(i));
	}

}
