package vo;

import java.sql.Date;

public class InstaPost {
	int id;
	int uid;
	int user_id;
	String content;
	String img;
	Date timestamp;
	String name;
	String uimg;
	String email;
	public InstaPost() {
		
		
	}
public InstaPost(String img , int id) {
	this.img = img;
	this.id = id;
		
	}
	public InstaPost(String name, String uimg, String content, String img, Date timestamp) {
		super();
		this.name = name;
		this.uimg = uimg;
		this.content = content;
		this.img = img;
		this.timestamp = timestamp;
	}
	
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUimg() {
		return uimg;
	}
	public void setUimg(String uimg) {
		this.uimg = uimg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + id;
		result = prime * result + ((img == null) ? 0 : img.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((timestamp == null) ? 0 : timestamp.hashCode());
		result = prime * result + uid;
		result = prime * result + ((uimg == null) ? 0 : uimg.hashCode());
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
		InstaPost other = (InstaPost) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id != other.id)
			return false;
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (timestamp == null) {
			if (other.timestamp != null)
				return false;
		} else if (!timestamp.equals(other.timestamp))
			return false;
		if (uid != other.uid)
			return false;
		if (uimg == null) {
			if (other.uimg != null)
				return false;
		} else if (!uimg.equals(other.uimg))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "InstaPost [id=" + id + ", uid=" + uid + ", content=" + content + ", img=" + img + ", timestamp="
				+ timestamp + ", name=" + name + ", uimg=" + uimg + ", email=" + email + "]";
	}
	
	
	
}
