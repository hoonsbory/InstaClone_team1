package service;

import java.util.List;

import org.json.simple.JSONArray;

public interface FollowService {
	int insertFollow(int follow, int follower) throws Exception;
	int deleteFollow(int follow , int follower) throws Exception;
	int checkFollow(int follow, int follower) throws Exception;
	List<String> followernum(int yourid) throws Exception;
	List<String> follownum(int myid) throws Exception;
	JSONArray selectFollow(int id) throws Exception;
	JSONArray followList(int id) throws Exception;
	JSONArray followerList(int id) throws Exception;
}

