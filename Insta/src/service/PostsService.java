package service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;

import vo.PostsVO;

public interface PostsService {
	
	List<PostsVO> getAllPostsRec(int user_id);
	int insertPosts(PostsVO vo);
	int deletePosts(int id);
	int updatePosts(PostsVO vo);
	Map<String, String> showPosts(int id);
	Map<String, Integer> besidePosts(int user_id, int post_id);
	JSONArray getAllPost(int id);
}
