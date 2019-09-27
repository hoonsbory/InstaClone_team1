package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.JDBCUtil;
import vo.PostsVO;

public class PostsDAO {
	
	//Select All
	public static JSONArray getAllPostJSON(int i) {
		int result = 0;
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Statement st = null;
		String sql = "select img,id from posts where user_id = ? order by timestamp desc";
		JSONArray list = new JSONArray();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, i);
			rs = ps.executeQuery();

			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getString(1));
				obj.put("postid", rs.getInt(2));
				if (obj != null)
					list.add(obj);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return list;

	}
	public List<PostsVO> getAllPostsRec(int user_id){
		List<PostsVO> list = new ArrayList<PostsVO>();
		
		String sql = "select img from posts where user_id = ?";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, user_id);
			
			rs = ps.executeQuery();	// select 는 executeQuery
			
			while(rs.next()) {
				list.add(new PostsVO(rs.getInt("id"),
									rs.getString("content"),
									rs.getInt("user_id"),
									rs.getString("img")));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return list;
		
	}
	
	public int insertPosts(PostsVO vo){
		List<PostsVO> list = new ArrayList<PostsVO>();
		
		String sql = "insert into posts (id, content , img, user_id) values((select nvl(max(id),0)+1 from posts),?,?,?)";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, vo.getContent());
			ps.setString(2, vo.getImg());
			ps.setInt(3, vo.getUser_id());
			
			System.out.println(0);
			result = ps.executeUpdate();	// update 는 executeUpdate
			System.out.println(1);
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	public int deletePosts(int id){
		List<PostsVO> list = new ArrayList<PostsVO>();
		
		String sql = "delete from posts where id = ?";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			result = ps.executeUpdate();	// update 는 executeUpdate
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	public int updatePosts(PostsVO vo){
		List<PostsVO> list = new ArrayList<PostsVO>();
		
		String sql = "update posts set content = ? where id = ?";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, vo.getContent());
			ps.setInt(2, vo.getId());
			
			result = ps.executeUpdate();	// update 는 executeUpdate
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
public Map<String, String> showPosts(int id){
		
		String sql = "select p.id as p_id,p.content as p_content,p.img as p_img,p.timestamp as p_timestamp,u.id as u_id,u.img as u_img,u.name as u_name from posts p join users u on p.user_id=u.id where p.id = ? ";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		
		
		Map<String, String> map = new HashMap<>();
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {
				map.put("post_id",rs.getString("p_id"));
				map.put("post_content",rs.getString("p_content"));
				map.put("post_img",rs.getString("p_img"));
				map.put("post_timestamp",rs.getString("p_timestamp"));
				map.put("user_id",rs.getString("u_id"));
				map.put("user_img",rs.getString("u_img"));
				map.put("user_name",rs.getString("u_name"));
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return map;
	}

public Map<String, Integer> besidePosts(int user_id, int post_id){
	String sql = " select * from (select id, lead(id,1,'-1') over (order by timestamp desc) next_id, lag(id,1,'-1') over (order by timestamp desc) past_id from posts where user_id=?) where id=?";
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs=null;
	Map<String,Integer> map=new HashMap<String, Integer>();
	
	try {
		con = JDBCUtil.getConnection();
		ps = con.prepareStatement(sql);
		
		ps.setInt(1, user_id);
		ps.setInt(2, post_id);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			map.put("id",rs.getInt("id"));
			map.put("past_id",rs.getInt("past_id"));
			map.put("next_id",rs.getInt("next_id"));
		}
	}catch (SQLException e) {
		e.printStackTrace();
	} finally {
		JDBCUtil.close(con, ps, null);
	}
	return map;
}


}
