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
import vo.CommentsVO;
import vo.LikesVO;
import vo.PostsVO;

public class LikesDAO {
	public int insertLikes(int user_id, int post_id) throws Exception {
		
		String sql = "insert into likes(user_id, post_id) values(?,?)";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, user_id);
			ps.setInt(2, post_id);
			
			result = ps.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	public int deleteLikes(int post_id, int user_id) throws Exception {
		List<LikesVO> list = new ArrayList<LikesVO>();
		
		String sql = "delete from likes where post_id = ? and user_id = ?";
		
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, post_id);
			ps.setInt(2, user_id);
			
			result = ps.executeUpdate();	// update 는 executeUpdate
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, null);
		}
		return result;
	}
	
	public List<LikesVO> countLikes(int post_id) throws Exception {
		List<LikesVO> list = new ArrayList<LikesVO>();
		String sql = "select * from likes where post_id = ? ";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {			
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, post_id);
			
			rs = ps.executeQuery();	// select 는 executeQuery
			
			while(rs.next()) {
				list.add(new LikesVO(rs.getInt("user_id"),
									rs.getInt("post_id")));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return list;
	}
	
	public int checkMyLike(int post_id, int user_id) throws Exception {
		String sql = "select * from likes where post_id = ? and user_id = ?";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count=0;
		try {			
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, post_id);
			ps.setInt(2, user_id);
			
			rs = ps.executeQuery();	// select 는 executeQuery
			
			while(rs.next()) {
				count++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return count;
	}
	public JSONArray selectLikes(int id) throws Exception {
		String sql = "select u2.img , u2.name, l.timestamp , u2.id , p.img from likes l join posts p on l.post_id = p.id join users u on p.user_id = u.id join users u2 on l.user_id = u2.id where u2.id !=? and u.id = ? union select u3.img , u3.name, f.timestamp, u3.id , f.fcheck from follower_map f join users u3 on f.target_id = u3.id where f.follower_id = ? order by 3 desc";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count=0;
		String date;
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		JSONArray list = new JSONArray();
		try {			
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, id);
			ps.setInt(3, id);
			
			rs = ps.executeQuery();	// select 는 executeQuery
			
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("img" , rs.getString(1));
				obj.put("name" , rs.getString(2));
				date = format1.format(rs.getDate(3));
				obj.put("time" , date);
				obj.put("id" , rs.getInt(4));
				obj.put("post" , rs.getString(5));
				if(obj!=null) {
					list.add(obj);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, ps, rs);
		}
		return list;
	}
}
