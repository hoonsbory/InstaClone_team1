package service;

import java.util.List;

import org.json.simple.JSONArray;

import dao.LikesDAO;
import vo.LikesVO;

public class LikesServiceimpl implements LikesService{
	LikesDAO dao;

	public LikesServiceimpl() {}

	public LikesServiceimpl(LikesDAO dao) {
		this.dao = dao;
	}
	

	public LikesDAO getDao() {
		return dao;
	}

	public void setDao(LikesDAO dao) {
		this.dao = dao;
	}

	@Override
	public int insertLikes(int user_id, int post_id) throws Exception {
		return dao.insertLikes(user_id, post_id);
	}

	@Override
	public int deleteLikes(int post_id, int user_id) throws Exception {
		return dao.deleteLikes(post_id, user_id);
	}

	@Override
	public List<LikesVO> countLikes(int post_id) throws Exception {
		return dao.countLikes(post_id);
	}

	@Override
	public int checkMyLike(int post_id, int user_id) throws Exception {
		return dao.checkMyLike(post_id, user_id);
	}

	@Override
	public JSONArray selectLikes(int id) throws Exception {
		return dao.selectLikes(id);
	}


	
	
}
