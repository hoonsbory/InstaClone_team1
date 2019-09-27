package service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;

import dao.CommentsDAO;
import vo.CommentsVO;

public class CommentsServiceImpl implements CommentsService{
	
	CommentsDAO dao;
	
	public CommentsServiceImpl() {}
	public CommentsServiceImpl(CommentsDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public String selectAllComments(int post_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectAllComments(post_id);
	}
	
	@Override
	public CommentsVO selectComment(int id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectComment(id);
	}

	@Override
	public int deleteComment(int id) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteComment(id);
	}

	@Override
	public int insertComment(CommentsVO com) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertComment(com);
	}

	@Override
	public int updateComment(CommentsVO com) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateComment(com);
	}
	

}
