package service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;

import vo.CommentsVO;

public interface CommentsService {
	String selectAllComments(int post_id) throws Exception;
	CommentsVO selectComment(int id) throws Exception;
	int deleteComment(int id) throws Exception;
	int insertComment(CommentsVO com) throws Exception;
	int updateComment(CommentsVO com) throws Exception;
}
