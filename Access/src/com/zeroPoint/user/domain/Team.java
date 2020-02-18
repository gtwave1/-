package com.zeroPoint.user.domain;

/**
 * @author wave
 *
 */
public class Team {
	private String id;
	private String fid;
	private String sid;
	private String tid;
	private String foid;
	private String fiid;
	private String date;
	private String pid;
	private String gid;
	private String result;
	private String category;
	private String kind;
	private int score;
	
	public Team(String id, String fid, String sid, String tid, String foid, String fiid, String date, String pid,
			String gid, String result, String category, String kind, int score) {
		super();
		this.id = id;
		this.fid = fid;
		this.sid = sid;
		this.tid = tid;
		this.foid = foid;
		this.fiid = fiid;
		this.date = date;
		this.pid = pid;
		this.gid = gid;
		this.result = result;
		this.category = category;
		this.kind = kind;
		this.score = score;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public Team(String id, String fid, String tid, String foid, String fiid, String date, String pid, String gid,
			String result, String category, String kind, int score) {
		super();
		this.id = id;
		this.fid = fid;
		this.tid = tid;
		this.foid = foid;
		this.fiid = fiid;
		this.date = date;
		this.pid = pid;
		this.gid = gid;
		this.result = result;
		this.category = category;
		this.kind = kind;
		this.score = score;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getFoid() {
		return foid;
	}
	public void setFoid(String foid) {
		this.foid = foid;
	}
	public String getFiid() {
		return fiid;
	}
	public void setFiid(String fiid) {
		this.fiid = fiid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	@Override
	public String toString() {
		return "Team [id=" + id + ", fid=" + fid + ", sid=" + sid + ", tid=" + tid + ", foid=" + foid + ", fiid=" + fiid
				+ ", date=" + date + ", pid=" + pid + ", gid=" + gid + ", result=" + result + ", category=" + category
				+ ", kind=" + kind + ", score=" + score + "]";
	}
	public Team() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Team(String id, String fid, String tid, String foid, String fiid, String date, String pid, String gid,
			String result, String category, String kind) {
		super();
		this.id = id;
		this.fid = fid;
		this.tid = tid;
		this.foid = foid;
		this.fiid = fiid;
		this.date = date;
		this.pid = pid;
		this.gid = gid;
		this.result = result;
		this.category = category;
		this.kind = kind;
	}
	
}
