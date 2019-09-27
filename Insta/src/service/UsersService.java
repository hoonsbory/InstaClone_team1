package service;

import java.util.List;

import org.json.simple.JSONArray;

import vo.UsersVO;

public interface UsersService {
	List<UsersVO> searchAllUsers();
	int loginUser(UsersVO vo);
	int addUser(UsersVO vo);
	int dropUser(int id);
	List<String> searchUserAllImgs(int id);
	UsersVO searchUser(int id);
	int updateUserEmailNameInfo(UsersVO vo);
	int updateUserPassword(UsersVO vo);
	int updateUserImg(UsersVO vo);
	UsersVO profileImg(int id);
	int postnum(int id);
	JSONArray searchUsers(int id, String str) throws Exception;
}
