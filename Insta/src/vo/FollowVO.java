package vo;

public class FollowVO {
	int id; //number(15) primary key,
    int target_id; // number(15),
    int follower_id; //number(15)
    
    
    
	public FollowVO() {}

	public FollowVO(int id, int target_id, int follower_id) {
		this.id = id;
		this.target_id = target_id;
		this.follower_id = follower_id;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTarget_id() {
		return target_id;
	}

	public void setTarget_id(int target_id) {
		this.target_id = target_id;
	}

	public int getFollower_id() {
		return follower_id;
	}

	public void setFollower_id(int follower_id) {
		this.follower_id = follower_id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + follower_id;
		result = prime * result + id;
		result = prime * result + target_id;
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
		FollowVO other = (FollowVO) obj;
		if (follower_id != other.follower_id)
			return false;
		if (id != other.id)
			return false;
		if (target_id != other.target_id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "FollowerVO [id=" + id + ", target_id=" + target_id + ", follower_id=" + follower_id + "]";
	}
}



