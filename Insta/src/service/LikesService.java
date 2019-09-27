package service;

import java.util.List;

import org.json.simple.JSONArray;

import dao.LikesDAO;
import vo.LikesVO;

public interface LikesService {
	int insertLikes(int user_id, int post_id) throws Exception;
	int deleteLikes(int post_id, int user_id) throws Exception;
	List<LikesVO> countLikes(int post_id) throws Exception;
	int checkMyLike(int post_id, int user_id) throws Exception;
	JSONArray selectLikes(int id) throws Exception;
}
