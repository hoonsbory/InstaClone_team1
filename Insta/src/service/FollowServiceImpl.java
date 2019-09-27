package service;

import java.util.List;

import org.json.simple.JSONArray;

import dao.FollowDAO;

public class FollowServiceImpl implements FollowService{
	FollowDAO dao;
	
	public FollowServiceImpl() {}

	public FollowServiceImpl(FollowDAO dao) {
		this.dao = dao;
	}

	@Override
	public int insertFollow(int follow, int follower) throws Exception {
		return dao.followInsert(follow, follower);
	}

	@Override
	public int deleteFollow(int follow, int follower) throws Exception {
		return dao.followDelete(follow , follower);
	}

	@Override
	public int checkFollow(int follow, int follower) throws Exception {
		return dao.followCheck(follow, follower);
	}

	@Override
	public List<String> followernum(int yourid) throws Exception {
		return dao.followernum(yourid);
	}

	@Override
	public List<String> follownum(int myid) throws Exception {
		return dao.follownum(myid);
	}

	@Override
	public JSONArray selectFollow(int id) throws Exception {
		return dao.selectFollow(id);
	}

	@Override
	public JSONArray followList(int id) throws Exception {
		return dao.followlist(id);
	}

	@Override
	public JSONArray followerList(int id) throws Exception {
		return dao.followerlist(id);
	}
	
	
}
