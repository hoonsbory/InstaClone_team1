package vo;

import java.sql.Date;

public class CommentsVO {
	int id;
	String content;
	Date timestamp;
	int post_id;
	int user_id;
	
	public CommentsVO() {
		super();
	}
	
	public CommentsVO(String content, int post_id, int user_id) {
		super();
		this.content = content;
		this.post_id = post_id;
		this.user_id = user_id;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "InstaComment [id=" + id + ", content=" + content + ", timestamp=" + timestamp + ", post_id=" + post_id
				+ ", user_id=" + user_id + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + post_id;
		result = prime * result + user_id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentsVO other = (CommentsVO) obj;
		if (id != other.id)
			return false;
		if (post_id != other.post_id)
			return false;
		if (user_id != other.user_id)
			return false;
		return true;
	}
	
	
	
}
