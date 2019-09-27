package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.JDBCUtil;
import vo.UsersVO;

public class FollowDAO {
	
	// 팔로우 등록 
	public  int followInsert(int follow, int follower) throws Exception {
		String sql = "insert into follower_map(id , target_id, follower_id) values(?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, Integer.toString(follow)+"+"+Integer.toString(follower));
			ps.setInt(2, follow);
			ps.setInt(3, follower);
			result = ps.executeUpdate();
			// rs = ps.executeUpdate();

		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	// 팔로워 취소 
	public  int followDelete(int follow ,int follower) throws Exception {
		String sql = "delete from follower_map where id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, Integer.toString(follow)+"+"+Integer.toString(follower));
			result = ps.executeUpdate();
			
			// rs = ps.executeUpdate();
			
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	public int followCheck(int follow, int follower) throws Exception {
		String sql = "select id from follower_map where id=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, Integer.toString(follow)+"+"+Integer.toString(follower));
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			if(rs.next()) {
				count = 1;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		System.out.println(count);
		return count;
	}
	public List<String> follownum(int myid) throws Exception {
		String sql = "select id from follower_map where target_id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, myid);
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return list;
	}
	public List<String> followernum(int yourid) throws Exception {
		String sql = "select id from follower_map where follower_id =?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		List<String> list = new ArrayList<String>();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, yourid);
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return list;
	}
public JSONArray selectFollow(int id){
		
		String sql = "select u.img , u.name, f.timestamp , u.id from follower_map f join users u on f.target_id = u.id where f.follower_id = ? order by f.timestamp";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		JSONArray list = new JSONArray();
		SimpleDateFormat date = new SimpleDateFormat ("yyyy-MM-dd");
		Date today;
		String result;
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			rs = ps.executeQuery();	// update 는 executeUpdate
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("img2", rs.getString(1));
				obj.put("name2", rs.getString(2));
				today = rs.getDate(3);
				result = date.format(today);
				obj.put("time2", result);
				obj.put("id2", rs.getInt(4));
								
				
				if(obj!=null) 
					list.add(obj);
				System.out.println(result);
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		System.out.println(list);
		return list;
	}
//팔로우 리스트 
	public JSONArray followlist(int myid) throws Exception {
		String sql = "select u.img, u.name, u.email, u.id from follower_map f join users u on u.id = f.follower_id where f.target_id =?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		JSONArray list = new JSONArray();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, myid);
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("img", rs.getString(1));
				obj.put("name", rs.getString(2));
				obj.put("email", rs.getString(3));
				obj.put("id", rs.getString(4));
				
				if(obj!=null) list.add(obj);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return list;
	}
	//팔로워 리스트 
	public JSONArray followerlist(int myid) throws Exception {
		String sql = "select u.img, u.name, u.email, u.id from follower_map f join users u on u.id = f.target_id where f.follower_id =?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		JSONArray list = new JSONArray();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, myid);
			rs = ps.executeQuery();
			// rs = ps.executeUpdate();
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("img", rs.getString(1));
				obj.put("name", rs.getString(2));
				obj.put("email", rs.getString(3));
				obj.put("id", rs.getString(4));
				if(obj!=null) list.add(obj);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return list;
	}
}
