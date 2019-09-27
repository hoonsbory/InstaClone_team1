package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.JDBCUtil;
import vo.CommentsVO;
import vo.InstaPost;

public class CommentsDAO {

	
	public  String selectAllComments(int post_id) throws Exception {
		String sql = "select c.id as id, u.id as user_id, u.name, u.img, nvl(c.content,' ') as content, c.timestamp from comments c join users u on c.user_id = u.id where post_id = ? order by timestamp";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		JSONArray array=new JSONArray();
		Map<String,String> map=new HashMap<String,String>();
		try {			
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, post_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				map.put("id",rs.getString("id"));
				map.put("user_id",rs.getString("user_id"));
				map.put("name",rs.getString("name"));
				map.put("img",rs.getString("img"));
				map.put("content",rs.getString("content"));
				map.put("timestamp",rs.getString("timestamp"));
				JSONObject obj=new JSONObject(map);
				array.add(obj);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return JSONArray.toJSONString(array);
	}
	
	
	public  CommentsVO selectComment(int id) throws Exception { //필요하면 쓰고 필요없으면 지우기
		String sql = "select * from comments where id = ? order by timestamp";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CommentsVO com=null;
		try {			
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, com.getPost_id());
			rs = ps.executeQuery();
			while (rs.next()) {
				com.setId(rs.getInt("id"));
				com.setContent(rs.getString("content"));
				com.setPost_id(rs.getInt("post_id"));
				com.setUser_id(rs.getInt("user_id"));
				com.setTimestamp(rs.getDate("timestamp"));
			}
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return com;
	}
	
	public  int deleteComment(int id) throws Exception {
		String sql = "delete from comments where id=? ";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	public  int insertComment(CommentsVO com) throws Exception {
		String sql = "insert into comments(id, content, post_id, user_id) values((select nvl(max(id),0)+1 from comments), ?,?,?) ";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, com.getContent());
			ps.setInt(2, com.getPost_id());
			ps.setInt(3, com.getUser_id());
			result = ps.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	public  int updateComment(CommentsVO com) throws Exception {
		String sql = "update comments set content = ? where id= ? ";
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, com.getContent());
			ps.setInt(2, com.getId());
			result = ps.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
}
